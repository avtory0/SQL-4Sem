use university

select FACULTY.FACULTY_NAME,PULPIT.PULPIT_NAME, PROFESSION.PROFESSION_NAME
	from FACULTY,PULPIT, PROFESSION
	where FACULTY.FACULTY=PULPIT.FACULTY and PULPIT.FACULTY = PROFESSION_NAME
		and PROFESSION_NAME in (select PROFESSION.PROFESSION_NAME from PROFESSION 
								where (PROFESSION.PROFESSION_NAME like '%���������%'))


	select distinct FACULTY.FACULTY,PULPIT.PULPIT_NAME
		from FACULTY inner join PULPIT
		on FACULTY.FACULTY=PULPIT.FACULTY 
			and FACULTY.FACULTY in (select PROFESSION.FACULTY from PROFESSION 
									where (PROFESSION.PROFESSION_NAME like '%����������%'))

select FACULTY.FACULTY_NAME,PULPIT.PULPIT_NAME, PROFESSION.PROFESSION_NAME
	from FACULTY inner join PULPIT
	on FACULTY.FACULTY=PULPIT.FACULTY 
		inner join PROFESSION
		on PULPIT.FACULTY = PROFESSION_NAME
		and  PROFESSION_NAME in (select PROFESSION.PROFESSION_NAME from PROFESSION 
								where (PROFESSION.PROFESSION_NAME like '%���������%'))

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
		where SUBJECTS like '����')[����],
	(select avg(PROGRESS.NOTE) from PROGRESS
		where SUBJECTS like '����')[����],
	(select avg(PROGRESS.NOTE) from PROGRESS
		where SUBJECTS like '��')[��]
	from PROGRESS

select AUDITORIUM.AUDITORIUM,AUDITORIUM_TYPE,AUDITORIUM.AUDITORIUM_CAPACITY
	from AUDITORIUM
	where AUDITORIUM_CAPACITY >=all(select AUDITORIUM_CAPACITY from AUDITORIUM
									where AUDITORIUM_TYPE like '%�%')

select AUDITORIUM.AUDITORIUM,AUDITORIUM_TYPE,AUDITORIUM.AUDITORIUM_CAPACITY
	from AUDITORIUM
	where AUDITORIUM_CAPACITY >any(select AUDITORIUM_CAPACITY from AUDITORIUM
									where AUDITORIUM_TYPE like '%�%')

select * from FACULTY
select * from PULPIT
select * from PROFESSION
select * from AUDITORIUM
select * from PROGRESS
select * from STUDENTS

use x_mybase

select ������������_������, ����_������
	from �������, ������
	where ������������_������ = ������������_�����������_������
	and ������.���������� in(select ���������� from ����������
		where (����� like'%�����%'))

select ������������_������, ����_������
	from ������� inner join ������
	on ������������_������ = ������������_�����������_������
	and ������.���������� in(select ���������� from ����������
		where (����� like'%�����%'))

select ������������_������, ����_������
	from ������� inner join ������
	on ������������_������ = ������������_�����������_������
		inner join ����������
		on ������.���������� = ����������.����������
			where (����� like'%�����%')

select ������������_�����������_������, ����������_�����������_������
	from ������ a 
		where ���������� =(select top(1) ���������� from ������ aa
			where aa.������������_�����������_������ = a.������������_�����������_������
				order by ����������_�����������_������ desc) order by ����������_�����������_������ desc 

select top 1
	(select avg(����������_�����������_������) from ������
		where ������������_�����������_������ like '���������')[���������],
	(select avg(����������_�����������_������) from ������
		where ������������_�����������_������ like '���������� ������')[���������� ������],
	(select avg(����������_�����������_������) from ������
		where ������������_�����������_������ like '�����')[�����]
	from ������

select ������������_�����������_������, ����_������� from ������
	where ����_������� >=all (select ����_������� from ������
							 where ������������_�����������_������ like '�%')

select ������������_�����������_������, ����������_�����������_������ from ������
	where ����������_�����������_������ >any(select ����������_��_������ from �������
											where ������������_�����������_������ like '�%')
										


select * from �������
select * from ������
select * from ����������