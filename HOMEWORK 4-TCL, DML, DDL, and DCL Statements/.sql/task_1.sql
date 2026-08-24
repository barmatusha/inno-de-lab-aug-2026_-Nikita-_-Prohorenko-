--1_1 Вставить двух новых сотрудников в таблицу Employees (с любыми отделами, кроме 'IT').
insert into Employees (FirstName, LastName, Department, Salary) values
('Ivan', 'Molotov', 'Security', 40000.00), 
('Gleb', 'Reznov', 'Finance', 66000.00);

--1_2 Выбрать всех сотрудников из таблицы Employees. 
select * from Employees 

--1_3 Выбрать только FirstName и LastName сотрудников из отдела 'IT'.
select FirstName, LastName from Employees
where Department = 'IT'

--1_4 Обновить Salary 'Alice Smith' до 65000.00.
update Employees 
set Salary = 65000.00
where FirstName = 'Alice' and LastName = 'Smith'

--1_5 Удалить сотрудника 'Eve Davis'.
delete from Employees 
where FirstName = 'Eve' and LastName = 'Davis'

--1_6 Проверить все изменения, используя SELECT * FROM Employees;.
select * from Employees 