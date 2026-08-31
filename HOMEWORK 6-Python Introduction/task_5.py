from random import randint

rand_value = randint(1, 20)
attempts = 5

print("Я загадал число от 1 до 20. У тебя 5 попыток!")

while attempts > 0:
    user_value = int(input(f"Осталось попыток {attempts}. Введите число "))
    if user_value == rand_value:
        print("Ты угадал! Отличная работа")
        break
    else:
        attempts -= 1
        if user_value > rand_value:
            print("Слишком много!")
        else:
            print("Слишком мало")