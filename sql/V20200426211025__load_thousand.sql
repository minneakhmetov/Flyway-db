drop view instead_view;
create view instead_view as select string, sum(number) as number from instead group by string;
CREATE TRIGGER instead_trigger
    instead of INSERT on instead_view
    FOR EACH ROW EXECUTE PROCEDURE instead_func();
DO
$do$
    BEGIN
        FOR i IN 1..1000 LOOP
                insert into instead_view (string, number) VALUES ('f;jewklf', floor(random() * 50000 + 1)::int);
        END LOOP;
    END
$do$;