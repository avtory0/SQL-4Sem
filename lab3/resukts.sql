create table RESULTS
(
	ID int primary key not null identity(1,1),
	student_name nvarchar(20),
	fst_exam int,
	scnd_exam int,
	trd_exam int,
	number_exam int,
	aver_value as (fst_exam + scnd_exam + trd_exam)/number_exam

)

update RESULTS set number_exam = 3;

insert into RESULTS (student_name, fst_exam, scnd_exam, trd_exam)
	values('Кирилл',5,6,7),
	('Мефодий',4,8,5)
insert into RESULTS (student_name, fst_exam, scnd_exam, trd_exam)
	values('Данила',8,8,9),
	('Арсен',3,5,1)


select * from RESULTS