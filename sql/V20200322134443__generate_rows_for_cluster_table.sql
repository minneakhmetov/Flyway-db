DO
$do$
    BEGIN
        FOR i IN 1..10000 LOOP
            insert into clustered_table(new_field) values (floor(random() * 50000 + 1)::int);
        END LOOP;
    END
$do$;