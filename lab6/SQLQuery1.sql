use university

select FACULTY.FACULTY_NAME,PULPIT.PULPIT_NAME, PROFESSION.PROFESSION_NAME
	from FACULTY,PULPIT, PROFESSION
	where FACULTY.FACULTY=PULPIT.FACULTY and PULPIT.FACULTY = PROFESSION_NAME
		and PROFESSION_NAME in (select PROFESSION.PROFESSION_NAME from PROFESSION 
								where (PROFESSION.PROFESSION_NAME like '%технологи%'))


	select distinct FACULTY.FACULTY,PULPIT.PULPIT_NAME
		from FACULTY inner join PULPIT
		on FACULTY.FACULTY=PULPIT.FACULTY 
			and FACULTY.FACULTY in (select PROFESSION.FACULTY from PROFESSION 
									where (PROFESSION.PROFESSION_NAME like '%технология%'))

select FACULTY.FACULTY_NAME,PULPIT.PULPIT_NAME, PROFESSION.PROFESSION_NAME
	from FACULTY inner join PULPIT
	on FACULTY.FACULTY=PULPIT.FACULTY 
		inner join PROFESSION
		on PULPIT.FACULTY = PROFESSION_NAME
		and  PROFESSION_NAME in (select PROFESSION.PROFESSION_NAME from PROFESSION 
								where (PROFESSION.PROFESSION_NAME like '%технологи%'))

select AUDITORIUM_TYPE, AUDITORIUM_CAPACITY 
	from AUDITORIUM a
		where AUDITORIUM = (select top(1) AUDITORIUM from AUDITORIUM aa
			where aa.AUDITORIUM_TYPE = a.AUDITORIUM_TYPE
				order by AUDITORIUM_CAPACITY desc)

select FACULTY.FACULTY_NAME from FACULTY 
	where exists (select * from PULPIT
		where FACULTY.FACULTY = PULPIT.FACULTY)

select top 1
	(select avg(PROGRESS.NOTE) from PROGRESS
		where SUBJECTS like 'ОАиП')[ОАиП],
	(select avg(PROGRESS.NOTE) from PROGRESS
		where SUBJECTS like 'СУБД')[СУБД],
	(select avg(PROGRESS.NOTE) from PROGRESS
		where SUBJECTS like 'КГ')[КГ]
	from PROGRESS

select AUDITORIUM.AUDITORIUM,AUDITORIUM_TYPE,AUDITORIUM.AUDITORIUM_CAPACITY
	from AUDITORIUM
	where AUDITORIUM_CAPACITY >=all(select AUDITORIUM_CAPACITY from AUDITORIUM
									where AUDITORIUM_TYPE like '%Б%')

select AUDITORIUM.AUDITORIUM,AUDITORIUM_TYPE,AUDITORIUM.AUDITORIUM_CAPACITY
	from AUDITORIUM
	where AUDITORIUM_CAPACITY >any(select AUDITORIUM_CAPACITY from AUDITORIUM
									where AUDITORIUM_TYPE like '%Б%')

select * from FACULTY
select * from PULPIT
select * from PROFESSION
select * from AUDITORIUM
select * from PROGRESS
select * from STUDENTS

use x_mybase

select наименование_товара, дата_сделки
	from товарыы, заказы
	where наименование_товара = наименование_заказанного_товара
	and заказы.покупатель in(select покупатель from покупатель
		where (адрес like'%Минск%'))

select наименование_товара, дата_сделки
	from товарыы inner join заказы
	on наименование_товара = наименование_заказанного_товара
	and заказы.покупатель in(select покупатель from покупатель
		where (адрес like'%Минск%'))

select наименование_товара, дата_сделки
	from товарыы inner join заказы
	on наименование_товара = наименование_заказанного_товара
		inner join покупатель
		on заказы.покупатель = покупатель.покупатель
			where (адрес like'%Минск%')

select наименование_заказанного_товара, количество_заказанного_товара
	from заказы a 
		where покупатель =(select top(1) покупатель from заказы aa
			where aa.наименование_заказанного_товара = a.наименование_заказанного_товара
				order by количество_заказанного_товара desc) order by количество_заказанного_товара desc 

select top 1
	(select avg(количество_заказанного_товара) from заказы
		where наименование_заказанного_товара like 'компьютер')[компьютер],
	(select avg(количество_заказанного_товара) from заказы
		where наименование_заказанного_товара like 'журнальный столик')[журнальный столик],
	(select avg(количество_заказанного_товара) from заказы
		where наименование_заказанного_товара like 'камод')[камод]
	from заказы

select наименование_заказанного_товара, цена_продажи from заказы
	where цена_продажи >=all (select цена_продажи from заказы
							 where наименование_заказанного_товара like 'к%')

select наименование_заказанного_товара, количество_заказанного_товара from заказы
	where количество_заказанного_товара >any(select количество_на_складе from товарыы
											where наименование_заказанного_товара like 'м%')
										


select * from товарыы
select * from заказы
select * from покупатель