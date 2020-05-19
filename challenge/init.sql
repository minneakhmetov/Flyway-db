create table test (
    id int,
    name text
);
DO
$do$
    BEGIN
        FOR i IN 1..10000 LOOP
                insert into test (id, name) VALUES (floor(random() * 50000 + 1)::int, 'f;jewklf');
            END LOOP;
    END
$do$;
create index id_index on test(id);