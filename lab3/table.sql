use balancevich_univer
create table STUDENT
(
	�����_������� INT primary key,
	�������_�������� NVARCHAR(20) not null,
	�����_������ int
);

alter table STUDENT add ����_����������� date;
alter table STUDENT drop Column ����_�����������;

insert into STUDENT (�����_�������, �������_��������, �����_������)
	values(1234312,'������',8),
		  (2281337,'��������',10);
insert into STUDENT (�����_�������, �������_��������, �����_������)
	values(1241244,'�����',13),
		  (3213121,'����������',47);
insert into STUDENT (�����_�������, �������_��������, �����_������)
	values(1234234,'�������',43),
		  (9446231,'�������',32);
insert into STUDENT (�����_�������, �������_��������, �����_������)
	values(2546322,'������',24),
		  (1357323,'�����',16);

select count(*) from STUDENT;

select distinct top(3) �������_��������, �����_������
	from STUDENT order by �������_�������� desc;

update STUDENT set �����_������ = 5;

insert into STUDENT (�����_�������, �������_��������, �����_������)
	values(1111111,'������',12);

delete from STUDENT where �����_������� = 1111111;

select distinct �������_�������� from STUDENT
	where �������_�������� like '�%';

select distinct �����_�������, �������_��������, �����_������
	from STUDENT where �����_������� 
						between	1111111 and 2222222	
select distinct �������_�������� from STUDENT 
	where �����_������� in (1234234,2281337)
drop table STUDENT

