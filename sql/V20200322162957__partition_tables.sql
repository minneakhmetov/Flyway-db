create schema partitions;
create table partition_table (
    id bigserial,
    new_filed int
) partition by range (id);

create table partitions.partition_table_1 partition of partition_table for values (0) to (10000);
create table partitions.partition_table_2 partition of partition_table for values (10001) to (20000);
create table partitions.partition_table_3 partition of partition_table for values (20001) to (30000);
create table partitions.partition_table_4 partition of partition_table for values (30001) to (40000);
create table partitions.partition_table_5 partition of partition_table for values (40001) to (50000);
create table partitions.partition_table_6 partition of partition_table for values (50001) to (60000);
create table partitions.partition_table_7 partition of partition_table for values (60001) to (70000);
create table partitions.partition_table_8 partition of partition_table for values (70001) to (80000);
create table partitions.partition_table_9 partition of partition_table for values (80001) to (90000);
create table partitions.partition_table_10 partition of partition_table DEFAULT;

