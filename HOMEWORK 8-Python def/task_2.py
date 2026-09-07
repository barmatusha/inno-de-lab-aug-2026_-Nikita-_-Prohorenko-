import time
from typing import Callable, Any

import CONSTANT

def performance_logger(func):
    '''
    Декоратор для вычисления времени работы и вывода лога.

    Args:
        func: оборачиваемая целевая функция.

    Returns:
        Обёрнутая функция, которая логирует время выполнения и возвращает
        результат оригинальной функции.
    '''
    def wrapper(*args, **kwargs):
        start_time = time.perf_counter()

        result = func(*args, **kwargs)

        elapsed = time.perf_counter() - start_time

        log_message = (
            f"{CONSTANT.PERFORMANCE_LOG_PREFIX} Функция '{func.__name__}' "
            f"выполнена за {elapsed:.{CONSTANT.TIME_DECIMALS}f} сек."
        )
        print(log_message)

        return result

    return wrapper


@performance_logger
def get_sorted_report(data: list):
    """
    Принимает список словарей, сортирует по убыванию ключа total_sales

    Args:
        data: Список словарей c ключами 'category' (str) и
              'total_sales' (float).

    Returns:
        Отсортированный по total_sales список словарей.
    """
    return sorted(data, key=lambda item: item['total_sales'], reverse=True)


    # Тестовые наборы данных
test_sets = [
    [
        {"category": "Action", "total_sales": 4311.85},
        {"category": "Animation", "total_sales": 4656.30},
        {"category": "Children", "total_sales": 3655.55}
    ],
    [
        {"category": "Classics", "total_sales": 1200.10},
        {"category": "Comedy", "total_sales": 4000.00},
        {"category": "Documentary", "total_sales": 4000.00}
    ],
    [
        {"category": "Drama", "total_sales": 500.00}
    ]
]

print("=== ТЕСТИРОВАНИЕ ПРОИЗВОДИТЕЛЬНОСТИ ===")
for idx, test_data in enumerate(test_sets, start=1):
    print(f"--- ТЕСТ {idx} ---")
    sorted_data = get_sorted_report(test_data)
    print("Топ категорий по выручке:")
    for rank, item in enumerate(sorted_data, start=1):
        print(f"{rank}. {item['category']}: {item['total_sales']}")
