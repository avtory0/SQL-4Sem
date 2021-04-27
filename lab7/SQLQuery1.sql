use university

select  min(AUDITORIUM_CAPACITY) [����������� �����������],
		max(AUDITORIUM_CAPACITY) [������������ �����������],
		sum(AUDITORIUM_CAPACITY) [��������� ���������� ����],
		COUNT(*) [���������� ���������]
from AUDITORIUM

select AUDITORIUM_TYPENAME,
		max(AUDITORIUM_CAPACITY) [������������ �����������],
		min(AUDITORIUM_CAPACITY) [����������� �����������],
		avg(AUDITORIUM_CAPACITY) [������� �����������],
		sum(AUDITORIUM_CAPACITY) [��������� �����������],
		count(*) [���-�� ���������]
	from AUDITORIUM_TYPE inner join AUDITORIUM
		on AUDITORIUM.AUDITORIUM_TYPE = AUDITORIUM_TYPE.AUDITORIUM_TYPE
		group by AUDITORIUM_TYPENAME

select * 
	from(select case
		when NOTE = 10 then '10'
		when NOTE between 8 and 9 then '8-9'
		when NOTE between 6 and 7 then '6-7'
		else '4-5'
		end [�������], count(*) [����������]
	from PROGRESS Group by case
		when NOTE = 10 then '10'
		when NOTE between 8 and 9 then '8-9'
		when NOTE between 6 and 7 then '6-7'
		else '4-5'
		end) as T
			ORDER BY case [�������]
			 when '4-5' then 4
			 when '6-7' then 3
			 when '8-9' then 2
			 when '10' then 1
			 else 0
			 end

select a.FACULTY, b.PROFESSION,
	   round(avg(cast(PROGRESS.NOTE as float(4))),2) [�������_�������]
	from ((FACULTY a inner join GROUPS b on a.FACULTY = b.FACULTY)
	inner join STUDENTS on b.IDGROUP = STUDENTS.IDGROUP) 
	inner join PROGRESS on STUDENTS.IDSTUDENT = PROGRESS.IDSTUDENT
	where PROGRESS.SUBJECTS = '����' or PROGRESS.SUBJECTS = '����'
	group by a.FACULTY, b.PROFESSION

select a.FACULTY, PROFESSION, SUBJECTS, round(avg(cast(NOTE as float(4))),2) [�������_�������]
	from ((FACULTY a inner join GROUPS b on a.FACULTY = b.FACULTY)
	inner join STUDENTS on b.IDGROUP = STUDENTS.IDGROUP) 
	inner join PROGRESS on STUDENTS.IDSTUDENT = PROGRESS.IDSTUDENT
	where a.FACULTY = '���'
	group by rollup (a.FACULTY, PROFESSION, SUBJECTS);

select a.FACULTY, PROFESSION, SUBJECTS, round(avg(cast(NOTE as float(4))),2) [�������_�������]
	from ((FACULTY a inner join GROUPS b on a.FACULTY = b.FACULTY)
	inner join STUDENTS on b.IDGROUP = STUDENTS.IDGROUP) 
	inner join PROGRESS on STUDENTS.IDSTUDENT = PROGRESS.IDSTUDENT
	where a.FACULTY = '���'
	group by cube (a.FACULTY, PROFESSION, SUBJECTS);

select a.FACULTY, PROFESSION, SUBJECTS, round(avg(cast(NOTE as float(4))),2) [�������_�������]
	from ((FACULTY a inner join GROUPS b on a.FACULTY = b.FACULTY)
	inner join STUDENTS on b.IDGROUP = STUDENTS.IDGROUP) 
	inner join PROGRESS on STUDENTS.IDSTUDENT = PROGRESS.IDSTUDENT
	where a.FACULTY = '���'
	group by a.FACULTY, PROFESSION, SUBJECTS
		UNION
	select a.FACULTY, PROFESSION, SUBJECTS, round(avg(cast(NOTE as float(4))),2) [�������_�������]
	from ((FACULTY a inner join GROUPS b on a.FACULTY = b.FACULTY)
	inner join STUDENTS on b.IDGROUP = STUDENTS.IDGROUP) 
	inner join PROGRESS on STUDENTS.IDSTUDENT = PROGRESS.IDSTUDENT
	where a.FACULTY = '����'
	group by a.FACULTY, PROFESSION, SUBJECTS

select a.FACULTY, PROFESSION, SUBJECTS, round(avg(cast(NOTE as float(4))),2) [�������_�������]
	from ((FACULTY a inner join GROUPS b on a.FACULTY = b.FACULTY)
	inner join STUDENTS on b.IDGROUP = STUDENTS.IDGROUP) 
	inner join PROGRESS on STUDENTS.IDSTUDENT = PROGRESS.IDSTUDENT
	where a.FACULTY = '���'
	group by a.FACULTY, PROFESSION, SUBJECTS
		UNION ALL
	select a.FACULTY, PROFESSION, SUBJECTS, round(avg(cast(NOTE as float(4))),2) [�������_�������]
	from ((FACULTY a inner join GROUPS b on a.FACULTY = b.FACULTY)
	inner join STUDENTS on b.IDGROUP = STUDENTS.IDGROUP) 
	inner join PROGRESS on STUDENTS.IDSTUDENT = PROGRESS.IDSTUDENT
	where a.FACULTY = '����'
	group by a.FACULTY, PROFESSION, SUBJECTS

select a.FACULTY, PROFESSION, SUBJECTS, round(avg(cast(NOTE as float(4))),2) [�������_�������]
	from ((FACULTY a inner join GROUPS b on a.FACULTY = b.FACULTY)
	inner join STUDENTS on b.IDGROUP = STUDENTS.IDGROUP) 
	inner join PROGRESS on STUDENTS.IDSTUDENT = PROGRESS.IDSTUDENT
	where a.FACULTY = '���'
	group by a.FACULTY, PROFESSION, SUBJECTS
		intersect
	select a.FACULTY, PROFESSION, SUBJECTS, round(avg(cast(NOTE as float(4))),2) [�������_�������]
	from ((FACULTY a inner join GROUPS b on a.FACULTY = b.FACULTY)
	inner join STUDENTS on b.IDGROUP = STUDENTS.IDGROUP) 
	inner join PROGRESS on STUDENTS.IDSTUDENT = PROGRESS.IDSTUDENT
	where a.FACULTY = '����'
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

select  min(�������.����������_��_������) [�����������_����������],
		max(����������_��_������) [������������_����������],
		count(*) [����������_�������],
		sum(����������_��_������) [�����_�������]	
from �������

select ������������_������, min(����_�������) [�����������_����], COUNT(*) [����������_����������_�������]
	from ������ inner join �������
	on ������.������������_�����������_������ = �������.������������_������
	and �������.����������_��_������ > 20 
	group by ������������_������

select * 
from(select case when ����_������� between 1 and 300 then '���� < 300'
	when ����_������� between 300 and 600 then '���� �� 300 �� 600'
	else '���� ������ 600'
	end [������_����], count(*) [����������]
from ������ group by case
	 when ����_������� between 1 and 300 then '���� < 300'
	when ����_������� between 300 and 600 then '���� �� 300 �� 600'
	else '���� ������ 600'
	end) as T
		order by case [������_����]
		 when '���� < 300' then 3
		 when '���� �� 300 �� 600' then 2
		 when '���� ������ 600' then 1
		 else 0 
		 end

select ������������_�����������_������, ����_�������, sum(����������_�����������_������) [����������]
from ������
where ������������_�����������_������ in ('���������� ������', '�����')
group by rollup (������������_�����������_������, ����_�������)

select ������������_�����������_������, sum(����������_�����������_������) [����������]
	from ������ where ���������� = '��� ������� ����'
	group by ������������_�����������_������
		union
select ������������_�����������_������, sum(����������_�����������_������) [����������]
	from ������ where ���������� = '��� ���������'
	group by ������������_�����������_������

select ������������_�����������_������, sum(����������_�����������_������) [����������]
	from ������ where ���������� = '��� ������� ����'
	group by ������������_�����������_������
		union all
select ������������_�����������_������, sum(����������_�����������_������) [����������]
	from ������ where ���������� = '��� ���������'
	group by ������������_�����������_������

select �������.������������_������, ������.����_�������, sum(����������_�����������_������) [����������]
	from ������� inner join ������ on �������.������������_������ = ������.������������_�����������_������
	group by ������������_������, ����_�������
		intersect
select �������.������������_������, ������.����_�������, sum(����������_�����������_������) [����������]
	from ������� inner join ������ on �������.������������_������ = ������.������������_�����������_������
	where ���������� = '��� ���������'
	group by ������������_������, ����_�������

select �������.������������_������, ������.����_�������, sum(����������_�����������_������) [����������]
	from ������� inner join ������ on �������.������������_������ = ������.������������_�����������_������
	group by ������������_������, ����_�������
		except
select �������.������������_������, ������.����_�������, sum(����������_�����������_������) [����������]
	from ������� inner join ������ on �������.������������_������ = ������.������������_�����������_������
	where ���������� = '��� ���������'
	group by ������������_������, ����_�������


select * from ������



