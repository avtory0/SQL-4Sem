use university

select min(AUDITORIUM.AUDITORIUM_CAPACITY) [Max capacity],
	   avg(AUDITORIUM.AUDITORIUM_CAPACITY)	[Average capacity],
	   max(AUDITORIUM.AUDITORIUM_CAPACITY) [Min capacity],
	   sum(AUDITORIUM.AUDITORIUM_CAPACITY)	[Total capacity],
	   count(*)	[Count of auditoriums]
from AUDITORIUM	  

select AUDITORIUM_TYPE.AUDITORIUM_TYPENAME,
	   min(AUDITORIUM.AUDITORIUM_CAPACITY) [Max capacity],
	   avg(AUDITORIUM.AUDITORIUM_CAPACITY)	[Average capacity],
	   max(AUDITORIUM.AUDITORIUM_CAPACITY) [Min capacity],
	   sum(AUDITORIUM.AUDITORIUM_CAPACITY)	[Total capacity],
	   count(*)	[Count of auditoriums]
from AUDITORIUM	inner join AUDITORIUM_TYPE
	   on AUDITORIUM.AUDITORIUM_TYPE = AUDITORIUM_TYPE.AUDITORIUM_TYPE
	   and AUDITORIUM_CAPACITY > 30 group by AUDITORIUM_TYPENAME
	   
select *
from (select case
			 when NOTE between 4 and 5 then '4-5'
			 when NOTE between 6 and 7 then '6-7'
			 when NOTE between 8 and 9 then '8-9'
			 else '10'
			 end [Notes], count (*) [Count]
from PROGRESS group by case
			 when NOTE between 4 and 5 then '4-5'
			 when NOTE between 6 and 7 then '6-7'
			 when NOTE between 8 and 9 then '8-9'
			 else '10'
			 end) as T
order by case [Notes]
			 when '4-5' then 4
			 when '6-7' then 3
			 when '8-9' then 2
			 when '10' then 1
			 else 0
			 end

select f.FACULTY,
	   g.PROFESSION,
	   round(avg(cast(PROGRESS.NOTE as float(4))),2) [AVG NOTE]
from ((FACULTY f inner join GROUPS g on f.FACULTY = g.FACULTY)
inner join STUDENTS on g.IDGROUP = STUDENTS.IDGROUP) 
inner join PROGRESS on STUDENTS.IDSTUDENT = PROGRESS.IDSTUDENT
where PROGRESS.SUBJECTS = 'ОАиП' or PROGRESS.SUBJECTS = 'СУБД'
group by f.FACULTY,
		 g.PROFESSION

select f.FACULTY, PROFESSION, SUBJECTS, round(avg(cast(NOTE as float(4))),2) [AVG NOTE]
from ((FACULTY f inner join GROUPS g on f.FACULTY = g.FACULTY)
inner join STUDENTS on g.IDGROUP = STUDENTS.IDGROUP) 
inner join PROGRESS on STUDENTS.IDSTUDENT = PROGRESS.IDSTUDENT
where f.FACULTY = 'ТОВ'
group by f.FACULTY, PROFESSION, SUBJECTS

select f.FACULTY, PROFESSION, SUBJECTS, round(avg(cast(NOTE as float(4))),2) [AVG NOTE]
from ((FACULTY f inner join GROUPS g on f.FACULTY = g.FACULTY)
inner join STUDENTS on g.IDGROUP = STUDENTS.IDGROUP) 
inner join PROGRESS on STUDENTS.IDSTUDENT = PROGRESS.IDSTUDENT
where f.FACULTY = 'ТОВ'
group by rollup (f.FACULTY, PROFESSION, SUBJECTS);

select f.FACULTY, PROFESSION, SUBJECT, round(avg(cast(NOTE as float(4))),2) [AVG NOTE]
from ((FACULTY f inner join GROUPS g on f.FACULTY = g.FACULTY)
inner join STUDENT on g.IDGROUP = STUDENT.IDGROUP) 
inner join PROGRESS on STUDENT.IDSTUDENT = PROGRESS.IDSTUDENT
where f.FACULTY = 'ИЭФ'
group by cube (f.FACULTY, PROFESSION, SUBJECT);


select f.FACULTY, PROFESSION, SUBJECT, round(avg(cast(NOTE as float(4))),2) [AVG NOTE]
from ((FACULTY f inner join GROUPS g on f.FACULTY = g.FACULTY)
inner join STUDENT on g.IDGROUP = STUDENT.IDGROUP) 
inner join PROGRESS on STUDENT.IDSTUDENT = PROGRESS.IDSTUDENT
where f.FACULTY = 'ИЭФ'
group by f.FACULTY, PROFESSION, SUBJECT
	UNION
select f.FACULTY, PROFESSION, SUBJECT, round(avg(cast(NOTE as float(4))),2) [AVG NOTE]
from ((FACULTY f inner join GROUPS g on f.FACULTY = g.FACULTY)
inner join STUDENT on g.IDGROUP = STUDENT.IDGROUP) 
inner join PROGRESS on STUDENT.IDSTUDENT = PROGRESS.IDSTUDENT
where f.FACULTY = 'хтит'
group by f.FACULTY, PROFESSION, SUBJECT

select f.FACULTY, PROFESSION, SUBJECT, round(avg(cast(NOTE as float(4))),2) [AVG NOTE]
from ((FACULTY f inner join GROUPS g on f.FACULTY = g.FACULTY)
inner join STUDENT on g.IDGROUP = STUDENT.IDGROUP) 
inner join PROGRESS on STUDENT.IDSTUDENT = PROGRESS.IDSTUDENT
where f.FACULTY = 'ит'
group by f.FACULTY, PROFESSION, SUBJECT
	UNION ALL
select f.FACULTY, PROFESSION, SUBJECT, round(avg(cast(NOTE as float(4))),2) [AVG NOTE]
from ((FACULTY f inner join GROUPS g on f.FACULTY = g.FACULTY)
inner join STUDENT on g.IDGROUP = STUDENT.IDGROUP) 
inner join PROGRESS on STUDENT.IDSTUDENT = PROGRESS.IDSTUDENT
where f.FACULTY = 'хтит'
group by f.FACULTY, PROFESSION, SUBJECT

select f.FACULTY, PROFESSION, SUBJECTS, round(avg(cast(NOTE as float(4))),2) [AVG NOTE]
from ((FACULTY f inner join GROUPS g on f.FACULTY = g.FACULTY)
inner join STUDENTS on g.IDGROUP = STUDENTS.IDGROUP) 
inner join PROGRESS on STUDENTS.IDSTUDENT = PROGRESS.IDSTUDENT
where f.FACULTY = 'ТОВ'
group by f.FACULTY, PROFESSION, SUBJECTS
	UNION
select f.FACULTY, PROFESSION, SUBJECTS, round(avg(cast(NOTE as float(4))),2) [AVG NOTE]
from ((FACULTY f inner join GROUPS g on f.FACULTY = g.FACULTY)
inner join STUDENTS on g.IDGROUP = STUDENTS.IDGROUP) 
inner join PROGRESS on STUDENTS.IDSTUDENT = PROGRESS.IDSTUDENT
where f.FACULTY = 'хтит'
group by f.FACULTY, PROFESSION, SUBJECTS
	INTERSECT
select f.FACULTY, PROFESSION, SUBJECTS, round(avg(cast(NOTE as float(4))),2) [AVG NOTE]
from ((FACULTY f inner join GROUPS g on f.FACULTY = g.FACULTY)
inner join STUDENTS on g.IDGROUP = STUDENTS.IDGROUP) 
inner join PROGRESS on STUDENTS.IDSTUDENT = PROGRESS.IDSTUDENT
where f.FACULTY = 'ИТ'
group by f.FACULTY, PROFESSION, SUBJECTS

select f.FACULTY, PROFESSION, SUBJECT, round(avg(cast(NOTE as float(4))),2) [AVG NOTE]
from ((FACULTY f inner join GROUPS g on f.FACULTY = g.FACULTY)
inner join STUDENT on g.IDGROUP = STUDENT.IDGROUP) 
inner join PROGRESS on STUDENT.IDSTUDENT = PROGRESS.IDSTUDENT
where f.FACULTY = 'ИЭФ'
group by f.FACULTY, PROFESSION, SUBJECT
	UNION
select f.FACULTY, PROFESSION, SUBJECT, round(avg(cast(NOTE as float(4))),2) [AVG NOTE]
from ((FACULTY f inner join GROUPS g on f.FACULTY = g.FACULTY)
inner join STUDENT on g.IDGROUP = STUDENT.IDGROUP) 
inner join PROGRESS on STUDENT.IDSTUDENT = PROGRESS.IDSTUDENT
where f.FACULTY = 'хтит'
group by f.FACULTY, PROFESSION, SUBJECT
	EXCEPT
select f.FACULTY, PROFESSION, SUBJECT, round(avg(cast(NOTE as float(4))),2) [AVG NOTE]
from ((FACULTY f inner join GROUPS g on f.FACULTY = g.FACULTY)
inner join STUDENT on g.IDGROUP = STUDENT.IDGROUP) 
inner join PROGRESS on STUDENT.IDSTUDENT = PROGRESS.IDSTUDENT
where f.FACULTY = 'хтит'
group by f.FACULTY, PROFESSION, SUBJECT

select p1.SUBJECTS, p1.NOTE,
(select count(*) from PROGRESS p2
	where p1.SUBJECTS = p2.SUBJECTS
	and p1.NOTE = p2.NOTE) [COUNT]
from PROGRESS p1
group by p1.SUBJECTS, p1.NOTE
having NOTE = 8 OR NOTE = 9

use KH_MyBase

select Оборудование.Название, Оборудование.Дата_поступления, Списание_оборудования.Дата_списания 
from Оборудование inner join Списание_оборудования on Оборудование.Название = Списание_оборудования.Название_оборудования
where Название = 'Молот'
	UNION
select Оборудование.Название, Оборудование.Дата_поступления, Списание_оборудования.Дата_списания 
from Оборудование inner join Списание_оборудования on Оборудование.Название = Списание_оборудования.Название_оборудования

select Оборудование.Название, Оборудование.Дата_поступления, Списание_оборудования.Дата_списания 
from Оборудование inner join Списание_оборудования on Оборудование.Название = Списание_оборудования.Название_оборудования
where Название = 'Молот'
	UNION ALL
select Оборудование.Название, Оборудование.Дата_поступления, Списание_оборудования.Дата_списания 
from Оборудование inner join Списание_оборудования on Оборудование.Название = Списание_оборудования.Название_оборудования

select Оборудование.Название, Оборудование.Дата_поступления, Списание_оборудования.Дата_списания 
from Оборудование inner join Списание_оборудования on Оборудование.Название = Списание_оборудования.Название_оборудования
	EXCEPT
select Оборудование.Название, Оборудование.Дата_поступления, Списание_оборудования.Дата_списания 
from Оборудование inner join Списание_оборудования on Оборудование.Название = Списание_оборудования.Название_оборудования
where Название = 'Молот'

select Оборудование.Название, Оборудование.Дата_поступления, Списание_оборудования.Дата_списания 
from Оборудование inner join Списание_оборудования on Оборудование.Название = Списание_оборудования.Название_оборудования
	INTERSECT
select Оборудование.Название, Оборудование.Дата_поступления, Списание_оборудования.Дата_списания 
from Оборудование inner join Списание_оборудования on Оборудование.Название = Списание_оборудования.Название_оборудования
where Название = 'Молот'


select min(Оборудование.Количество) [Максимальное количество],
	   avg(Оборудование.Количество)	[Среднее количество],
	   max(Оборудование.Количество) [Mинимальное количество],
	   sum(Оборудование.Количество)	[Общее количество],
	   count(*)	[Всего оборудования]
from Оборудование  