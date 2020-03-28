create or replace rule redirect_insert_to_inherited_table_1
    as on insert to hub_table
        where new.id between 0 and 10000
    do instead insert into inherited.inherited_table_1 values (NEW.id, NEW.name);

create or replace rule redirect_to_inherited_table_2
    as on insert to hub_table
        where new.id between 10001 and 20000
    do instead insert into inherited.inherited_table_2 values (NEW.id, NEW.name);

create or replace rule redirect_to_inherited_table_3
    as on insert to hub_table
        where new.id between 20001 and 30000
    do instead insert into inherited.inherited_table_3 values (NEW.id, NEW.name);

create or replace rule redirect_to_inherited_table_4
    as on insert to hub_table
        where new.id between 30001 and 40000
    do instead insert into inherited.inherited_table_4 values (NEW.id, NEW.name);

create or replace rule redirect_to_inherited_table_5
    as on insert to hub_table
        where new.id between 40001 and 50000
    do instead insert into inherited.inherited_table_5 values (NEW.id, NEW.name);

create or replace rule redirect_to_inherited_table_6
    as on insert to hub_table
        where new.id between 50001 and 60000
    do instead insert into inherited.inherited_table_6 values (NEW.id, NEW.name);

create or replace rule redirect_to_inherited_table_7
    as on insert to hub_table
        where new.id between 60001 and 70000
    do instead insert into inherited.inherited_table_7 values (NEW.id, NEW.name);

create or replace rule redirect_to_inherited_table_8
    as on insert to hub_table
        where new.id between 70001 and 80000
    do instead insert into inherited.inherited_table_8 values (NEW.id, NEW.name);

create or replace rule redirect_to_inherited_table_9
    as on insert to hub_table
        where new.id between 80001 and 90000
    do instead insert into inherited.inherited_table_9 values (NEW.id, NEW.name);

create or replace rule redirect_to_inherited_table_10
    as on insert to hub_table
        where new.id between 90001 and 100000
    do instead insert into inherited.inherited_table_10 values (NEW.id, NEW.name);