Create or replace function random_string(length integer) returns text as
$$
declare
    chars text[] := '{A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,V,W,X,Y,Z,a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u,v,w,x,y,z}';
    result text := '';
    i integer := 0;
begin
    if length < 0 then
        raise exception 'Given length cannot be less than 0';
    end if;
    for i in 1..length loop
            result := result || chars[1+random()*(array_length(chars, 1)-1)];
        end loop;
    return result;
end;
$$ language plpgsql;

create table indexed_2_btree (
     id bigserial,
     name text
);

create table indexed_2_gin (
    id bigserial,
    name text
);

create table indexed_3_gist (
    id bigserial,
    name text
);

create index btree_index_2_2 on indexed_2_btree(name);
create index gin_index_2 on indexed_2_hash using gin(to_tsvector('english', name));
create index gist_index_2 on indexed_3_brin using gist(to_tsvector('english', name));

DO
$do$
    BEGIN
        FOR i IN 1..100000 LOOP
            insert into indexed_2_btree (name) values (random_string(15));
            insert into indexed_2_gin (name) values (random_string(15));
            insert into indexed_3_gist (name) values (random_string(15));
        END LOOP;
    END
$do$;