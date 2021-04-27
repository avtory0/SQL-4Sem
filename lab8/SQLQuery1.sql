use university
go
CREATE VIEW [Преподаватель]
	as select TEACHER[Код],
			  TEACHER_NAME[Имя преподавателя],
			  GENDER[Пол],
			  PULPIT[код кафедры] from TEACHER;
go
select * from Преподаватель
go
create view [Количество_кафедр] (Факультет, Количество_кафедр)
	as select FACULTY_NAME, count(PULPIT)
	from FACULTY a inner join PULPIT b
	on a.FACULTY = b.FACULTY
	group by FACULTY_NAME
go
select * from Количество_кафедр
go 
create view [Аудитории] (Код, наименование_аудитории)
	as select AUDITORIUM, AUDITORIUM_NAME from AUDITORIUM
		where AUDITORIUM_TYPE like 'ЛК%'
go
select * from Аудитории
go
create view [Лекционные_аудитории] (Код, Наименование_аудитории)
	as select AUDITORIUM, AUDITORIUM_NAME from AUDITORIUM
		where AUDITORIUM_TYPE like 'ЛК%' with check option
go
select * from Лекционные_аудитории
insert into AUDITORIUM (AUDITORIUM_NAME)
values ('gsfg')
go
create view [Дисциплина] (код, наименование_дисциплины,код_кафедры)
	as select top 22 SUBJECTS,SUBJECT_NAME, PULPIT from SUBJECTS
	order by SUBJECT_NAME
go
select * from Дисциплина
go
alter view [Количество_кафедр] (Факультет, Количество_кафедр) with schemabinding
	as select FACULTY_NAME, count(PULPIT)
	from dbo.FACULTY a inner join dbo.PULPIT b
	on a.FACULTY = b.FACULTY
	group by FACULTY_NAME
go
select * from Количество_кафедр

select * from SUBJECTS

use x_mybase
go
create view [Товары_в_наличии] (Товар, Описание, Цена, Количество)
	as select наименование_товара, описание, цена,количество_на_складе 
	from товарыы
go
select * from Товары_в_наличии
go
create view [Количество_товаров] (Наименование_товара, Количество, Количестов_заказанного_товара)
	as select наименование_товара, количество_на_складе, количество_заказанного_товара
	from товарыы a inner join заказы b
	on наименование_товара = наименование_заказанного_товара
go
select * from Количество_товаров
go
create view [Дешевые_товары] (Товар, Цена, Количество) 
	as select наименование_товара, цена, количество_на_складе  from товарыы
	where цена <500
go
select * from Дешевые_товары
go
alter view [Дешевые_товары] (Товар, Цена, Количество) 
	as select наименование_товара, цена, количество_на_складе  from товарыы
	where цена <500 with check option
go
alter view [Дешевые_товары] (Товар, Цена, Количество) 
	as select top 5 наименование_товара, цена, количество_на_складе  from товарыы
	where цена <500 
	order by цена
go
select * from Дешевые_товары
go
alter view [Количество_товаров] (Наименование_товара, Количество, Количестов_заказанного_товара, поставщик) with schemabinding
	as select наименование_товара, количество_на_складе, количество_заказанного_товара, поставщик
	from dbo.товарыы a inner join dbo.заказы b
	on наименование_товара = наименование_заказанного_товара
go
select * from Количество_товаров
go
create view [Товары] (Наименование_товара, Количество, Количестов_заказанного_товара, поставщик) with schemabinding
	as select наименование_товара, количество_на_складе, количество_заказанного_товара, поставщик
	from dbo.товарыы a inner join dbo.заказы b
	on наименование_товара = наименование_заказанного_товара
go
select * from Товары
alter table товарыы drop column поставщик
alter table товарыы add дата_поставки date
alter table товарыы drop column дата_поставки
select * from товарыы
