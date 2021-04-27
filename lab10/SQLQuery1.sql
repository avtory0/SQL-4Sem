--task 1
use university

exec SP_HELPINDEX 'AUDITORIUM'

use master

create table #explre
(
	tint int,
	tfield varchar(100)
)

drop table #explre
set nocount on;
declare @i int =1;
while @i<1000
	begin
		insert #explre (tint,tfield)
			values(floor(30000*rand()),REPLICATE('строка', 10));
		if(@i %100=0) print @i;
		set @i=@i+1;
	end;

select * from #explre where tint between 1500 and 2500 order by tint

create clustered index #explre_cl on #explre(tint asc)

select *from #explre

--task 2
use tempdb

CREATE table #EX
(    TKEY int, 
      CC int identity(1, 1),
      TF varchar(100)
)

  set nocount on;           
  declare @j int = 0;
  while   @j < 20000       -- добавление в таблицу 20000 строк
  begin
       INSERT #EX(TKEY, TF) values(floor(30000*RAND()), replicate('строка ', 10));
        set @j = @j + 1; 
  end;
  drop table #EX
create index #ex_nonclu on #ex(tkey,cc)
drop index #ex_nonclu
SELECT * from  #EX where  TKEY = 55i6 and  CC > 3 --0,39
SELECT * from  #EX where  TKEY > 1500 and  CC < 4500;  --0,39

select * from #EX

--task 3

create index #EX_TKEY_X on #ex(TKEY) include (cc)

select CC from #EX where TKEY > 1500

--task 4

SELECT TKEY from  #EX where TKEY between 5000 and 19999; 
SELECT TKEY from  #EX where TKEY>15000 and  TKEY < 20000  
SELECT TKEY from  #EX where TKEY=17000

CREATE  index #EX_WHERE on #EX(TKEY) where (TKEY>=15000 and 
 TKEY < 20000);  

 --task 5

 create index #EX_TKEY on #ex(TKEY)

 drop table #EX
  INSERT top(100000) #EX(TKEY, TF) select TKEY, TF from #EX;

 SELECT name [Индекс], avg_fragmentation_in_percent [Фрагментация (%)]
        FROM sys.dm_db_index_physical_stats(DB_ID(N'TEMPDB'), 
        OBJECT_ID(N'#EX'), NULL, NULL, NULL) ss
        JOIN sys.indexes ii on ss.object_id = ii.object_id and ss.index_id = ii.index_id  
                                                                                                    WHERE name is not null;

alter index #EX_TKEY on #ex reorganize

ALTER index #EX_WHERE on #EX rebuild with (online = off);


--------

create index #EX_TKEY on #EX(TKEY) with(fillfactor = 65)

INSERT top(50)percent INTO #EX(TKEY, TF) 
	SELECT TKEY, TF  FROM #EX;

	SELECT name [Индекс], avg_fragmentation_in_percent [Фрагментация (%)]
       FROM sys.dm_db_index_physical_stats(DB_ID(N'TEMPDB'),    
       OBJECT_ID(N'#EX'), NULL, NULL, NULL) ss  JOIN sys.indexes ii 
                                     ON ss.object_id = ii.object_id and ss.index_id = ii.index_id  
                                                                                          WHERE name is not null;


use x_mybase

select * 
from заказы
where цена_продажи between 500 and 900 order by цена_продажи 

checkpoint
DBCC DROPCLEANBUFFERS

create index #X_MB_NONCLU on заказы(цена_продажи, количество_заказанного_товара )
select * from заказы order by цена_продажи, количество_заказанного_товара
select * from заказы where цена_продажи =730 and количество_заказанного_товара >2

create index #OREDER_PRICE_X on заказы(цена_продажи) include(количество_заказанного_товара)
select количество_заказанного_товара from заказы where цена_продажи > 500

select количество_заказанного_товара from заказы where количество_заказанного_товара>= 5 and количество_заказанного_товара <= 15

create index #ORDER_WHERE on заказы(количество_заказанного_товара) where(количество_заказанного_товара>= 5 and количество_заказанного_товара<= 15)

select * from товарыы where цена>= 400 and цена <=1000

 SELECT name [Индекс], avg_fragmentation_in_percent [Фрагментация (%)]
        FROM sys.dm_db_index_physical_stats(DB_ID(N'x_mybase'), 
        OBJECT_ID(N'заказы'), NULL, NULL, NULL) ss
        JOIN sys.indexes ii on ss.object_id = ii.object_id and ss.index_id = ii.index_id  
                                                                                                    WHERE name is not null;


