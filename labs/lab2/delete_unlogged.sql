do
$$
    declare
        rand int := floor(random() * 50000 + 1)::int;
    begin
        ;
        delete from unlogged_table where id = rand;
    end;
$$
