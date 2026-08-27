-- 5_1 Функция: Создать функцию PostgreSQL с именем 
-- CalculateAnnualBonus, которая принимает employee_id и 
-- Salary  в качестве входных данных и возвращает рассчитанную 
-- сумму бонуса (10 % от Salary) для этого сотрудника. Используйте 
-- PL/pgSQL для тела функции. 
create or replace function CalculateAnnualBonus(employee_id INTEGER, salary NUMERIC)
returns numeric as $$
--language PL/pgSQL
begin 
	return salary * 0.10;
end;
$$ LANGUAGE plpgsql;

-- 5_2 Использовать эту функцию в операторе SELECT, чтобы увидеть 
-- потенциальный бонус для каждого сотрудника.
select employeeid, CalculateAnnualBonus(employeeid, salary)
from employees; 

-- 5_3 Представление (View): Создать представление с именем 
-- IT_Department_View, которое показывает EmployeeID, 
-- FirstName, LastName и Salary только для сотрудников из отдела 'IT'.
create view IT_Department_View as
select 
    employeeid,
    firstname,
    lastname,
    salary
from Employees
where department = 'IT';

-- 5_4 Выбрать данные из вашего представления IT_Department_View.
SELECT * FROM IT_Department_View;