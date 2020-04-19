create table triggered_table (
 id serial,
 name bigint);

create schema triggered;

CREATE OR REPLACE FUNCTION process_emp_audit() RETURNS TRIGGER AS $emp_audit$
    BEGIN
    IF (TG_OP = 'DELETE') THEN
        execute 'delete from triggered.table_' || ceil(old.id / 10000) || ' where id = ' || old.id || ';';
        RETURN OLD;
    ELSIF (TG_OP = 'UPDATE') THEN
        if ceil(new.id / 10000) = ceil(old.id / 10000) then
            EXECUTE 'update triggered.table_' || ceil(new.id / 10000) || ' set name = ' || new.name || ' where id = ' || new.id || ';';
        else
            EXECUTE 'delete from triggered.table_' || ceil(old.id / 10000) || ' where id = ' || old.id;

            EXECUTE 'insert into triggered.table_' || ceil(new.id / 10000) || ' (id, name) values (' || new.id ||',' || new.name || ');';
        end if;
        RETURN NEW;
    ELSIF (TG_OP = 'INSERT') THEN
        execute 'create table if not exists triggered.table_' || ceil(new.id / 10000) || ' (id bigint, name bigint);';
        execute 'insert into triggered.table_' || ceil(new.id / 10000) || ' (id, name) values (' || new.id || ',' || new.name || ');';
        RETURN NEW;
    END IF;
    RETURN NULL; -- возвращаемое значение для триггера AFTER игнорируется
END;
$emp_audit$ LANGUAGE plpgsql;

CREATE TRIGGER emp_audit
    AFTER INSERT OR UPDATE OR DELETE ON triggered_table
    FOR EACH ROW EXECUTE PROCEDURE process_emp_audit();
