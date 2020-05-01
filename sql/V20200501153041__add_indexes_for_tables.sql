create table indexed_1_tbree (
    id bigint,
    name text
);

create table indexed_2_hash (
   id bigint,
   name text
);

create table indexed_3_brin (
   id bigint,
   name text
);

create index btree_index_1 on indexed_1_tbree(id);
create index btree_index_2 on indexed_2_hash using hash(id);
create index btree_index_3 on indexed_3_brin using brin(id);

DO
$do$
    BEGIN
        FOR i IN 1..1000 LOOP
                insert into indexed_1_tbree (id, name) values (floor(random() * 50000 + 1)::int, 'jndkjv.ns');
               insert into indexed_2_hash (id, name) values (floor(random() * 50000 + 1)::int, 'jndkjv.ns');
               insert into indexed_3_brin (id, name) values (floor(random() * 50000 + 1)::int, 'jndkjv.ns');
            END LOOP;
    END
$do$;