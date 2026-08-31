left_value = float(input("Введите первое число: "))

right_value = float(input("Введите второе число: "))

operation = input("Введите операцию над числами (+, -, *, /, %, **): ")

concat_str = str(f"{left_value} {operation} {right_value}")

ex_result = eval(concat_str)

print(f"{concat_str} = {ex_result}")