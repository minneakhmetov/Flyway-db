create table triggered_table (
 id serial,
 name text);

create schema triggered;

CREATE OR REPLACE FUNCTION process_emp_audit() RETURNS TRIGGER AS $emp_audit$
    BEGIN
    IF (TG_OP = 'DELETE') THEN
        execute 'delete triggered.table_' || ceil(new.id / 10000) || 'where id = ' || new.id || ';';
        RETURN OLD;
    ELSIF (TG_OP = 'UPDATE') THEN
        if ceil(new.id / 10000) = ceil(old.id / 10000) then
            EXECUTE 'update triggered.table_' || ceil(new.id / 10000) || ' set name = new.name where id = new.id';
        else
            EXECUTE 'delete from triggered.table_' || ceil(old.id / 10000) || ' where id = ' || old.id;
            EXECUTE 'insert into triggered.table_' || ceil(new.id / 10000) || '(id, name) values (' || new.id ||',' || new.name || ') where id = ' || new.id;
        end if;
        RETURN NEW;
    ELSIF (TG_OP = 'INSERT') THEN
        IF (select not exists(SELECT FROM information_schema.tables WHERE  table_schema = 'triggered' AND table_name  = 'table_' || ceil(new.id / 10000))) then
            execute 'create table triggered.table_' || ceil(new.id / 10000) || ' (id bigint, name text);';
        end if;
        execute 'insert into triggered.table_' || ceil(new.id / 10000) || ' (name) values (' || new.name || ');';
        RETURN NEW;
    END IF;
    RETURN NULL; -- возвращаемое значение для триггера AFTER игнорируется
END;
$emp_audit$ LANGUAGE plpgsql;

CREATE TRIGGER emp_audit
    AFTER INSERT OR UPDATE OR DELETE ON triggered_table
    FOR EACH ROW EXECUTE PROCEDURE process_emp_audit();