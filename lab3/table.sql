use balancevich_univer
create table STUDENT
(
	Номер_зачетки INT primary key,
	Фамилия_студента NVARCHAR(20) not null,
	Номер_группы int
);

alter table STUDENT add Дата_поступления date;
alter table STUDENT drop Column Дата_поступления;

insert into STUDENT (Номер_зачетки, Фамилия_студента, Номер_группы)
	values(1234312,'Другов',8),
		  (2281337,'Жмышенко',10);
insert into STUDENT (Номер_зачетки, Фамилия_студента, Номер_группы)
	values(1241244,'Уазов',13),
		  (3213121,'Хромосомов',47);
insert into STUDENT (Номер_зачетки, Фамилия_студента, Номер_группы)
	values(1234234,'Минский',43),
		  (9446231,'Дорохов',32);
insert into STUDENT (Номер_зачетки, Фамилия_студента, Номер_группы)
	values(2546322,'Мирный',24),
		  (1357323,'Казах',16);

select count(*) from STUDENT;

select distinct top(3) Фамилия_студента, Номер_группы
	from STUDENT order by Фамилия_студента desc;

update STUDENT set Номер_группы = 5;

insert into STUDENT (Номер_зачетки, Фамилия_студента, Номер_группы)
	values(1111111,'Петров',12);

delete from STUDENT where Номер_зачетки = 1111111;

select distinct Фамилия_студента from STUDENT
	where Фамилия_студента like 'М%';

select distinct Номер_зачетки, Фамилия_студента, Номер_группы
	from STUDENT where Номер_зачетки 
						between	1111111 and 2222222	
select distinct Фамилия_студента from STUDENT 
	where Номер_зачетки in (1234234,2281337)
drop table STUDENT

