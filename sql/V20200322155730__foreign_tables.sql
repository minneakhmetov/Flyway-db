begin
create extension postgres_fdw;
CREATE SCHEMA schema1;
CREATE SCHEMA schema2;
CREATE SCHEMA schema3;
create table schema1.schema_table
(
    id        bigserial,
    new_field int
);
create table schema2.schema_table
(
    id        bigserial,
    new_field int
);
create table schema3.schema_table
(
    id        bigserial,
    new_field int
);

CREATE SERVER foreign_server
    FOREIGN DATA WRAPPER postgres_fdw
    OPTIONS (host 'localhost', port '5432', dbname 'postgres');

CREATE USER MAPPING FOR postgres
    SERVER foreign_server
    OPTIONS (user 'postgres', password 'postgres');

CREATE FOREIGN TABLE schema1_table (
    id        bigserial,
    new_field int
    )
    SERVER foreign_server
    OPTIONS (schema_name 'schema1', table_name 'schema_table');
CREATE FOREIGN TABLE schema2_table (
    id        bigserial,
    new_field int
    )
    SERVER foreign_server
    OPTIONS (schema_name 'schema2', table_name 'schema_table');
CREATE FOREIGN TABLE schema3_table (
    id        bigserial,
    new_field int
    )
    SERVER foreign_server
    OPTIONS (schema_name 'schema3', table_name 'schema_table');
end;
