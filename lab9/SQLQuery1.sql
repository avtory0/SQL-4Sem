--task 1
declare @ch char = 'c',
		@vrchr varchar(4) = 'муха',
		@date datetime,
		@time time,
		@i int,
		@smi smallint,
		@tint tinyint,
		@num numeric(12,5);

set @date = getdate();
set @time = '23:00:12';

select @i = 1;
select @smi = 30000, @tint = 255;

print 'char: ' + @ch;
print 'varchar: ' + convert(char, @vrchr);
print 'time: ' + convert(char, @time);
select @i as int, @smi as smalint, @tint as tinyint;
-- task 2
use university

declare @capacity int = (select cast(sum(AUDITORIUM_CAPACITY) as int) from AUDITORIUM), 
		@count int,@avg_capacity int, @lowcount int
	if @capacity > 200
	begin
		select @count  = (select cast(count(*) as int) from AUDITORIUM),
			@avg_capacity = (select cast(avg(AUDITORIUM_CAPACITY) as int) from AUDITORIUM)

		set @lowcount = (select cast(count(*) as int) from AUDITORIUM
									where AUDITORIUM_CAPACITY > @avg_capacity)

		select @capacity 'Количество аудиторий, ', @avg_capacity 'Средняя вместимость', @lowcount 'вместимость меньше средней'
	end 
	else print 'Общая вместимость < 200'

select * from AUDITORIUM

-- task 3
select	@@ROWCOUNT 'Кол-во обработанных строк',
		@@VERSION 'Версия SQL Server-a',
		@@SPID 'Системный идентификатор процесса',
		@@ERROR 'Код последней ошибки',
		@@SERVERNAME 'Имя сервера',
		@@TRANCOUNT 'Уровень вложенности транзкции',
		@@FETCH_STATUS 'Статус команды выборки',
		@@NESTLEVEL 'Уровень вложенности'


-- task 4
Declare @t int = 1, @x float = 2.1, @z float;
if(@t>@x) set @z=power(sin(@t),2)
else if(@t<@x) set @z= 4*(@t+@x)
else set @z=1-exp(@x-2);
print 'z=' + cast(@z as varchar(15));


declare @FIO varchar(50), @F varchar(10), @Im varchar(5), @O varchar(5)
set @FIO='Жмышенко Валерий Альбертович'
declare @Socr int
set @Socr=CHARINDEX(' ',@FIO,1)
set @F= substring(@FIO,1,@Socr)
set @Im= substring(@FIO,@Socr+1,1)
set @Socr= charindex(' ',@FIO,@Socr+1)
set @O= substring(@FIO, @Socr+1,1)
select @F+' '+@Im+'.'+@O+'.'


DECLARE @DOfBirth int
SET @DOfBirth = MONTH(GETDATE());
SELECT NAME, BDAY,(SELECT YEAR(GETDATE())-YEAR(BDAY) - 1)[AGE] 
FROM STUDENTS WHERE MONTH(BDAY) = @DOfBirth+1




DECLARE @Day NVARCHAR(15), @data DATE;
SET @data =
(SELECT TOP(1) PROGRESS.PDATE
FROM PROGRESS
WHERE PROGRESS.SUBJECTS = 'СУБД');
SET @Day= CONVERT(NVARCHAR(15), DATEPART(DW,@data));
SET @Day= CASE @Day
WHEN '1' THEN 'Воскресенье'
WHEN '2' THEN 'Понедельник'
WHEN '3' THEN 'Вторник'
WHEN '4' THEN 'Средy'
WHEN '5' THEN 'Четверг'
WHEN '6' THEN 'Пятницy'
WHEN '7' THEN 'Субботy'
END
PRINT 'Экзамен по СУБД был в '+ @Day;

--task 5
use university
declare @x1 int = 0

set @x1 =(select Sum(AUDITORIUM_CAPACITY) from AUDITORIUM)
if @x1 > 200
	print 'общее кол-во мест больше 200'
else if @x1 > 100
	print 'общее кол-во мест от 100 до 200'
else if @x1 > 50
	print 'общее кол-во мест от 50 до 100'
else
	print 'общее кол-во мест меньше 50'
go

--task 6 

select IDSTUDENT, NOTE,
	case
	when NOTE between 7 and 10 then 'Очень хорошо'
	when NOTE between 5 and 6 then 'Норм'
	when NOTE between 4 and 5 then 'На грани'
	else 'Чел, ты..'
	end as ЫАЫА
from PROGRESS
where SUBJECTS = 'МП'

select * from PROGRESS


CREATE table #tables
 (  
 TIND int,  
 TFIELD varchar(100),
 Stolbec varchar(100)
 );
 select * from #tables
 alter table #tables drop column Stolbec;
set nocount on;
declare @varebal int = 0;
 while @varebal < 1000
	begin 
insert #tables(TIND, TFIELD)
	values(floor(30000*rand()),REPLICATE('строка', 10));
if(@varebal % 100 = 0)
	print @varebal;
set @varebal = @varebal+1;
end;
select * from #tables

use x_mybase

declare @x int = 10, @y int = 0, @z int
BEGIN TRY  
  set @z = @x/@y
END TRY  
BEGIN CATCH  
    print ERROR_NUMBER()
	print ERROR_MESSAGE()
	print ERROR_LINE()
	print ERROR_PROCEDURE()
	print ERROR_SEVERITY()
	print ERROR_STATE()
END CATCH;  


