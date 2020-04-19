

DO
$do$
    declare
        execute_query text := '';
    BEGIN
        FOR i IN 1..1000000 LOOP
            execute_query := 'insert into table_1 (';
            FOR i IN 1..99 LOOP
                execute_query := execute_query || 'bigint_' || i || ',';
            end loop;
            execute_query := execute_query || 'bigint_100) values (';
            FOR i IN 1..99 LOOP
                    execute_query := execute_query || floor(random() * 50000 + 1)::int || ',';
            end loop;
            execute_query := execute_query || floor(random() * 50000 + 1)::int || ')';
            execute execute_query;
            execute_query := 'insert into table_2 (';
            FOR i IN 1..99 LOOP
                    execute_query := execute_query || 'bigint_' || i || ',';
                end loop;
            execute_query := execute_query || 'bigint_100) values (';
            FOR i IN 1..99 LOOP
                    execute_query := execute_query || floor(random() * 50000 + 1)::int || ',';
                end loop;
            execute_query := execute_query || floor(random() * 50000 + 1)::int || ')';
            execute execute_query;
        END LOOP;
    END
$do$;