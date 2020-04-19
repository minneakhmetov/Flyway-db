\set id random(1,1000000)
\set id_1 random(1,1000000)
\set id_2 random(1,1000000)
begin;
update triggered_table set id = :id, name = :id_2 where id = :id_1;
commit;