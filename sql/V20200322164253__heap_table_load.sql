alter table partition_table rename column new_filed to new_field;
DO
$do$
    BEGIN
        FOR i IN 1..1000000 LOOP
            insert into partition_table(new_field) values (floor(random() * 50000 + 1)::int);
        END LOOP;
    END
$do$;