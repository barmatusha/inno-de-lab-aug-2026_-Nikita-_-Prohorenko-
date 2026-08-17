**Part 1: Выбор Сценария **

Для данной работы выбран сценарий: Продажа билетов на мероприятия. Этот сценарий будет управлять площадками, мероприятиями, посетителями и купленными билетами.


**Part 2: Проектирование Базы Данных и Документация**

Идентификация Сущностей и Атрибутов: 

- Площадки (Venue): 

- Мероприятия (Events): 

- Посетители (Customers): 

- Купленный билет (Tickets): (Для отслеживания, купленных билетов)


Проектирование Таблиц: 

1. Table Name: Venues 

○ Description: Хранит информацию о площадках. 

○ Attributes: 

- VenueID: INTEGER, PK, NOT NULL, UNIQUE 

- Name: VARCHAR(100), NOT NULL 

- Address: VARCHAR(500), NOT NULL, UNIQUE

○ Constraints: 

PK\_Venues: PRIMARY KEY (AuthorID) 

2. Table Name: Events 

○ Description: Содержит информацию о мероприятиях. 

○ Attributes: 

- EventID: INTEGER, PK, NOT NULL, UNIQUE 

- Title: VARCHAR(150), NOT NULL 

- DateOfTheЕvent: TIMESTAMPTZ 

- VenueID: INTEGER, FK (REFERENCES Venues), NOT NULL 

○ Constraints: 

- PK\_Venue: PRIMARY KEY (VenueID) 

- CHK\_Date: CHECK (DateOfTheЕvent \>= CURRENT\_TIMESTAMP) 

- FK\_Events\_Venues: FOREIGN KEY (EventID) REFERENCES 

Venues(VenueID) 


3. Table Name: Visitors 

○ Description: Хранит данные о посетителях мероприятий. 

○ Attributes: 

- VisitorID: INTEGER, PK, NOT NULL, UNIQUE 

- FirstName: VARCHAR(100), NOT NULL 

- LastName: VARCHAR(100), NOT NULL 

- Email: VARCHAR(255), UNIQUE 

○ Constraints: 

- PK\_Visitors: PRIMARY KEY (VisitorID) 

- UQ\_Email: UNIQUE (Email) 

4. Table Name: Tickets

○ Description: Таблица для реализации связи многие-ко-многим.  Записывает информацию о билетах посетителей. 

○ Attributes: 

- TicketID: INTEGER, PK, NOT NULL, UNIQUE 

- EventID: INTEGER, FK (REFERENCES Books), NOT NULL 

- VisitorID: INTEGER, FK (REFERENCES Readers), NOT NULL 

○ Constraints: 

- PK\_Tickets: PRIMARY KEY (TicketID) 

- FK\_Tickets\_Events: FOREIGN KEY (EventID) REFERENCES Events(EventID) 

- FK\_Tickets\_Visitors: FOREIGN KEY (VisitorID) REFERENCES Visitors(VisitorID) 

Взаимосвязи: 

Venue и Events (Один-ко-Многим): На одной площадке может проводиться много мероприятий, но каждое мероприятие в упрощенном (с привязкой к площадке) варианте проводится на одной площадке. 

○ Events.VenutID является внешним ключом, ссылающимся на 

Venues.VenueID. 

Events и Tickets (Один-ко-Многим): На одно мероприятие может быть куплено много билетов, но каждый один билет относится к одному конкретному мероприятию. 

○ Tickets.EventID является внешним ключом, ссылающимся на 

Events.EventID. 

Visitors и Tickets (Один-ко-Многим): Один посетитель может посетить множество мероприятий (много записей о билетах для конкретного посетителя), но каждая запись о таких билетах относится к одному посетителю. 

○ Tickets.VisitorID является внешним ключом, ссылающимся на 

Visitors.VisitorID.

Для построения ERD использовался ресурс с доступом: https://www.drawdb.app/