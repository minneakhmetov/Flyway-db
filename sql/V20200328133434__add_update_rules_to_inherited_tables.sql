create or replace rule redirect_delete_to_inherited_table_1
    as on delete to hub_table
    where old.id between 0 and 10000
    do instead delete from inherited.inherited_table_1 where id = old.id;

create or replace rule redirect_delete_to_inherited_table_2
    as on delete to hub_table
    where old.id between 10001 and 20000
    do instead delete from inherited.inherited_table_2 where id = old.id;

create or replace rule redirect_delete_to_inherited_table_3
    as on delete to hub_table
    where old.id between 20001 and 30000
    do instead delete from inherited.inherited_table_3 where id = old.id;

create or replace rule redirect_delete_to_inherited_table_4
    as on delete to hub_table
    where old.id between 30001 and 40000
    do instead delete from inherited.inherited_table_4 where id = old.id;

create or replace rule redirect_delete_to_inherited_table_5
    as on delete to hub_table
    where old.id between 40001 and 50000
    do instead delete from inherited.inherited_table_5 where id = old.id;

create or replace rule redirect_delete_to_inherited_table_6
    as on delete to hub_table
    where old.id between 50001 and 60000
    do instead delete from inherited.inherited_table_6 where id = old.id;

create or replace rule redirect_delete_to_inherited_table_7
    as on delete to hub_table
    where old.id between 60001 and 70000
    do instead delete from inherited.inherited_table_7 where id = old.id;

create or replace rule redirect_delete_to_inherited_table_8
    as on delete to hub_table
    where old.id between 70001 and 80000
    do instead delete from inherited.inherited_table_8 where id = old.id;

create or replace rule redirect_delete_to_inherited_table_9
    as on delete to hub_table
    where old.id between 80001 and 90000
    do instead delete from inherited.inherited_table_9 where id = old.id;

create or replace rule redirect_delete_to_inherited_table_10
    as on delete to hub_table
    where old.id between 90001 and 100000
    do instead delete from inherited.inherited_table_10 where id = old.id;

create or replace function update_func(new_table record, old_table record) returns void as
    $$
    declare
        table_id bigint := ceil(new_table.id / 10000);
    begin
        if new_table.id = old_table.id then
            EXECUTE 'update inherited.inherited_table_' || table_id || ' set name = new_table.name where id = new_table.id';
        else
            delete from hub_table where id = old_table.id;
            insert into hub_table (id, name) values (new_table.id, new_table.name);
        end if;
    end;
    $$
language plpgsql;

create or replace rule redirect_delete_update_to_inherited_table_1
    as on update to hub_table
    do instead select update_func(new, old);