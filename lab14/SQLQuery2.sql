use university

--task 1 ������� ���-�� ���������
go 
create function Count_Students(@facode varchar(20)) returns int as begin declare @cnt int = 0
set @cnt = (select count(IDSTUDENT) from STUDENTS join GROUPS
			on STUDENTS.IDGROUP = GROUPS.IDGROUP join FACULTY
			on GROUPS.FACULTY = FACULTY.FACULTY where FACULTY.FACULTY = @facode )
return @cnt
end

declare @a int = dbo.Count_Students('���')
print '���-�� ��������� = ' + cast(@a as varchar(4));
select * from FACULTY

--task 2 �������� ��������� � �����

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

select distinct PULPIT, dbo.FSUBJECTS(PULPIT)[������ ���������] from SUBJECTS

--task 3 ��������� ������� ������������ ��������� � ������� �� ���. 
--��������� ��� ���������. ���� (null,null) ���������� ������ ���� ����������� � ������
-- ('',null) - ��������� � ��� �������� �� ���
--(null,'') - ������ �����. ��������� � ������� �� ���
go
create function FFACPUL (@f varchar(50), @p varchar(50)) returns table
as return 
select FACULTY.FACULTY, PULPIT.PULPIT from FACULTY left outer join PULPIT
	on FACULTY.FACULTY = PULPIT.FACULTY
		where FACULTY.FACULTY = ISNULL(@f,FACULTY.FACULTY)
		and PULPIT.PULPIT = ISNULL(@p, PULPIT.PULPIT)
go

select * from dbo.FFACPUL(null,null)
select * from dbo.FFACPUL('����',null)
select * from dbo.FFACPUL(null,'��')

--task 4 ���� �-��� (1 �������� �������� ��� �������)
-- ���������� ���-�� �������� �� �������� �������
-- ���� null - ����� ���-�� ��������

go
create function FCTEACHER (@p varchar(50)) returns int 
as
begin 
	declare @rc int = (select count(*) from TEACHER
		where PULPIT = ISNULL(@p,PULPIT))
		return @rc
end
go

select	PULPIT, dbo.FCTEACHER(PULPIT)[���-�� ��������������] from TEACHER
select dbo.FCTEACHER(null)[����� ����� ��������������]

--xmybase

use x_mybase
--task 1 ���� �-��� ������� ���-�� ������� ���������� ��� ��� ���� �-����
go
create function count_zakazy(@p varchar(20)) returns int 
as begin declare @rc int = 0
set @rc = (select count(�����_������) 
	from ������ join ����������
		on ������.���������� = ����������.���������� 
			where ����������.���������� = @p)
return @rc
end
go

declare @a int = dbo.count_zakazy('��� ���������') --����� �1
print '���-�� ������� = ' + cast(@a as varchar(4))

select ����������, dbo.count_zakazy(����������) from ���������� --����� �2

select * from ������

--task 2 ���� �-��� ����� � ��������� �������

go
create function ZAKAZY (@p varchar(20)) returns varchar(300)
as begin 
declare @tv char(20), @t varchar(300) = '���������� ������: '
declare CrsrTovary cursor local 
for select ������������_�����������_������ from ������
											where ���������� = @p
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

select ����������, dbo.ZAKAZY(����������) from ����������

--task 3 ���� �-��� � ����� ����������� (null,null)
go
create function PRICE (@tv varchar(50), @p real) returns table
as return
select ������������_������, ����, ����_�������
	from ������� left outer join ������
		on ������������_������ = ������������_�����������_������
			where ������������_������ = ISNULL(@tv, ������������_������)
			and 
				����_������� = ISNULL(@p, ����_�������)

select * from dbo.PRICE (null,null) -- ������� ���
select * from dbo.PRICE ('����',null) -- ���� ����� ������
select * from dbo.PRICE (null,'400') -- ������ �����. ������ ����
select * from �������

--task 4 ���� �-��� 
go
create function KolTovarov(@p varchar(50)) returns int
as
begin 
	declare	@kol int = (select count(*) from ������
	where ���������� = ISNULL(@p, ����������))
	return @kol
end
go

select ����������, dbo.KolTovarov(����������)[���-�� �������] from ������ --������ ����
select dbo.KolTovarov(null) [����� �������] -- ����� �������
