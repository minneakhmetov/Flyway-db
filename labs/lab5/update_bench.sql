\set id random(1,1000000)
\set id_1 random(1,1000000)
begin;
update hub_table set id = :id, name = 'jmcskld' where id = :id_1;
commit;