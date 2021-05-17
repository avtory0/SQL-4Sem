use university

--task 1 Подсчет кол-ва студентов
go 
create function Count_Students(@facode varchar(20)) returns int as begin declare @cnt int = 0
set @cnt = (select count(IDSTUDENT) from STUDENTS join GROUPS
			on STUDENTS.IDGROUP = GROUPS.IDGROUP join FACULTY
			on GROUPS.FACULTY = FACULTY.FACULTY where FACULTY.FACULTY = @facode )
return @cnt
end

declare @a int = dbo.Count_Students('ИЭф')
print 'Кол-во студентов = ' + cast(@a as varchar(4));
select * from FACULTY

--task 2 перечень дисциплин в отчет

go
create function FSUBJECTS(@p varchar(20)) returns varchar(300)
as begin declare @sbj varchar(20), @s varchar(100) = '';
declare SbjCrsr cursor local static
		for select distinct SUBJECTS from SUBJECTS
			where PULPIT like @p
open SbjCrsr
fetch SbjCrsr into @sbj
while @@FETCH_STATUS = 0
begin 
	set @s = @s + rtrim(@sbj) + ','
	fetch SbjCrsr into @sbj
end 
return @s
end;
go	

select distinct PULPIT, dbo.FSUBJECTS(PULPIT)[Список дисциплин] from SUBJECTS

--task 3 табличная функция возвращающая факультет и кафедры на нем. 
--Принимает два параметра. если (null,null) возвращает список всех факультетов и кафедр
-- ('',null) - факультет и все кафердры на нем
--(null,'') - строка возвр. факультет и кафедру на нем
go
create function FFACPUL (@f varchar(50), @p varchar(50)) returns table
as return 
select FACULTY.FACULTY, PULPIT.PULPIT from FACULTY left outer join PULPIT
	on FACULTY.FACULTY = PULPIT.FACULTY
		where FACULTY.FACULTY = ISNULL(@f,FACULTY.FACULTY)
		and PULPIT.PULPIT = ISNULL(@p, PULPIT.PULPIT)
go

select * from dbo.FFACPUL(null,null)
select * from dbo.FFACPUL('ТТЛП',null)
select * from dbo.FFACPUL(null,'ЛУ')

--task 4 скал ф-ция (1 параметр задающий код кафедры)
-- возвращает кол-во преподов на заданной кафедре
-- если null - общее кол-во преподов

go
create function FCTEACHER (@p varchar(50)) returns int 
as
begin 
	declare @rc int = (select count(*) from TEACHER
		where PULPIT = ISNULL(@p,PULPIT))
		return @rc
end
go

select	PULPIT, dbo.FCTEACHER(PULPIT)[Кол-во преподователей] from TEACHER
select dbo.FCTEACHER(null)[Общее число преподователей]

--xmybase

use x_mybase
--task 1 скал ф-ция подсчет кол-ва товаров заказанной той или иной ф-цией
go
create function count_zakazy(@p varchar(20)) returns int 
as begin declare @rc int = 0
set @rc = (select count(номер_заказа) 
	from заказы join покупатель
		on заказы.покупатель = покупатель.покупатель 
			where покупатель.покупатель = @p)
return @rc
end
go

declare @a int = dbo.count_zakazy('ООО Амимебель') --вызов №1
print 'Кол-во заказов = ' + cast(@a as varchar(4))

select покупатель, dbo.count_zakazy(покупатель) from покупатель --вызов №2

select * from заказы

--task 2 скал ф-ция отчет о заказаных товарах

go
create function ZAKAZY (@p varchar(20)) returns varchar(300)
as begin 
declare @tv char(20), @t varchar(300) = 'Заказанные товары: '
declare CrsrTovary cursor local 
for select наименование_заказанного_товара from заказы
											where покупатель = @p
open CrsrTovary
fetch CrsrTovary into @tv
while @@FETCH_STATUS = 0
begin
	set @t = @t + rtrim(@tv) + ','
	fetch CrsrTovary into @tv 
end
return @t
end
go

select покупатель, dbo.ZAKAZY(покупатель) from покупатель

--task 3 табл ф-ция с двумя параметрами (null,null)
go
create function PRICE (@tv varchar(50), @p real) returns table
as return
select наименование_товара, цена, цена_продажи
	from товарыы left outer join заказы
		on наименование_товара = наименование_заказанного_товара
			where наименование_товара = ISNULL(@tv, наименование_товара)
			and 
				цена_продажи = ISNULL(@p, цена_продажи)

select * from dbo.PRICE (null,null) -- выводит все
select * from dbo.PRICE ('стул',null) -- цены соотв товара
select * from dbo.PRICE (null,'400') -- товары соотв. данной цене
select * from товарыы

--task 4 скал ф-ция 
go
create function KolTovarov(@p varchar(50)) returns int
as
begin 
	declare	@kol int = (select count(*) from заказы
	where покупатель = ISNULL(@p, покупатель))
	return @kol
end
go

select покупатель, dbo.KolTovarov(покупатель)[кол-во заказов] from заказы --выводи всех
select dbo.KolTovarov(null) [всего заказов] -- всего заказов
