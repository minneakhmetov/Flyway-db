do
$$
    declare
        rand int := floor(random() * 1000 + 1)::int;
    begin
        ;
        delete from logged_table where id = rand;
    end;
$$
