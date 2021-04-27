use master

set nocount on
	if  exists (select * from  SYS.OBJECTS        -- таблица X есть?
	            where OBJECT_ID= object_id(N'DBO.Test') )	            
	drop table Test;
	
declare @i int, @check char = 'c'
	set implicit_transactions on
	create table Test(colum nvarchar(10))
		insert Test values ('row1'),('row2'),('row3')
		set @i = (select count(*) from Test)
		print 'кол-во строок в таблице: ' + cast(@i as varchar(2))
		if @check = 'c' commit else rollback
		set implicit_transactions off

if  exists (select * from  SYS.OBJECTS       
	            where OBJECT_ID= object_id(N'DBO.Test') )
	print 'таблица X есть';  
      else print 'таблицы X нет'
go
--task 2

use university

begin try        
	begin tran                 -- начало  явной транзакции
		insert FACULTY values ('ДФ', 'Факультет других наук');
	    insert FACULTY values ('ПиМ', 'Факультет print-технологий');
	commit tran;               -- фиксация транзакции
end try

begin catch
	print 'ошибка: '+ case 
		when error_number() = 2627 and patindex('%FACULTY_PK%', error_message()) > 0 then 'дублирование '	--позиция 1-го вхождения
		else 'неизвестная ошибка: '+ cast(error_number() as  varchar(5))+ error_message()  
	end;
	if @@trancount > 0 rollback tran; -- ур.вложенности тр.>0,  транз не завершена 	  
end catch;

select * from FACULTY
DELETE FACULTY WHERE FACULTY = 'ДФ';
DELETE FACULTY WHERE FACULTY = 'ПиМ';

--task3

declare @point varchar(32)

begin try
	begin tran
		set @point = 'p1'
		save tran  @point --контр точка 1
		insert STUDENTS(IDGROUP, NAME, BDAY, INFO, FOTO) values
		                      (20,'Екатерина', '1997-08-02', NULL, NULL),
							  (20,'Александра', '1997-08-06', NULL, NULL),
							  (20,'Елизавета', '1997-08-01', NULL, NULL),
							  (20,'Ольга', '1997-08-03', NULL, NULL);    
		set @point = 'p2'
		save tran @point --контр. точка  2
		insert STUDENTS(IDGROUP, NAME, BDAY, INFO, FOTO) values
		                      (20,'Бобер', '1997-08-02', NULL, NULL)
		commit tran
end try

begin catch
	print 'ошибка: '+ case 
		when error_number() = 2627 and patindex('%STUDENT_PK%', error_message()) > 0 then 'дублирование студента' 
		else 'неизвестная ошибка: '+ cast(error_number() as	  varchar(5)) + error_message()  
	end; 
    if @@trancount > 0 -- если транзакция не завершена
	begin
	   print 'контрольная точка: '+ @point;
	   rollback tran @point; -- откат к последней контр.точке
	   commit tran; -- фиксация изменений, выполн до контр.точки 
	end;     
end catch;	
go
--task4

set transaction isolation level read uncommitted
begin transaction

----------------------t1-------------------
	select @@SPID, 'insert FACULTY' 'результат', * from FACULTY
										where FACULTY = 'ЛХФ'
	select @@SPID, 'update PULPIT' 'результат', * from PULPIT
										where FACULTY = 'ЛХФ'
	commit

-----------------------t2---------------------
begin transaction
	select @@SPID
	insert FACULTY values ('ОАО', 'Особый ангар отношений')
	update PULPIT set FACULTY = 'ИТ' where PULPIT = 'ЛХФ'
	
rollback

--task5

SELECT * from PULPIT;
set transaction isolation level READ COMMITTED
begin transaction
select count(*) from PULPIT
where FACULTY = 'ЛВ'; --Указывает одно значение, видим результат 0

-----t1-------
-----t2-------

select 'update PULPIT' 'результат', count(*) --здесь результат 1, т.к. произошло изменение
from PULPIT where FACULTY = 'ЛВ'; --работает неповторяющееся чтение
commit;
------B----

begin transaction

------t1-----

update PULPIT set FACULTY = 'ИТ' where PULPIT = 'ИСиТ';
commit;

--task6



------------------------------
use x_mybase

set nocount on
	if  exists (select * from  SYS.OBJECTS        -- таблица X есть?
	            where OBJECT_ID= object_id(N'DBO.Test') )	            
	drop table Test;
	
declare @i int, @check char = 'c'
	set implicit_transactions on
	create table Test(colum nvarchar(10))
		insert Test values ('row1'),('row2'),('row3')
		set @i = (select count(*) from Test)
		print 'кол-во строок в таблице: ' + cast(@i as varchar(2))
		if @check = 'c' commit else rollback
		set implicit_transactions off

if  exists (select * from  SYS.OBJECTS       
	            where OBJECT_ID= object_id(N'DBO.Test') )
	print 'таблица X есть';  
      else print 'таблицы X нет'

---task2

begin try        
	begin tran                 
		insert товарыы values ('фильтр', 450,'красный',7,'Завод №5');
	    delete товарыы where наименование_товара = 'что-то'
	commit tran;               
end try

begin catch
	print 'ошибка: '+ case 
		when error_number() = 2627 and patindex('%FACULTY_PK%', error_message()) > 0 then 'дублирование '	--позиция 1-го вхождения
		else 'неизвестная ошибка: '+ cast(error_number() as  varchar(5))+ error_message()  
	end;
	if @@trancount > 0 rollback tran; -- если >0 - транзакция не завершена	  
end catch;

select * from товарыы


--task3
 
declare @point varchar(32)

begin try
	begin tran
		set @point = 'p1'
		save tran  @point --контр точка 1
		insert товары values ('дверь',530,'входня',18,'Завод №3'); --ошибка   
		set @point = 'p2'
		save tran @point --контр. точка  2
		delete товарыы where наименование_товара = 'Тумбочка'
		commit tran
end try

begin catch
	print 'ошибка: '+ case 
		when error_number() = 2627 and patindex('%STUDENT_PK%', error_message()) > 0 then 'дублирование студента' 
		else 'неизвестная ошибка: '+ cast(error_number() as	  varchar(5)) + error_message()  
	end; 
    if @@trancount > 0 -- если транзакция не завершена
	begin
	   print 'контрольная точка: '+ @point;
	   rollback tran @point; -- откат к последней контр.точке
	   commit tran; -- фиксация изменений, выполн до контр.точки 
	end;     
end catch;	

--task4
set transaction isolation level read uncommitted
begin transaction

----------------------t1-------------------
	select @@SPID, 'insert товары' 'результат', * from товарыы
										where наименование_товара = 'стул'
	select @@SPID, 'update заказы' 'результат', * from заказы
										where наименование_заказанного_товара = 'стул'
	commit

-----------------------t2---------------------
begin transaction
	select @@SPID
	insert товарыы values ('ложка',46, 'Особая ложка',34,'Завод №1')
	update заказы set наименование_заказанного_товара = 'стул' where наименование_заказанного_товара = 'книжная полка'
	
rollback

select * from заказы

--task5
set transaction isolation level READ COMMITTED 
begin transaction 
	select count(*) from заказы where наименование_заказанного_товара = 'Стул';
	-------------------------- t1 ------------------ 
	-------------------------- t2 -----------------
	select  'update Заказы'  'результат', count(*)
	                           from заказы  where наименование_заказанного_товара = 'Стул';
	commit; 

	--- B ---	
begin transaction 	  
	-------------------------- t1 --------------------
    update заказы set наименование_заказанного_товара = 'Стул' 
                                       where наименование_заказанного_товара = 'камод' 
    commit; 

--task 6

set transaction isolation level  REPEATABLE READ 
	begin transaction 
	select покупатель from Заказы where наименование_заказанного_товара = 'Стул';
	-------------------------- t1 ------------------ 
	-------------------------- t2 -----------------
	select  case
          when покупатель = 'ООО БлэкРэдВайт' then 'insert  Заказы'  else ' ' 
end 'результат', покупатель from Заказы  where наименование_заказанного_товара = 'Стул';
	commit; 

	--- B ---	
	begin transaction 	  
	-------------------------- t1 --------------------
          insert Заказы values (12,23,580, '2020-01-12', 'Стул','ООО Амимебель');
          commit; 

--task7 serializable
insert товарыы values('Мягкая игрушка',879,'Акула', 75, 'Завод №5')
insert товарыы values('Подушка',543,'Мягкая', 43, 'Завод №3')
insert заказы values (32,87,454,'2020-01-25','Мягкая игрушка', 'Луч')
insert покупатель values ('Луч', 432534, 'Жодино')

--А
set transaction isolation level serializable
begin transaction

delete заказы where покупатель = 'Луч'
insert заказы values (32,87,454,'2020-01-25','Подушка', 'Луч')
update заказы set покупатель = 'Луч' where наименование_заказанного_товара = 'монитор'
select покупатель from заказы where наименование_заказанного_товара = 'монитор'
----------------t1-------------
select покупатель from заказы where наименование_заказанного_товара = 'монитор'
----------------t2-------------
commit
--B
begin transaction
delete заказы where покупатель = 'Луч'
insert заказы values (32,87,454,'2020-01-25','Подушка', 'Луч')
update заказы set покупатель = 'Луч' where наименование_заказанного_товара = 'монитор'
select покупатель from заказы where наименование_заказанного_товара = 'монитор'
----------------t1-------------
select покупатель from заказы where наименование_заказанного_товара = 'монитор'
commit

select * from заказы

--task8

begin tran 
	insert покупатель values('покупатель',543423,'Лида')
	begin tran
		update заказы set покупатель = 'покупатель' where покупатель = 'Луч'
		commit
		if @@TRANCOUNT > 0 rollback
	select 
	(select count (*) from заказы where покупатель = 'покупатель') 'Заказы',
	(select count (*) from покупатель where покупатель = 'покупатель') 'Заказчики';

select * from покупатель