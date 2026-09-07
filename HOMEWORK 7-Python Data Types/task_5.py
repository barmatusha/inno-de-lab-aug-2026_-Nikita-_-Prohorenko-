# Поток данных телеметрии от серверов кластера
system_telemetry = [
    ("srv_01", 12.5, 64, "online"),
    ("srv_02", 85.0, 92, "online"),
    ("srv_03", 0.0, 0, "offline"),
    ("srv_04", 45.2, 78, "online"),
    ("srv_05", 95.1, 99, "online")
]
node_names = []
cpu_loads = []
ram_usages = []
for node_name, cpu_load, ram_usage, status in system_telemetry:
    if status == "online":
        node_names.append(node_name)
        cpu_loads.append(cpu_load)
        ram_usages.append(ram_usage)

print(f"Активные узлы в сети: {node_names}")
active_nodes_count = len(node_names)
average_cpu_loads = round(sum(cpu_loads) / len(cpu_loads), 2)
max_ram_usage = max(ram_usages)

telemetry_report = {
    'active_nodes_count': active_nodes_count,
    'metrics': {
        'average_cpu': average_cpu_loads,
        'max_ram': max_ram_usage,
    }
}
print(f"Итоговый отчет о телеметрии: ")
for k, v in telemetry_report.items():
    print(f"{k}: {v}")

