create table index_table (
    a int,
    b int,
    c int
);
create index index_1 on index_table (a);
create index index_2 on index_table (b);
create index index_3 on index_table (c);
create index index_4 on index_table (a, b);
create index index_5 on index_table (a, c);
create index index_6 on index_table (b, c);
create index index_7 on index_table (a, b, c);

DO
$do$
    BEGIN
        FOR i IN 1..1000 LOOP
                insert into index_table (a, b, c) VALUES (floor(random() * 50000 + 1)::int, floor(random() * 50000 + 1)::int, floor(random() * 50000 + 1)::int);
            END LOOP;
    END
$do$;