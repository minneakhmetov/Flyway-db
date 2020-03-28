create schema inherited;
create table hub_table (
    id bigserial,
    name text
);
create table inherited.inherited_table_1 () inherits (hub_table);
create table inherited.inherited_table_2 () inherits (hub_table);
create table inherited.inherited_table_3 () inherits (hub_table);
create table inherited.inherited_table_4 () inherits (hub_table);
create table inherited.inherited_table_5 () inherits (hub_table);
create table inherited.inherited_table_6 () inherits (hub_table);
create table inherited.inherited_table_7 () inherits (hub_table);
create table inherited.inherited_table_8 () inherits (hub_table);
create table inherited.inherited_table_9 () inherits (hub_table);
create table inherited.inherited_table_10 () inherits (hub_table);

alter table inherited.inherited_table_1 add constraint id_1 check ( id > 0 and id < 10000 );
alter table inherited.inherited_table_2 add constraint id_2 check ( id > 10001 and id < 20000 );
alter table inherited.inherited_table_3 add constraint id_3 check ( id > 20001 and id < 30000 );
alter table inherited.inherited_table_4 add constraint id_4 check ( id > 30001 and id < 40000 );
alter table inherited.inherited_table_5 add constraint id_5 check ( id > 40001 and id < 50000 );
alter table inherited.inherited_table_6 add constraint id_6 check ( id > 50001 and id < 60000 );
alter table inherited.inherited_table_7 add constraint id_7 check ( id > 60001 and id < 70000 );
alter table inherited.inherited_table_8 add constraint id_8 check ( id > 70001 and id < 80000 );
alter table inherited.inherited_table_9 add constraint id_9 check ( id > 80001 and id < 90000 );
alter table inherited.inherited_table_10 add constraint id_10 check ( id > 90001 and id < 100000 );