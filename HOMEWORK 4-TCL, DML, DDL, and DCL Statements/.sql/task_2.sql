-- 2_1 Создать новую таблицу с именем Departments со столбцами: 
-- DepartmentID (SERIAL PRIMARY KEY), DepartmentName 
-- (VARCHAR(50), UNIQUE, NOT NULL), Location (VARCHAR(50)). 
CREATE TABLE Departments ( 
	DepartmentID SERIAL PRIMARY KEY, 
	DepartmentName VARCHAR(50) unique NOT NULL,
	Location VARCHAR(50)
);

-- 2_2 Изменить таблицу Employees, добавив новый столбец с именем Email (VARCHAR(100)). 
alter table Employees add column Email VARCHAR(100);

-- 2_3 Заполнить столбец Email для всех текущих сотрудников 
-- уникальными значениями (например, через UPDATE). 
update Employees
	set Email = 'smith_a@dbeaver.com'
	where employeeid = 1;
update Employees
	set Email = 'bobobob@dbeaver.com'
	where employeeid = 2;
update Employees
	set Email = 'notBrown@dbeaver.com'
	where employeeid = 3;
update Employees
	set Email = 'PrinceAndPrinces@dbeaver.com'
	where employeeid = 4;
update Employees
	set Email = 'ThrwMolotov@dbeaver.com'
	where employeeid = 6;
update Employees
	set Email = 'RezRez@dbeaver.com'
	where employeeid = 7;

-- 2_4 Добавить ограничение UNIQUE к столбцу Email в таблице Employees. 
alter table Employees add constraint UQ_Email unique (Email);

-- 2_5 Переименовать столбец Location в таблице Departments в OfficeLocation.
alter table Departments rename column Location to OfficeLocation