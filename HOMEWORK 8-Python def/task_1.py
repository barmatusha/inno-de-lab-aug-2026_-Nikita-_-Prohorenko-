import CONSTANT

def calculate_rental_batch (quantity: int, rental_rate: float, discount=0.0):
    '''
    Функция расчета стоимости партии диском с учетом жанровой скидки

    Args:
        quantity: int - Количество дисков в партии
        rental_rate: float - Цена за шт.
        discount: float - Жанровая скидки (0.x , где х - процент скидки), без указания = 0.0

    Returns:
        tuple: (final_sum, is_limit_exceeded)
        final_sum - итоговая сумма (quantity * rental_rate * (1 - discount))
        is_limit_exceeded: bool - указывает на то, превышает ли final_sum значение
            константы MAX_RENTAL_BATCH_LIMIT

    '''
    final_sum = round(quantity * rental_rate * (1 - discount), 2)
    if final_sum > CONSTANT.MAX_RENTAL_BATCH_LIMIT:
        is_limit_exceeded = True
    else:
        is_limit_exceeded = False
    return final_sum, is_limit_exceeded


print("=== ОТЧЕТ ПО ПАРТИЯМ АРЕНДЫ ===")

AD_rental_batch = calculate_rental_batch(30, 2.99)
AF_rental_batch = calculate_rental_batch(40, 4.99, discount=0.1)

print(f"ACADEMY DINOSAUR: Сумма: {AD_rental_batch[0]}$. Превышение лимита: {AD_rental_batch[1]}")
print(f"AFFRAIR PREJUDICE: Сумма: {AF_rental_batch[0]}$. Превышение лимита: {AF_rental_batch[1]}")