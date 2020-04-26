create table instead (
    string text,
    number int
);

create view instead_view as select string, sum(number) from instead group by string;

CREATE OR REPLACE FUNCTION instead_func() RETURNS TRIGGER AS $emp_audit$
BEGIN
    IF (TG_OP = 'INSERT') THEN
        insert into instead (string, number) VALUES (new.string, new.number);
        return new;
    END IF;
    RETURN NULL; -- возвращаемое значение для триггера AFTER игнорируется
END;
$emp_audit$ LANGUAGE plpgsql;

CREATE TRIGGER instead_trigger
    instead of INSERT on instead_view
    FOR EACH ROW EXECUTE PROCEDURE instead_func();