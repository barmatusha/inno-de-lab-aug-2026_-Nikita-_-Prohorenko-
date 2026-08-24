-- 6_1 Найти ProjectName всех проектов, в которых 'Bob Johnson' работал более 150 часов
select projectname
	from employees as e
	join employeeprojects as ep on e.employeeid = ep.employeeid
	join projects as p on ep.projectid = p.projectid
where e.firstname = 'Bob' and e.lastname = 'Johnson' and ep.hoursworked > 150;

-- 6_2 Увеличить Budget всех проектов на 10%, если к ним назначен хотя 
-- бы один сотрудник из отдела 'IT'. 
update projects as p
set budget = budget * 1.10
where exists (
	select 1 
	from employeeprojects as ep
	join employees as e on ep.employeeid = e.employeeid 
	where e.department = 'IT' and ep.projectid =p.projectid  
)

-- 6_3 Для любого проекта, у которого еще нет EndDate (EndDate IS NULL), 
-- установить EndDate на один год позже его StartDate.
update projects
set enddate = startdate + INTERVAL '1 year'
where enddate is null;

-- 6_4 Вставить нового сотрудника и немедленно назначить его на проект 
--'Website Redesign' с 80 отработанными часами, все в рамках одной 
--транзакции. Использовать предложение RETURNING, чтобы получить 
--EmployeeID вновь вставленного сотрудника. 

begin;

with new_employee as (
    insert into employees (firstname, lastname, department, salary, email)
    values ('Sasha', 'Bokova', 'IT', 65000, 'bokova.sa@dbeaver.com')
    returning employeeid
)
insert into employeeprojects (employeeid, projectid, hoursworked)
select 
    ne.employeeid,
    (select projectid from projects where projectname = 'Website Redesign'),
    80
from new_employee ne;

commit;