create table disabled_autovacuum(
    id bigserial,
    name text
) with (autovacuum_enabled = false);
insert into disabled_autovacuum (name) values ('lkcndslknvc');