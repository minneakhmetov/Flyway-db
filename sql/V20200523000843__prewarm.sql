create table new_table_1 (
    id bigserial,
    name text
);
create table new_table_2 (
     id bigserial,
     name text
);
create table new_table_3 (
     id bigserial,
     name text
);

DO
$do$
    BEGIN
        FOR i IN 1..1000 LOOP
                insert into new_table_1 (name) values (random_string(15));
                insert into new_table_2 (name) values (random_string(15));
                insert into new_table_3 (name) values (random_string(15));
            END LOOP;
    END
$do$;

DO
$do$
    BEGIN
        FOR i IN 1..10000 LOOP
                insert into new_table_1 (name) values (random_string(15));
                insert into new_table_2 (name) values (random_string(15));
                insert into new_table_3 (name) values (random_string(15));
            END LOOP;
    END
$do$;

DO
$do$
    BEGIN
        FOR i IN 1..100000 LOOP
                insert into new_table_1 (name) values (random_string(15));
                insert into new_table_2 (name) values (random_string(15));
                insert into new_table_3 (name) values (random_string(15));
            END LOOP;
    END
$do$;

CREATE EXTENSION pg_prewarm;

SELECT pg_prewarm('table_1', 'table_2', 'table_3')