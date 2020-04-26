#!/bin/bash
# variables
certs_path=$1
email='jenkinstomkat@inbox.ru'
server_host='ec2-54-225-29-46.compute-1.amazonaws.com'
client_host='ci.abakus-center.ru'

# Code
if [ -z "$certs_path" ]
then
    certs_path=".postgres"
fi

user=$(who am i | awk '{print $1}')
rnd_path=$(eval echo ~$user)
rnd="/.rnd"
rnd_path=$rnd_path$rnd

touch $rnd_path;

echo "Creating certs folder..."
mkdir $certs_path
cd $certs_path
echo "Created certs path"
echo "Certs path: $(pwd)"

apt update

apt install -yq pwgen

passphrase=$(pwgen 20 1)

echo "Creating server certificates..."

openssl genrsa -aes256 -out ca-key.pem -passout pass:$passphrase 4096

openssl req -new -x509 -days 365 -key ca-key.pem -sha256 -out ca.pem -passin pass:$passphrase -subj "/emailAddress=$email/CN=$server_host/O=MyOrganization/OU=MyUnit/C=US/ST=AR/L=Fayetteville"

openssl genrsa -out server-key.pem 4096

openssl req -subj "/CN=$server_host" -sha256 -new -key server-key.pem -out server.csr

echo subjectAltName = DNS:$server_host,DNS:$client_host,IP:127.0.0.1 >> extfile.cnf

echo extendedKeyUsage = serverAuth >> extfile.cnf

openssl x509 -req -days 365 -sha256 -in server.csr -CA ca.pem -CAkey ca-key.pem -CAcreateserial -out server-cert.pem -extfile extfile.cnf -passin pass:$passphrase

echo "Creating client certificates..."

openssl genrsa -out key.pem 4096

openssl req -subj "/CN=$client_host" -new -key key.pem -out client.csr

echo extendedKeyUsage = clientAuth > extfile-client.cnf

openssl x509 -req -days 365 -sha256 -in client.csr -CA ca.pem -CAkey ca-key.pem -CAcreateserial -out cert.pem -extfile extfile-client.cnf -passin pass:$passphrase

rm -v client.csr server.csr extfile.cnf extfile-client.cnf

chmod -v 0400 ca-key.pem key.pem server-key.pem
chmod -v 0444 ca.pem server-cert.pem cert.pem

echo "$passphrase" >> passphrase

echo "Passphrase for certificates saved in $(pwd)/passphrase";

echo "Saving client certificates..."
mkdir client
cp ca.pem client/ca.pem
mv cert.pem key.pem client/

chmod -R 444 client/*

echo "Client certificates saved in $(pwd)/client"

cp -R ca.pem server* /var/lib/postgresql/12/main/
