do
$$
    declare
        rand int := floor(random() * 50000 + 1)::int;
    begin
        ;
        update unlogged_table set field='cwecw' where id = rand;
    end;
$$
