-- Создать нового пользователя PostgreSQL (роль) с именем hr_user и паролем.
create user hr_user with password '12345';

-- Предоставить hr_user право SELECT на таблицу Employees. 
grant select on table employees to hr_user;

-- Как пользователь-администратор, предоставить hr_user права 
grant insert, UPDATE on table employees to hr_user;