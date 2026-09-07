left_value = float(input("Введите первое число: "))

right_value = float(input("Введите второе число: "))

operation = input("Введите операцию над числами (+, -, *, /, %, **): ")

result = 0

if operation == "+":
    result = (left_value + right_value)

if operation == "-":
    result = (left_value - right_value)

if operation == "*":
    result = (left_value * right_value)

if operation == "/":
    result = (left_value / right_value)

if operation == "%":
    result = (left_value % right_value)

if operation == "**":
    result = (left_value ** right_value)

print(f"{left_value} {operation} {right_value} = {result}")