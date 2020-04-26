DO
$do$
    BEGIN
        FOR i IN 1..1000 LOOP
                insert into instead_view (string, number) VALUES ('f;jewklf', floor(random() * 50000 + 1)::int);
        END LOOP;
    END
$do$;