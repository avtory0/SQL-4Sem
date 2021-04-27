use university

select AUDITORIUM.AUDITORIUM,AUDITORIUM_TYPE.AUDITORIUM_TYPENAME
	from AUDITORIUM inner join AUDITORIUM_TYPE
	on AUDITORIUM.AUDITORIUM_TYPE = AUDITORIUM_TYPE.AUDITORIUM_TYPE

select AUDITORIUM.AUDITORIUM,AUDITORIUM_TYPE.AUDITORIUM_TYPENAME
	from AUDITORIUM inner join AUDITORIUM_TYPE
	on AUDITORIUM.AUDITORIUM_TYPE = AUDITORIUM_TYPE.AUDITORIUM_TYPE and
	AUDITORIUM_TYPE.AUDITORIUM_TYPENAME like '%������������%'


select AUDITORIUM.AUDITORIUM, AUDITORIUM_TYPE.AUDITORIUM_TYPENAME
	from AUDITORIUM, AUDITORIUM_TYPE	
	where AUDITORIUM.AUDITORIUM_TYPE = AUDITORIUM_TYPE.AUDITORIUM_TYPE

select AUDITORIUM.AUDITORIUM, AUDITORIUM_TYPE.AUDITORIUM_TYPENAME
	from AUDITORIUM, AUDITORIUM_TYPE
	where AUDITORIUM.AUDITORIUM_TYPE = AUDITORIUM_TYPE.AUDITORIUM_TYPE and 
	AUDITORIUM_TYPE.AUDITORIUM_TYPENAME like '%������������%'

select  FACULTY.FACULTY, PULPIT.PULPIT, PROFESSION.PROFESSION, STUDENTS.NAME,
	Case
		when (PROGRESS.NOTE = 6) then '�����'
		when (PROGRESS.NOTE = 7) then '����'
		when (PROGRESS.NOTE = 8) then '������'
		else '�������� �������'
	end as '�������'
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
	isnull(TEACHER.TEACHER_NAME, '***') as �������������
	from PULPIT Left Outer Join TEACHER
	on TEACHER.PULPIT= PULPIT.PULPIT

select teacher.TEACHER_NAME,
	isnull(TEACHER.TEACHER_NAME, '***') as �������������
	from TEACHER Right Outer Join PULPIT
	on TEACHER.PULPIT= PULPIT.PULPIT



select AUDITORIUM.AUDITORIUM,AUDITORIUM_TYPE.AUDITORIUM_TYPENAME
	from AUDITORIUM cross join AUDITORIUM_TYPE
	where AUDITORIUM.AUDITORIUM_TYPE = AUDITORIUM_TYPE.AUDITORIUM_TYPE


use x_mybase

select �������.����, ������.����������_�����������_������,������.����������
	from ������� inner join ������
	on �������.������������_������ = ������.������������_�����������_������

select �������.����, ������.����������_�����������_������,������.����������
	from ������� inner join ������
	on �������.������������_������ = ������.������������_�����������_������
	and ������.����������_�����������_������ between 1 and 5

select �������.����, ������.����������_�����������_������,������.����������
	from �������, ������
	where �������.������������_������ = ������.������������_�����������_������

select �������.������������_������, ������.����������
	from ������� left join ������
	on �������.������������_������ = ������.������������_�����������_������

	
select �������.������������_������, ������.����������
	from ������� right join ������
	on �������.������������_������ = ������.������������_�����������_������