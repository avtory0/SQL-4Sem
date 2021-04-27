use university

select AUDITORIUM.AUDITORIUM,AUDITORIUM_TYPE.AUDITORIUM_TYPENAME
	from AUDITORIUM inner join AUDITORIUM_TYPE
	on AUDITORIUM.AUDITORIUM_TYPE = AUDITORIUM_TYPE.AUDITORIUM_TYPE

select AUDITORIUM.AUDITORIUM,AUDITORIUM_TYPE.AUDITORIUM_TYPENAME
	from AUDITORIUM inner join AUDITORIUM_TYPE
	on AUDITORIUM.AUDITORIUM_TYPE = AUDITORIUM_TYPE.AUDITORIUM_TYPE and
	AUDITORIUM_TYPE.AUDITORIUM_TYPENAME like '%Компьютерный%'


select AUDITORIUM.AUDITORIUM, AUDITORIUM_TYPE.AUDITORIUM_TYPENAME
	from AUDITORIUM, AUDITORIUM_TYPE	
	where AUDITORIUM.AUDITORIUM_TYPE = AUDITORIUM_TYPE.AUDITORIUM_TYPE

select AUDITORIUM.AUDITORIUM, AUDITORIUM_TYPE.AUDITORIUM_TYPENAME
	from AUDITORIUM, AUDITORIUM_TYPE
	where AUDITORIUM.AUDITORIUM_TYPE = AUDITORIUM_TYPE.AUDITORIUM_TYPE and 
	AUDITORIUM_TYPE.AUDITORIUM_TYPENAME like '%Компьютерный%'

select  FACULTY.FACULTY, PULPIT.PULPIT, PROFESSION.PROFESSION, STUDENTS.NAME,
	Case
		when (PROGRESS.NOTE = 6) then 'шесть'
		when (PROGRESS.NOTE = 7) then 'семь'
		when (PROGRESS.NOTE = 8) then 'восемь'
		else 'странная отметка'
	end as 'отметка'
	from FACULTY, PULPIT,PROFESSION,STUDENTS, PROGRESS
	where PROGRESS.NOTE between 6 and 8
	order by 
	(case
		when (PROGRESS.NOTE = 7)then 4
		when (PROGRESS.NOTE = 8) then 3
		when (PROGRESS.NOTE = 6) then 2
		else 1
		end
		)

select PULPIT.PULPIT_NAME,
	isnull(TEACHER.TEACHER_NAME, '***') as преподаватель
	from PULPIT Left Outer Join TEACHER
	on TEACHER.PULPIT= PULPIT.PULPIT

select teacher.TEACHER_NAME,
	isnull(TEACHER.TEACHER_NAME, '***') as преподаватель
	from TEACHER Right Outer Join PULPIT
	on TEACHER.PULPIT= PULPIT.PULPIT



select AUDITORIUM.AUDITORIUM,AUDITORIUM_TYPE.AUDITORIUM_TYPENAME
	from AUDITORIUM cross join AUDITORIUM_TYPE
	where AUDITORIUM.AUDITORIUM_TYPE = AUDITORIUM_TYPE.AUDITORIUM_TYPE


use x_mybase

select товарыы.цена, заказы.количество_заказанного_товара,заказы.покупатель
	from товарыы inner join заказы
	on товарыы.наименование_товара = заказы.наименование_заказанного_товара

select товарыы.цена, заказы.количество_заказанного_товара,заказы.покупатель
	from товарыы inner join заказы
	on товарыы.наименование_товара = заказы.наименование_заказанного_товара
	and заказы.количество_заказанного_товара between 1 and 5

select товарыы.цена, заказы.количество_заказанного_товара,заказы.покупатель
	from товарыы, заказы
	where товарыы.наименование_товара = заказы.наименование_заказанного_товара

select товарыы.наименование_товара, заказы.покупатель
	from товарыы left join заказы
	on товарыы.наименование_товара = заказы.наименование_заказанного_товара

	
select товарыы.наименование_товара, заказы.покупатель
	from товарыы right join заказы
	on товарыы.наименование_товара = заказы.наименование_заказанного_товара