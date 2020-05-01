select *
from join_1
         inner join join_2 on join_2.id = join_1.id
         full outer join join_3 on join_3.id = join_1.id
         left join join_4 on join_4.id = join_1.id
         right join join_5 on join_5.id = join_1.id
         join join_6 on join_5.id = join_1.id
         inner join join_7 on join_7.id = join_1.id;
