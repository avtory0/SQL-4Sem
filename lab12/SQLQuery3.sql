use master

set nocount on
	if  exists (select * from  SYS.OBJECTS        -- ������� X ����?
	            where OBJECT_ID= object_id(N'DBO.Test') )	            
	drop table Test;
	
declare @i int, @check char = 'c'
	set implicit_transactions on
	create table Test(colum nvarchar(10))
		insert Test values ('row1'),('row2'),('row3')
		set @i = (select count(*) from Test)
		print '���-�� ������ � �������: ' + cast(@i as varchar(2))
		if @check = 'c' commit else rollback
		set implicit_transactions off

if  exists (select * from  SYS.OBJECTS       
	            where OBJECT_ID= object_id(N'DBO.Test') )
	print '������� X ����';  
      else print '������� X ���'
go
--task 2

use university

begin try        
	begin tran                 -- ������  ����� ����������
		insert FACULTY values ('��', '��������� ������ ����');
	    insert FACULTY values ('���', '��������� print-����������');
	commit tran;               -- �������� ����������
end try

begin catch
	print '������: '+ case 
		when error_number() = 2627 and patindex('%FACULTY_PK%', error_message()) > 0 then '������������ '	--������� 1-�� ���������
		else '����������� ������: '+ cast(error_number() as  varchar(5))+ error_message()  
	end;
	if @@trancount > 0 rollback tran; -- ��.����������� ��.>0,  ����� �� ��������� 	  
end catch;

select * from FACULTY
DELETE FACULTY WHERE FACULTY = '��';
DELETE FACULTY WHERE FACULTY = '���';

--task3

declare @point varchar(32)

begin try
	begin tran
		set @point = 'p1'
		save tran  @point --����� ����� 1
		insert STUDENTS(IDGROUP, NAME, BDAY, INFO, FOTO) values
		                      (20,'���������', '1997-08-02', NULL, NULL),
							  (20,'����������', '1997-08-06', NULL, NULL),
							  (20,'���������', '1997-08-01', NULL, NULL),
							  (20,'�����', '1997-08-03', NULL, NULL);    
		set @point = 'p2'
		save tran @point --�����. �����  2
		insert STUDENTS(IDGROUP, NAME, BDAY, INFO, FOTO) values
		                      (20,'�����', '1997-08-02', NULL, NULL)
		commit tran
end try

begin catch
	print '������: '+ case 
		when error_number() = 2627 and patindex('%STUDENT_PK%', error_message()) > 0 then '������������ ��������' 
		else '����������� ������: '+ cast(error_number() as	  varchar(5)) + error_message()  
	end; 
    if @@trancount > 0 -- ���� ���������� �� ���������
	begin
	   print '����������� �����: '+ @point;
	   rollback tran @point; -- ����� � ��������� �����.�����
	   commit tran; -- �������� ���������, ������ �� �����.����� 
	end;     
end catch;	
go
--task4

set transaction isolation level read uncommitted
begin transaction

----------------------t1-------------------
	select @@SPID, 'insert FACULTY' '���������', * from FACULTY
										where FACULTY = '���'
	select @@SPID, 'update PULPIT' '���������', * from PULPIT
										where FACULTY = '���'
	commit

-----------------------t2---------------------
begin transaction
	select @@SPID
	insert FACULTY values ('���', '������ ����� ���������')
	update PULPIT set FACULTY = '��' where PULPIT = '���'
	
rollback

--task5

SELECT * from PULPIT;
set transaction isolation level READ COMMITTED
begin transaction
select count(*) from PULPIT
where FACULTY = '��'; --��������� ���� ��������, ����� ��������� 0

-----t1-------
-----t2-------

select 'update PULPIT' '���������', count(*) --����� ��������� 1, �.�. ��������� ���������
from PULPIT where FACULTY = '��'; --�������� ��������������� ������
commit;
------B----

begin transaction

------t1-----

update PULPIT set FACULTY = '��' where PULPIT = '����';
commit;

--task6



------------------------------
use x_mybase

set nocount on
	if  exists (select * from  SYS.OBJECTS        -- ������� X ����?
	            where OBJECT_ID= object_id(N'DBO.Test') )	            
	drop table Test;
	
declare @i int, @check char = 'c'
	set implicit_transactions on
	create table Test(colum nvarchar(10))
		insert Test values ('row1'),('row2'),('row3')
		set @i = (select count(*) from Test)
		print '���-�� ������ � �������: ' + cast(@i as varchar(2))
		if @check = 'c' commit else rollback
		set implicit_transactions off

if  exists (select * from  SYS.OBJECTS       
	            where OBJECT_ID= object_id(N'DBO.Test') )
	print '������� X ����';  
      else print '������� X ���'

---task2

begin try        
	begin tran                 
		insert ������� values ('������', 450,'�������',7,'����� �5');
	    delete ������� where ������������_������ = '���-��'
	commit tran;               
end try

begin catch
	print '������: '+ case 
		when error_number() = 2627 and patindex('%FACULTY_PK%', error_message()) > 0 then '������������ '	--������� 1-�� ���������
		else '����������� ������: '+ cast(error_number() as  varchar(5))+ error_message()  
	end;
	if @@trancount > 0 rollback tran; -- ���� >0 - ���������� �� ���������	  
end catch;

select * from �������


--task3
 
declare @point varchar(32)

begin try
	begin tran
		set @point = 'p1'
		save tran  @point --����� ����� 1
		insert ������ values ('�����',530,'������',18,'����� �3'); --������   
		set @point = 'p2'
		save tran @point --�����. �����  2
		delete ������� where ������������_������ = '��������'
		commit tran
end try

begin catch
	print '������: '+ case 
		when error_number() = 2627 and patindex('%STUDENT_PK%', error_message()) > 0 then '������������ ��������' 
		else '����������� ������: '+ cast(error_number() as	  varchar(5)) + error_message()  
	end; 
    if @@trancount > 0 -- ���� ���������� �� ���������
	begin
	   print '����������� �����: '+ @point;
	   rollback tran @point; -- ����� � ��������� �����.�����
	   commit tran; -- �������� ���������, ������ �� �����.����� 
	end;     
end catch;	

--task4
set transaction isolation level read uncommitted
begin transaction

----------------------t1-------------------
	select @@SPID, 'insert ������' '���������', * from �������
										where ������������_������ = '����'
	select @@SPID, 'update ������' '���������', * from ������
										where ������������_�����������_������ = '����'
	commit

-----------------------t2---------------------
begin transaction
	select @@SPID
	insert ������� values ('�����',46, '������ �����',34,'����� �1')
	update ������ set ������������_�����������_������ = '����' where ������������_�����������_������ = '������� �����'
	
rollback

select * from ������

--task5
set transaction isolation level READ COMMITTED 
begin transaction 
	select count(*) from ������ where ������������_�����������_������ = '����';
	-------------------------- t1 ------------------ 
	-------------------------- t2 -----------------
	select  'update ������'  '���������', count(*)
	                           from ������  where ������������_�����������_������ = '����';
	commit; 

	--- B ---	
begin transaction 	  
	-------------------------- t1 --------------------
    update ������ set ������������_�����������_������ = '����' 
                                       where ������������_�����������_������ = '�����' 
    commit; 

--task 6

set transaction isolation level  REPEATABLE READ 
	begin transaction 
	select ���������� from ������ where ������������_�����������_������ = '����';
	-------------------------- t1 ------------------ 
	-------------------------- t2 -----------------
	select  case
          when ���������� = '��� �����������' then 'insert  ������'  else ' ' 
end '���������', ���������� from ������  where ������������_�����������_������ = '����';
	commit; 

	--- B ---	
	begin transaction 	  
	-------------------------- t1 --------------------
          insert ������ values (12,23,580, '2020-01-12', '����','��� ���������');
          commit; 

--task7 serializable
insert ������� values('������ �������',879,'�����', 75, '����� �5')
insert ������� values('�������',543,'������', 43, '����� �3')
insert ������ values (32,87,454,'2020-01-25','������ �������', '���')
insert ���������� values ('���', 432534, '������')

--�
set transaction isolation level serializable
begin transaction

delete ������ where ���������� = '���'
insert ������ values (32,87,454,'2020-01-25','�������', '���')
update ������ set ���������� = '���' where ������������_�����������_������ = '�������'
select ���������� from ������ where ������������_�����������_������ = '�������'
----------------t1-------------
select ���������� from ������ where ������������_�����������_������ = '�������'
----------------t2-------------
commit
--B
begin transaction
delete ������ where ���������� = '���'
insert ������ values (32,87,454,'2020-01-25','�������', '���')
update ������ set ���������� = '���' where ������������_�����������_������ = '�������'
select ���������� from ������ where ������������_�����������_������ = '�������'
----------------t1-------------
select ���������� from ������ where ������������_�����������_������ = '�������'
commit

select * from ������

--task8

begin tran 
	insert ���������� values('����������',543423,'����')
	begin tran
		update ������ set ���������� = '����������' where ���������� = '���'
		commit
		if @@TRANCOUNT > 0 rollback
	select 
	(select count (*) from ������ where ���������� = '����������') '������',
	(select count (*) from ���������� where ���������� = '����������') '���������';

select * from ����������