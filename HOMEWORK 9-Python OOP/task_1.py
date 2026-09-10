class Trainee:
    def __init__(self, name:str, surname:str, score:int=0, passing_grade:int=10):
        self.name:str = name
        self.surname:str = surname
        self.passing_grade:int = passing_grade
        self.__score:int = score

    @property
    def score(self):
        return self.__score

    @score.setter
    def score(self, new_score:int):
        if not isinstance(new_score, int):
            raise ValueError(f"Expected value of type int, got {type(new_score)}")
        if new_score < 0:
            raise ValueError("The score shouldn't be less than 0!")
        self.__score = new_score

    def do_homework(self) -> None:
        """Increases score by 1"""
        self.score += 1

    def miss_homework(self) -> None:
        """Decreases score by 1"""
        self.score -= 1

    def visit_lecture(self) -> None:
        """Increases score by 1"""
        self.score += 1

    def miss_lecture(self) -> None:
        """Decreases score by 1"""
        self.score -= 1

    def is_passing(self) -> bool:
        if self.score >= self.passing_grade:
            return True
        else:
            return False

if __name__ == "__main__":
    # 1. Создание стажера с начальным баллом 9 и проходным баллом 10
    trainee = Trainee(name="Иван", surname="Иванов", score=9, passing_grade=10)
    # 2. Выполнение домашнего задания и проверка статуса
    trainee.do_homework()
    print(f"Баллы: {trainee.score}, Прошел курс:{trainee.is_passing()}")
    # 3. Пропуск лекции и проверка статуса
    trainee.miss_lecture()
    print(f"Баллы: {trainee.score}, Прошел курс: {trainee.is_passing()}")
    # 4. Проверка валидации (попытка задать неверный тип или отрицательное значение)
    try:
        trainee.score = -5
    except ValueError as e:
        print(f"Ошибка: {e}")
