use university
go
CREATE VIEW [�������������]
	as select TEACHER[���],
			  TEACHER_NAME[��� �������������],
			  GENDER[���],
			  PULPIT[��� �������] from TEACHER;
go
select * from �������������
go
create view [����������_������] (���������, ����������_������)
	as select FACULTY_NAME, count(PULPIT)
	from FACULTY a inner join PULPIT b
	on a.FACULTY = b.FACULTY
	group by FACULTY_NAME
go
select * from ����������_������
go 
create view [���������] (���, ������������_���������)
	as select AUDITORIUM, AUDITORIUM_NAME from AUDITORIUM
		where AUDITORIUM_TYPE like '��%'
go
select * from ���������
go
create view [����������_���������] (���, ������������_���������)
	as select AUDITORIUM, AUDITORIUM_NAME from AUDITORIUM
		where AUDITORIUM_TYPE like '��%' with check option
go
select * from ����������_���������
insert into AUDITORIUM (AUDITORIUM_NAME)
values ('gsfg')
go
create view [����������] (���, ������������_����������,���_�������)
	as select top 22 SUBJECTS,SUBJECT_NAME, PULPIT from SUBJECTS
	order by SUBJECT_NAME
go
select * from ����������
go
alter view [����������_������] (���������, ����������_������) with schemabinding
	as select FACULTY_NAME, count(PULPIT)
	from dbo.FACULTY a inner join dbo.PULPIT b
	on a.FACULTY = b.FACULTY
	group by FACULTY_NAME
go
select * from ����������_������

select * from SUBJECTS

use x_mybase
go
create view [������_�_�������] (�����, ��������, ����, ����������)
	as select ������������_������, ��������, ����,����������_��_������ 
	from �������
go
select * from ������_�_�������
go
create view [����������_�������] (������������_������, ����������, ����������_�����������_������)
	as select ������������_������, ����������_��_������, ����������_�����������_������
	from ������� a inner join ������ b
	on ������������_������ = ������������_�����������_������
go
select * from ����������_�������
go
create view [�������_������] (�����, ����, ����������) 
	as select ������������_������, ����, ����������_��_������  from �������
	where ���� <500
go
select * from �������_������
go
alter view [�������_������] (�����, ����, ����������) 
	as select ������������_������, ����, ����������_��_������  from �������
	where ���� <500 with check option
go
alter view [�������_������] (�����, ����, ����������) 
	as select top 5 ������������_������, ����, ����������_��_������  from �������
	where ���� <500 
	order by ����
go
select * from �������_������
go
alter view [����������_�������] (������������_������, ����������, ����������_�����������_������, ���������) with schemabinding
	as select ������������_������, ����������_��_������, ����������_�����������_������, ���������
	from dbo.������� a inner join dbo.������ b
	on ������������_������ = ������������_�����������_������
go
select * from ����������_�������
go
create view [������] (������������_������, ����������, ����������_�����������_������, ���������) with schemabinding
	as select ������������_������, ����������_��_������, ����������_�����������_������, ���������
	from dbo.������� a inner join dbo.������ b
	on ������������_������ = ������������_�����������_������
go
select * from ������
alter table ������� drop column ���������
alter table ������� add ����_�������� date
alter table ������� drop column ����_��������
select * from �������
