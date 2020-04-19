create table table_1 (text_column text);
create table table_2 ();
DO
$$
    BEGIN
        FOR i IN 1..100 LOOP
                EXECUTE 'alter table table_1 add column bigint_' || i || ' bigint';
                EXECUTE 'alter table table_2 add column bigint_' || i || ' bigint';
        END LOOP;
    END
$$;
alter table table_2 add column text_column text;