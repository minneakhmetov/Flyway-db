for /L %%B in (4,1,100) do (
 echo %%B
    pgbench -U postgres -f sql/bench%%B.sql -T 120 -c 10 -l >> result/%%B.log
 )