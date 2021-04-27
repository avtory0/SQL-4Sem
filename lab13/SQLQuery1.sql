use university
go

create procedure PSUBJECT
as
begin 
	declare @k int = (select count(*) from SUBJECTS)
	select * from SUBJECTS
	return @k
end;
go
declare @n int =0
exec @n = PSUBJECT
print '���������� ���������: ' + cast(@n as varchar(3))
go

--task 2

alter procedure PSUBJECT @p varchar(20), @c int output
as begin
	select * from SUBJECTS where SUBJECTS = @p
	set @c= @@ROWCOUNT;
end;

declare @in int, @out int
exec @in = PSUBJECT @p = '����', @c = @out output;
print '���-�� ���������: ' + cast(@out as varchar(3))
go

--task 3

ALTER procedure PSUBJECT @p varchar(20)
as begin
	SELECT * from SUBJECTS where SUBJECTS = @p;
end;


CREATE table #SUBJECTs
(
	���_�������� varchar(20),
	��������_�������� varchar(100),
	������� varchar(20)
);
INSERT #SUBJECTs EXEC PSUBJECT @p = '���';
INSERT #SUBJECTs EXEC PSUBJECT @p = '����';
SELECT * from #SUBJECTs;
go

--task 4

create procedure PAUDITORIUM_INSERT 
		@a char(20),
		@n varchar(50),
		@c int = 0,
		@t char(10)
as 
begin try
	insert into AUDITORIUM(AUDITORIUM,AUDITORIUM_NAME,AUDITORIUM_CAPACITY,AUDITORIUM_TYPE)
		values(@a,@n,@c,@t)
	return 1
end try
begin catch
	print '����� ������: ' + cast(error_number() as varchar(6));
	print '���������: ' + error_message();
	print '�������: ' + cast(error_severity() as varchar(6));
	print '�����: ' + cast(error_state() as varchar(8));
	print '����� ������: ' + cast(error_line() as varchar(8));
	if error_procedure() is not null   
	print '��� ���������: ' + error_procedure();
	return -1;
end catch

declare @rc int
exec @rc = PAUDITORIUM_INSERT @a = '320-4', @n = '��', @c = 200, @t = '320-4'
print '��� ������: ' + cast(@rc as varchar(3));
go

--task 5

create procedure SUBJECT_REPORT @p char(10)
as begin	
DECLARE @rc int;
begin try
	DECLARE @sb char(10), @r varchar(100) = '';
	DECLARE sbj CURSOR for 
		SELECT SUBJECTS from SUBJECTS where PULPIT = @p;
	if not exists(SELECT SUBJECTS from SUBJECTS where PULPIT = @p)
		raiserror('������', 11, 1);
	else 
	OPEN sbj;
	fetch sbj into @sb;
	print '��������: ';
	while @@fetch_status = 0
	begin
		set @r = rtrim(@sb) + ', ' + @r;  
		set @rc = @rc + 1;
		fetch sbj into @sb;
	end
	print @r;
	CLOSE sbj;
	return @rc;
end try
begin catch
	print '������ � ����������' 
	if error_procedure() is not null   
	print '��� ���������: ' + error_procedure();
	return @rc;
end catch;
end;

DECLARE @k2 int;  
EXEC @k2 = SUBJECT_REPORT @p ='����';  
print '���������� ���������: ' + cast(@k2 as varchar(3));
go

--task 6

CREATE procedure PAUDITORIUM_INSERTX
		@a char(20),
		@n varchar(50),
		@c int = 0,
		@t char(10),
		@tn varchar(50)	--���., ��� ����� � AUD_TYPEAUD_TYPENAME
as begin
DECLARE @rc int = 1;
begin try
	set transaction isolation level serializable;          
	begin tran
	INSERT into AUDITORIUM_TYPE(AUDITORIUM_TYPE, AUDITORIUM_TYPENAME)
				values(@n, @tn);
	EXEC @rc = PAUDITORIUM_INSERT @a, @n, @c, @t;
	commit tran;
	return @rc;
end try
begin catch
	print '����� ������: ' + cast(error_number() as varchar(6));
	print '���������: ' + error_message();
	print '�������: ' + cast(error_severity() as varchar(6));
	print '�����: ' + cast(error_state() as varchar(8));
	print '����� ������: ' + cast(error_line() as varchar(8));
	if error_procedure() is not  null   
	print '��� ���������: ' + error_procedure(); 
	if @@trancount > 0 rollback tran ; 
	return -1;
end catch;
end;


DECLARE @k3 int;  
EXEC @k3 = PAUDITORIUM_INSERTX '622-3', @n = '��', @c = 85, @t = '622-3', @tn = '����. �����'; 
print '��� ������: ' + cast(@k3 as varchar(3));

delete AUDITORIUM where AUDITORIUM='622-3';  
delete AUDITORIUM_TYPE where AUDITORIUM_TYPE='��';
go