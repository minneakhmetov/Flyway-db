\set id random(1,10000)
SET effective_cache_size = '62 GB';
select * from test;
update test SET name = 'cknidncis' where id = :id;
insert into test (id, name) values (:id, 'nkjnacioen');
delete from test where id = :id;