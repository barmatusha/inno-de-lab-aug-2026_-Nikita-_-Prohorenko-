# Конфигурационный словарь, полученный от сервиса инициализации
db_config = {
    "connection": {
        "host": "production-db.internal",
        "port": 5432,
        "user": "postgres"
    }
}

db_connection = db_config.get("connection")

db_host = db_config.get("host")

db_port = db_config.get("port")

db_ssl_settings = db_config.get("ssl_settings", "verify-full")

db_connection["user"] = "admin"

db_connection["max_connections"] = 100

db_config["connection"] = db_connection

print(f"SSL mode: {db_ssl_settings}")
print(f"Параметры соединения:")
for k, v in db_connection.items():
    print(f"* {k}: {v}")
