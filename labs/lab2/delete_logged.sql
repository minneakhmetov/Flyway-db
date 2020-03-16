do
$$
    declare
        rand int := floor(random() * 50000 + 1)::int;
    begin
        ;
        delete from logged_table where id = rand;
    end;
$$
