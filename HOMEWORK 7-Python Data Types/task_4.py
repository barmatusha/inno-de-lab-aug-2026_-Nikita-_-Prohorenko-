# Список ролей, переданный в запросе на авторизацию (содержит повторы)
requested_roles = ["guest", "developer", "guest", "admin", "developer", "guest"]
# Набор обязательных ролей для выполнения административных функций
required_admin_roles = {"admin", "security_officer", "audit_manager"}

requested_roles_set = set(requested_roles)

required_intersection_roles_set = requested_roles_set & required_admin_roles

missing_roles_set = required_admin_roles - requested_roles_set


print(f"Уникальные запрошенные роли: {requested_roles_set}")
print(f"Общие запрошенные роли: {required_intersection_roles_set}")
print(f"Недостающие административные роли: {missing_roles_set}")
print(f"Наличие роли security_officer в запросе {'security_officer' in requested_roles_set}")
