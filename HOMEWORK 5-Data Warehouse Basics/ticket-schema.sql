create schema if not exists ticket;

--измерение - дата проведения
create table ticket.dim_date (
    date_key integer primary key,
    full_date DATE not null,
    year SMALLINT not null,
    month SMALLINT not null,
    month_name VARCHAR(20) not null,
    day_of_month SMALLINT not null,
    day_of_week SMALLINT not null, 
    is_weekend BOOLEAN not null,
    hour SMALLINT not null,
    minute SMALLINT not null
)

--измерение - площадка
create table ticket.dim_venue (
    venue_key SERIAL primary key,
    venue_id INTEGER not null, -- id из исходника
    name VARCHAR(200) not null,
    address VARCHAR(300),
    city VARCHAR(100),
    country VARCHAR(100),
    capacity INTEGER,
    venue_type VARCHAR(50) 
)

--измерение - мероприятия 
create table ticket.dim_event (
    event_key SERIAL primary key,
    event_id INTEGER not null, -- id из исходника
    venue_key INTEGER not null REFERENCES ticket.dim_venue(venue_key),
    event_name VARCHAR(300) not null,
    event_type VARCHAR(50),
    genre VARCHAR(50),
    description TEXT,
    event_start_datetime TIMESTAMP not null,
    event_end_datetime TIMESTAMP,
    organizer VARCHAR(200),
    is_cancelled BOOLEAN not null DEFAULT FALSE,
    -- для контроля начала-окончания мероприятие SCD-2
    valid_from TIMESTAMP not null DEFAULT NOW(),
    valid_to TIMESTAMP,
    is_current BOOLEAN not null DEFAULT TRUE
);

--измерение - покупатели
create table ticket.dim_customer (
    customer_key SERIAL primary key,
    customer_id INTEGER not null, 
    email VARCHAR(64), 
    phone VARCHAR(64),
    registration_date DATE,
    age_group VARCHAR(20),
    gender CHAR(1) 
);

--измерение - способы оплаты
create table ticket.dim_payment (
    payment_key SERIAL primary key,
    payment_method VARCHAR(50) not null, 
    payment_provider VARCHAR(50),
    payment_status VARCHAR(30) not null, 
    currency CHAR(3) DEFAULT 'BYN'
);

--измерение - промоакции
create table ticket.dim_promo (
    promo_key SERIAL primary key,
    promo_code VARCHAR(50) not null,
    discount_type VARCHAR(20) not null,
    discount_value NUMERIC(10,2) not null,
    promo_start_date DATE,
    promo_end_date DATE
);

--измерение - места на площадках
create table ticket.dim_seat (
    seat_key SERIAL primary key,
    seat_id VARCHAR(50) not null, -- из системы площадки (кинозал/место в зале/итд)
    sector VARCHAR(50),
    row_number VARCHAR(10),
    seat_number VARCHAR(10),
    zone VARCHAR(50), 
    price_category VARCHAR(30)  
);

--факт - продажа билета
create table ticket.fact_sales (
    sale_id BIGSERIAL primary key,
--связи
    event_key INTEGER not null REFERENCES ticket.dim_event(event_key),
    customer_key INTEGER not null REFERENCES ticket.dim_customer(customer_key),
    venue_key INTEGER not null REFERENCES ticket.dim_venue(venue_key),
    payment_key INTEGER not null REFERENCES ticket.dim_payment(payment_key),
    promo_key INTEGER REFERENCES ticket.dim_promo(promo_key), 
    seat_key INTEGER REFERENCES ticket.dim_seat(seat_key),   
    date_key INTEGER not null REFERENCES ticket.dim_date(date_key),
--при формировании факта продажи 
    purchase_order_id VARCHAR(50) not null, 
    ticket_quantity SMALLINT not null DEFAULT 1, 
    source_channel VARCHAR(50) not null, 
-- часть ценообразования
    base_price NUMERIC(12,2) not null, 
    applied_discount NUMERIC(12,2) DEFAULT 0, 
    total_price NUMERIC(12,2) not null,
    tax_amount NUMERIC(12,2) DEFAULT 0,
    commission_fee NUMERIC(12,2) DEFAULT 0, 
--для возвратов
    is_refunded BOOLEAN not null DEFAULT FALSE,
    refund_date_key INTEGER REFERENCES ticket.dim_date(date_key),
    original_sale_id BIGINT 
);
