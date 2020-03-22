create table clustered_table(
    id bigserial,
    new_field int
);
create index if not exists clustered_table_index on clustered_table (new_field);