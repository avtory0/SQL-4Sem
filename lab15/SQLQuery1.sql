use university
--task1 
--after-������� teacher 
go 
create table TR_AUDIT
(
ID int identity,
STMT varchar(20)
check (STMT in ('INS', 'DEL', 'UPD')),
TRNAME varchar(50),
CC varchar(300)
)
	go
    create  trigger TR_TEACHER_INS 
      on TEACHER after INSERT  
      as
      declare @a1 char(10), @a2 varchar(100), @a3 char(1), @a4 char(20), @in varchar(300);
      print '�������';
      set @a1 = (select TEACHER from INSERTED);
      set @a2= (select TEACHER_NAME from INSERTED);
      set @a3= (select GENDER from INSERTED);
	  set @a4 = (select PULPIT from INSERTED);
      set @in = @a1+' '+ @a2 +' '+ @a3+ ' ' +@a4;
      insert into TR_AUDIT(STMT, TRNAME, CC)  
                            values('INS', 'TR_TEACHER_INS', @in);	         
      return;  
      go

	  insert into  TEACHER values('���', '������', '�', '����');
	  select * from TR_AUDIT
	  delete from TEACHER where TEACHER='����';
	  
--task2
--delete-������� 

go
    create  trigger TR_TEACHER_DEL 
      on TEACHER after DELETE  
      as
      declare @a1 char(10), @a2 varchar(100), @a3 char(1), @a4 char(20), @in varchar(300);
      print '��������';
      set @a1 = (select TEACHER from DELETED);
      set @a2= (select TEACHER_NAME from DELETED);
      set @a3= (select GENDER from DELETED);
	  set @a4 = (select PULPIT from DELETED);
      set @in = @a1+' '+ @a2 +' '+ @a3+ ' ' +@a4;
      insert into TR_AUDIT(STMT, TRNAME, CC)  
                            values('DEL', 'TR_TEACHER_DEL', @in);	         
      return;  
      go 
	   delete TEACHER where TEACHER='����'
	  select * from TR_AUDIT

	  drop table TR_AUDIT

--task3
--after-������� update

go
    alter  trigger TR_TEACHER_DEL 
      on TEACHER after UPDATE  
      as
      declare @a1 char(10), @a2 varchar(100), @a3 char(1), @a4 char(20), @in varchar(300);
	

      print '����������';
      set @a1 = (select TEACHER from INSERTED);
      set @a2= (select TEACHER_NAME from INSERTED);
      set @a3= (select GENDER from INSERTED);
	  set @a4 = (select PULPIT from INSERTED);
      set @in = @a1+' '+ @a2 +' '+ @a3+ ' ' +@a4;
      set @a1 = (select TEACHER from deleted);
      set @a2= (select TEACHER_NAME from DELETED);
      set @a3= (select GENDER from DELETED);
	  set @a4 = (select PULPIT from DELETED);
      set @in =@in + '' + @a1+' '+ @a2 +' '+ @a3+ ' ' +@a4;
      insert into TR_AUDIT(STMT, TRNAME, CC)  
                            values('UPD', 'TR_TEACHER_UPD', @in);	         
      return;  
      go
	  
	  update TEACHER set GENDER = '�' where TEACHER='����'
	  select * from TR_AUDIT
	  delete from TR_AUDIT where STMT = 'UPD'

--task4

go
create trigger TR_TEACHER   on TEACHER after INSERT, DELETE, UPDATE  
 as declare @a1 char(10), @a2 varchar(100), @a3 char(1), @a4 char(20), @in varchar(300);
	  declare @ins int = (select count(*) from inserted),
              @del int = (select count(*) from deleted); 
   if  @ins > 0 and  @del = 0
   begin
   print '�������: INSERT';
      set @a1 = (select TEACHER from INSERTED);
      set @a2= (select TEACHER_NAME from INSERTED);
      set @a3= (select GENDER from INSERTED);
	  set @a4 = (select PULPIT from INSERTED);
      set @in = @a1+' '+ @a2 +' '+ @a3+ ' ' +@a4;
      insert into TR_AUDIT(STMT, TRNAME, CC)  
                            values('INS', 'TR_TEACHER_INS', @in);	
	 end;
	else		  	 
    if @ins = 0 and  @del > 0
	begin
	print '�������: DELETE';
      set @a1 = (select TEACHER from DELETED);
      set @a2= (select TEACHER_NAME from DELETED);
      set @a3= (select GENDER from DELETED);
	  set @a4 = (select PULPIT from DELETED);
      set @in = @a1+' '+ @a2 +' '+ @a3+ ' ' +@a4;
      insert into TR_AUDIT(STMT, TRNAME, CC)  
                            values('DEL', 'TR_TEACHER_DEL', @in);
	  end;
	else	  
    if @ins > 0 and  @del > 0
	begin
	print '�������: UPDATE'; 
      set @a1 = (select TEACHER from INSERTED);
      set @a2= (select TEACHER_NAME from INSERTED);
      set @a3= (select GENDER from INSERTED);
	  set @a4 = (select PULPIT from INSERTED);
      set @in = @a1+' '+ @a2 +' '+ @a3+ ' ' +@a4;
      set @a1 = (select TEACHER from deleted);
      set @a2= (select TEACHER_NAME from DELETED);
      set @a3= (select GENDER from DELETED);
	  set @a4 = (select PULPIT from DELETED);
      set @in =@in + '' + @a1+' '+ @a2 +' '+ @a3+ ' ' +@a4;
      insert into TR_AUDIT(STMT, TRNAME, CC)  
                            values('UPD', 'TR_TEACHER_UPD', @in); 
	  end;
	  return;  

	  delete TEACHER where TEACHER='����'
	  insert into  TEACHER values('����', '������', '�', '����');
	  	  update TEACHER set GENDER = '�' where TEACHER='����'
	  select * from TR_AUDIT

--task5

update TEACHER set GENDER = '�' where TEACHER='����'
 select * from TR_AUDIT

 --task6
 --�������� ������ ����������� �� ����-��� DELETE � ����������� ��������������� ������ � ������� TR_AUDIT.

 go   
create trigger TR_TEACHER_DEL1 on TEACHER after DELETE  
as print ' TR_TEACHER_DEL1';
 return;  
go 
create trigger TR_TEACHER_DEL2 on TEACHER after DELETE  
as print ' TR_TEACHER_DEL2';
 return;  
go  
create trigger TR_TEACHER_DEL3 on TEACHER after DELETE  
as print ' TR_TEACHER_DEL3';
 return;  
go  

select t.name, e.type_desc 
  from sys.triggers  t join  sys.trigger_events e  on t.object_id = e.object_id  
  where OBJECT_NAME(t.parent_id)='TEACHER' and e.type_desc = 'DELETE' ;  

exec  SP_SETTRIGGERORDER @triggername = 'TR_TEACHER_DEL3', 
	                        @order='First', @stmttype = 'DELETE';
exec  SP_SETTRIGGERORDER @triggername = 'TR_TEACHER_DEL2', 
	                        @order='Last', @stmttype = 'DELETE';


select t.name, e.type_desc 
  from sys.triggers  t join  sys.trigger_events e  on t.object_id = e.object_id  
  where OBJECT_NAME(t.parent_id)='TEACHER' and e.type_desc = 'DELETE';
 
 --task7
 go 
	create trigger TR_Tran 
	on PULPIT after INSERT, DELETE, UPDATE  
	as declare @c int = (select count (*) from PULPIT); 	 
	 if (@c >24) 
	 begin
       raiserror('����� ���������� ������ �� ����� ���� >21', 10, 1);
	 rollback; 
	 end; 
	 return;  
	 go
	 drop trigger TR_Tran

	insert into PULPIT(PULPIT) values ('trgef')

--task 8 instead of trigger  ��������� ��������
go 
	create trigger F_INSTEAD_OF 
	on FACULTY instead of DELETE 
	as 
raiserror(N'�������� ���������', 10, 1);
	return;
go

select * from FACULTY
delete FACULTY where FACULTY = '����'

--task 9
	

  go
create trigger DDL_UNIVER on database
for DDL_DATABASE_LEVEL_EVENTS
as declare @t varchar(50) = EVENTDATA().value('(/EVENT_INSTANCE/EventType)[1]', 'varchar(50)');
declare @t1 varchar(50) = EVENTDATA().value('(/EVENT_INSTANCE/ObjectName)[1]', 'varchar(50)');
declare @t2 varchar(50) = EVENTDATA().value('(/EVENT_INSTANCE/ObjectType)[1]', 'varchar(50)');
if @t1 = 'TEACHER'
begin
print '��� �������: '+@t;
print '��� �������: '+@t1;
print '��� �������: '+@t2;
raiserror( N'�������� � �������� TEACHER ���������', 16, 1);
rollback;
end;

alter table TEACHER drop column TEACHER

select * from TEACHER


 use x_mybase

 --task1 
--after-������� ������ insert
go 
create table TR_Tov
(
ID int identity,
STMT varchar(20)
check (STMT in ('INS', 'DEL', 'UPD')),
TRNAME varchar(50),
CC varchar(300)
)

	go
    create  trigger TR_TOV_INS 
      on ������� after INSERT  
      as
      declare @a1 varchar(50), @a2 real, @a3 varchar(100), @a4 int, @a5 varchar(30), @in varchar(400);
      print '�������';
      set @a1 = (select ������������_������ from INSERTED);
      set @a2= (select ���� from INSERTED);
      set @a3= (select �������� from INSERTED);
	  set @a4 = (select ����������_��_������ from INSERTED);
	  set @a5 = (select ��������� from INSERTED);
      set @in = @a1+' '+ @a2 +' '+ @a3+ ' ' +@a4 + '' + @a5; 
      insert into TR_Tov(STMT, TRNAME, CC)  
                            values('INS', 'TR_TOV_INS', @in);	         
      return;  
      go
	  

	  insert into  ������� values('���15',1000, '�����������15', 11111, '�');
	  select * from TR_Tov
	  delete from TEACHER where TEACHER='����';

--task2