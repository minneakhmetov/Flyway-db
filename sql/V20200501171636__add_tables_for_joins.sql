create table join_1
(
    id   bigserial,
    name text
);
create table join_2
(
    id   bigserial,
    name text
);
create table join_3
(
    id   bigserial,
    name text
);
create table join_4
(
    id   bigserial,
    name text
);
create table join_5
(
    id   bigserial,
    name text
);
create table join_6
(
    id   bigserial,
    name text
);
create table join_7
(
    id   bigserial,
    name text
);

DO
$do$
    BEGIN
        FOR i IN 1..10000 LOOP
                insert into join_1 (name) values ('jndkjv.ns');
                insert into join_2 (name) values ('jndkjv.ns');
                insert into join_3 (name) values ('jndkjv.ns');
                insert into join_4 (name) values ('jndkjv.ns');
                insert into join_5 (name) values ('jndkjv.ns');
                insert into join_6 (name) values ('jndkjv.ns');
                insert into join_7 (name) values ('jndkjv.ns');
        END LOOP;
    END
$do$;