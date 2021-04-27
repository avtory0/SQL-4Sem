use university

--task 1
declare @sbj char(100), @s char(100) = ''
declare CursIsit cursor
		for select SUBJECTS from SUBJECTS where PULPIT = 'ИСиТ'
open CursIsit
fetch CursIsit into @sbj
print 'Список дисциплин'
while @@FETCH_STATUS = 0
	begin
	set @s = RTRIM(@sbj)+','+@s
	
	fetch CursIsit into @sbj
end
print @s
close CursIsit
deallocate CursIsit

select * from SUBJECTS

--task 2

declare crsr cursor local 
		 for select SUBJECTS, PULPIT  from SUBJECTS 
declare @subj char(10), @plpt char(10)
open crsr 
fetch crsr into @subj, @plpt
print @subj + '' + @plpt
close crsr
go

declare crsr cursor global 
		 for select SUBJECTS, PULPIT  from SUBJECTS 
declare @subj char(10), @plpt char(10)
open crsr 
fetch crsr into @subj, @plpt
print @subj + '' + @plpt
close crsr
go
deallocate crsr
select * from SUBJECTS