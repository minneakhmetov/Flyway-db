DO
$do$
    BEGIN
        FOR i IN 1..1000000 LOOP
            insert into partition_table(new_field) values (floor(random() * 50000 + 1)::int);
        END LOOP;
    END
$do$;