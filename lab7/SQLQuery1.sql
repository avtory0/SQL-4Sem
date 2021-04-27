use university

select  min(AUDITORIUM_CAPACITY) [Минимальная вместимость],
		max(AUDITORIUM_CAPACITY) [Максимальная вместимость],
		sum(AUDITORIUM_CAPACITY) [Суммарное количество мест],
		COUNT(*) [Количество аудиторий]
from AUDITORIUM

select AUDITORIUM_TYPENAME,
		max(AUDITORIUM_CAPACITY) [Максимальная вместимость],
		min(AUDITORIUM_CAPACITY) [Минимальная вместимость],
		avg(AUDITORIUM_CAPACITY) [Средняя вместимость],
		sum(AUDITORIUM_CAPACITY) [Суммарная вместимость],
		count(*) [Кол-во аудиторий]
	from AUDITORIUM_TYPE inner join AUDITORIUM
		on AUDITORIUM.AUDITORIUM_TYPE = AUDITORIUM_TYPE.AUDITORIUM_TYPE
		group by AUDITORIUM_TYPENAME

select * 
	from(select case
		when NOTE = 10 then '10'
		when NOTE between 8 and 9 then '8-9'
		when NOTE between 6 and 7 then '6-7'
		else '4-5'
		end [Отметки], count(*) [Количество]
	from PROGRESS Group by case
		when NOTE = 10 then '10'
		when NOTE between 8 and 9 then '8-9'
		when NOTE between 6 and 7 then '6-7'
		else '4-5'
		end) as T
			ORDER BY case [Отметки]
			 when '4-5' then 4
			 when '6-7' then 3
			 when '8-9' then 2
			 when '10' then 1
			 else 0
			 end

select a.FACULTY, b.PROFESSION,
	   round(avg(cast(PROGRESS.NOTE as float(4))),2) [Средняя_отметка]
	from ((FACULTY a inner join GROUPS b on a.FACULTY = b.FACULTY)
	inner join STUDENTS on b.IDGROUP = STUDENTS.IDGROUP) 
	inner join PROGRESS on STUDENTS.IDSTUDENT = PROGRESS.IDSTUDENT
	where PROGRESS.SUBJECTS = 'ОАиП' or PROGRESS.SUBJECTS = 'СУБД'
	group by a.FACULTY, b.PROFESSION

select a.FACULTY, PROFESSION, SUBJECTS, round(avg(cast(NOTE as float(4))),2) [Средняя_отметка]
	from ((FACULTY a inner join GROUPS b on a.FACULTY = b.FACULTY)
	inner join STUDENTS on b.IDGROUP = STUDENTS.IDGROUP) 
	inner join PROGRESS on STUDENTS.IDSTUDENT = PROGRESS.IDSTUDENT
	where a.FACULTY = 'ТОВ'
	group by rollup (a.FACULTY, PROFESSION, SUBJECTS);

select a.FACULTY, PROFESSION, SUBJECTS, round(avg(cast(NOTE as float(4))),2) [Средняя_отметка]
	from ((FACULTY a inner join GROUPS b on a.FACULTY = b.FACULTY)
	inner join STUDENTS on b.IDGROUP = STUDENTS.IDGROUP) 
	inner join PROGRESS on STUDENTS.IDSTUDENT = PROGRESS.IDSTUDENT
	where a.FACULTY = 'ТОВ'
	group by cube (a.FACULTY, PROFESSION, SUBJECTS);

select a.FACULTY, PROFESSION, SUBJECTS, round(avg(cast(NOTE as float(4))),2) [Средняя_отметка]
	from ((FACULTY a inner join GROUPS b on a.FACULTY = b.FACULTY)
	inner join STUDENTS on b.IDGROUP = STUDENTS.IDGROUP) 
	inner join PROGRESS on STUDENTS.IDSTUDENT = PROGRESS.IDSTUDENT
	where a.FACULTY = 'ТОВ'
	group by a.FACULTY, PROFESSION, SUBJECTS
		UNION
	select a.FACULTY, PROFESSION, SUBJECTS, round(avg(cast(NOTE as float(4))),2) [Средняя_отметка]
	from ((FACULTY a inner join GROUPS b on a.FACULTY = b.FACULTY)
	inner join STUDENTS on b.IDGROUP = STUDENTS.IDGROUP) 
	inner join PROGRESS on STUDENTS.IDSTUDENT = PROGRESS.IDSTUDENT
	where a.FACULTY = 'ХТИТ'
	group by a.FACULTY, PROFESSION, SUBJECTS

select a.FACULTY, PROFESSION, SUBJECTS, round(avg(cast(NOTE as float(4))),2) [Средняя_отметка]
	from ((FACULTY a inner join GROUPS b on a.FACULTY = b.FACULTY)
	inner join STUDENTS on b.IDGROUP = STUDENTS.IDGROUP) 
	inner join PROGRESS on STUDENTS.IDSTUDENT = PROGRESS.IDSTUDENT
	where a.FACULTY = 'ТОВ'
	group by a.FACULTY, PROFESSION, SUBJECTS
		UNION ALL
	select a.FACULTY, PROFESSION, SUBJECTS, round(avg(cast(NOTE as float(4))),2) [Средняя_отметка]
	from ((FACULTY a inner join GROUPS b on a.FACULTY = b.FACULTY)
	inner join STUDENTS on b.IDGROUP = STUDENTS.IDGROUP) 
	inner join PROGRESS on STUDENTS.IDSTUDENT = PROGRESS.IDSTUDENT
	where a.FACULTY = 'ХТИТ'
	group by a.FACULTY, PROFESSION, SUBJECTS

select a.FACULTY, PROFESSION, SUBJECTS, round(avg(cast(NOTE as float(4))),2) [Средняя_отметка]
	from ((FACULTY a inner join GROUPS b on a.FACULTY = b.FACULTY)
	inner join STUDENTS on b.IDGROUP = STUDENTS.IDGROUP) 
	inner join PROGRESS on STUDENTS.IDSTUDENT = PROGRESS.IDSTUDENT
	where a.FACULTY = 'ТОВ'
	group by a.FACULTY, PROFESSION, SUBJECTS
		intersect
	select a.FACULTY, PROFESSION, SUBJECTS, round(avg(cast(NOTE as float(4))),2) [Средняя_отметка]
	from ((FACULTY a inner join GROUPS b on a.FACULTY = b.FACULTY)
	inner join STUDENTS on b.IDGROUP = STUDENTS.IDGROUP) 
	inner join PROGRESS on STUDENTS.IDSTUDENT = PROGRESS.IDSTUDENT
	where a.FACULTY = 'ХТИТ'
	group by a.FACULTY, PROFESSION, SUBJECTS


select p1.SUBJECTS, p1.NOTE,
(select count(*) from PROGRESS p2
	where p1.SUBJECTS = p2.SUBJECTS
	and p1.NOTE = p2.NOTE) [COUNT]
from PROGRESS p1
group by p1.SUBJECTS, p1.NOTE
having NOTE = 8 OR NOTE = 9

select * from AUDITORIUM
select * from AUDITORIUM_TYPE
select * from PROGRESS
select * from GROUPS
select * from STUDENTS
select * from FACULTY

use x_mybase

select  min(товарыы.количество_на_складе) [Минимальное_количество],
		max(количество_на_складе) [Максимальное_количество],
		count(*) [Количество_товаров],
		sum(количество_на_складе) [Сумма_товаров]	
from товарыы

select наименование_товара, min(цена_продажи) [Минимальная_цена], COUNT(*) [Количество_заказанных_товаров]
	from заказы inner join товарыы
	on заказы.наименование_заказанного_товара = товарыы.наименование_товара
	and товарыы.количество_на_складе > 20 
	group by наименование_товара

select * 
from(select case when цена_продажи between 1 and 300 then 'цена < 300'
	when цена_продажи between 300 and 600 then 'цена от 300 до 600'
	else 'цена больше 600'
	end [Предел_цены], count(*) [Количество]
from заказы group by case
	 when цена_продажи between 1 and 300 then 'цена < 300'
	when цена_продажи between 300 and 600 then 'цена от 300 до 600'
	else 'цена больше 600'
	end) as T
		order by case [Предел_цены]
		 when 'цена < 300' then 3
		 when 'цена от 300 до 600' then 2
		 when 'цена больше 600' then 1
		 else 0 
		 end

select наименование_заказанного_товара, цена_продажи, sum(количество_заказанного_товара) [Количество]
from заказы
where наименование_заказанного_товара in ('журнальный столик', 'камод')
group by rollup (наименование_заказанного_товара, цена_продажи)

select наименование_заказанного_товара, sum(количество_заказанного_товара) [количество]
	from заказы where покупатель = 'ООО сильные руки'
	group by наименование_заказанного_товара
		union
select наименование_заказанного_товара, sum(количество_заказанного_товара) [количество]
	from заказы where покупатель = 'ООО Амимебель'
	group by наименование_заказанного_товара

select наименование_заказанного_товара, sum(количество_заказанного_товара) [количество]
	from заказы where покупатель = 'ООО сильные руки'
	group by наименование_заказанного_товара
		union all
select наименование_заказанного_товара, sum(количество_заказанного_товара) [количество]
	from заказы where покупатель = 'ООО Амимебель'
	group by наименование_заказанного_товара

select товарыы.наименование_товара, заказы.цена_продажи, sum(количество_заказанного_товара) [количество]
	from товарыы inner join заказы on товарыы.наименование_товара = заказы.наименование_заказанного_товара
	group by наименование_товара, цена_продажи
		intersect
select товарыы.наименование_товара, заказы.цена_продажи, sum(количество_заказанного_товара) [количество]
	from товарыы inner join заказы on товарыы.наименование_товара = заказы.наименование_заказанного_товара
	where покупатель = 'ООО Амимебель'
	group by наименование_товара, цена_продажи

select товарыы.наименование_товара, заказы.цена_продажи, sum(количество_заказанного_товара) [количество]
	from товарыы inner join заказы on товарыы.наименование_товара = заказы.наименование_заказанного_товара
	group by наименование_товара, цена_продажи
		except
select товарыы.наименование_товара, заказы.цена_продажи, sum(количество_заказанного_товара) [количество]
	from товарыы inner join заказы on товарыы.наименование_товара = заказы.наименование_заказанного_товара
	where покупатель = 'ООО Амимебель'
	group by наименование_товара, цена_продажи


select * from заказы



