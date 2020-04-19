begin;
prepare my_ps (text) as insert into prepared_table (name)
                        values ($1);
execute my_ps(1, 'vjnsklvns');
deallocate my_ps;
commit;