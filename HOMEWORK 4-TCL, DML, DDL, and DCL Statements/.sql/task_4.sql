-- 4_1 Увеличить Salary всех сотрудников в отделе 'HR' на 10%.

update employees 
set salary = 1.10 * salary
where department = 'HR';


-- 4_2 Обновить Department любого сотрудника с Salary выше 70000.00 на 'Senior IT'.

update employees 
set department = 'Senior IT'
where salary > 70000.00;

-- 4_3 Удалить всех сотрудников, которые не назначены ни на один проект в 
-- таблице EmployeeProjects. Подсказка: Используйте подзапрос NOT 
-- EXISTS или LEFT JOIN 

delete from employees e
where not exists (
    select 1
    from employeeprojects ep
    WHERE ep.employeeid = e.employeeid
);

-- 4_4 В рамках одной транзакции, вставить новый проект и назначить на 
-- него двух существующих сотрудников с определенным количеством 
-- HoursWorked в EmployeeProjects. 
begin;
insert into projects (projectid, projectname, budget,  startdate, enddate) 
values (4, 'F2-F4 mobile game (iOS)', 550000.00, CURRENT_DATE, '2026-10-10');

insert into EmployeeProjects (employeeid, projectid, hoursworked) 
values (1, 4, 8),   
       (2, 4, 4);   
select * from EmployeeProjects where projectid = 4;

commit;