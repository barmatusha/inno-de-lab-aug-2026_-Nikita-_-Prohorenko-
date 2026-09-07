import CONSTANT

def calculate_overdue_fine(film_title: str, days_overdue, fine_rate: float):
    '''
    Функция расчета штрафа и технического индекса оборачиваемости.

    Args:
        film_title: str - Название фильма .
        days_overdue: Any - Необработанные данные о кол-ве дней.
        fine_rate: float - Ставка штрафа за один день просрочки.

    Returns:
        tuple (total_fine, return_index) в случае успеха, иначе None.

    Обрабатываемые ошибки:
        - TypeError: если `days_overdue` не может быть преобразован в float.
        - ValueError: если строка не является числом.
        - ZeroDivisionError: если `days_overdue` равен нулю после преобразования.
    '''
    try:
        numeric_days = float(days_overdue)

        total_fine = numeric_days * fine_rate

        return_index = CONSTANT.DEFAULT_RETURN_INDEX_BASE / numeric_days

        result = (total_fine, return_index)

    except TypeError as e:
        print(
            f"[ОШИБКА ТИПА] Некорректный тип данных для '{film_title}': {e}"
        )
        result = None

    except ValueError as e:
        print(
            f"[ОШИБКА ЗНАЧЕНИЯ] Невозможно преобразовать дни в число для "
            f"'{film_title}': {e}"
        )
        result = None

    except ZeroDivisionError as e:
        print(
            f"[ОШИБКА ДЕЛЕНИЯ НА НОЛЬ] Возврат без просрочки для "
            f"'{film_title}': {e}"
        )
        result = None

    finally:
        print("--- Проверка транзакции возврата завершена ---")

    return result


print("=== ПРОВЕРКА ВОЗВРАТОВ ===")

tests = [
    ("Matrix", 5, 1.5),
    ("Inception", "пять", 2.0),
    ("Avatar", 0, 2.5),
    ("Interstellar", [3,], 3.0),
]

for title, days, rate in tests:
    res = calculate_overdue_fine(title, days, rate)
    if res is not None:
        total_fine, index = res
        print(f"Фильм: '{title}' | Итоговый штраф: {total_fine}$ | Индекс: {index}")