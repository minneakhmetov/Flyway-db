DO
$do$
    BEGIN
        FOR i IN 1..1000000 LOOP
                insert into hub_table(name) values ('name');
            END LOOP;
    END
$do$;