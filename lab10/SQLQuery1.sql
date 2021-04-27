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
			values(floor(30000*rand()),REPLICATE('������', 10));
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
  while   @j < 20000       -- ���������� � ������� 20000 �����
  begin
       INSERT #EX(TKEY, TF) values(floor(30000*RAND()), replicate('������ ', 10));
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

 SELECT name [������], avg_fragmentation_in_percent [������������ (%)]
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

	SELECT name [������], avg_fragmentation_in_percent [������������ (%)]
       FROM sys.dm_db_index_physical_stats(DB_ID(N'TEMPDB'),    
       OBJECT_ID(N'#EX'), NULL, NULL, NULL) ss  JOIN sys.indexes ii 
                                     ON ss.object_id = ii.object_id and ss.index_id = ii.index_id  
                                                                                          WHERE name is not null;


use x_mybase

select * 
from ������
where ����_������� between 500 and 900 order by ����_������� 

checkpoint
DBCC DROPCLEANBUFFERS

create index #X_MB_NONCLU on ������(����_�������, ����������_�����������_������ )
select * from ������ order by ����_�������, ����������_�����������_������
select * from ������ where ����_������� =730 and ����������_�����������_������ >2

create index #OREDER_PRICE_X on ������(����_�������) include(����������_�����������_������)
select ����������_�����������_������ from ������ where ����_������� > 500

select ����������_�����������_������ from ������ where ����������_�����������_������>= 5 and ����������_�����������_������ <= 15

create index #ORDER_WHERE on ������(����������_�����������_������) where(����������_�����������_������>= 5 and ����������_�����������_������<= 15)

select * from ������� where ����>= 400 and ���� <=1000

 SELECT name [������], avg_fragmentation_in_percent [������������ (%)]
        FROM sys.dm_db_index_physical_stats(DB_ID(N'x_mybase'), 
        OBJECT_ID(N'������'), NULL, NULL, NULL) ss
        JOIN sys.indexes ii on ss.object_id = ii.object_id and ss.index_id = ii.index_id  
                                                                                                    WHERE name is not null;


