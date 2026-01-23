create table
    if not exists users (
        user_id serial primary key,
        user_role varchar(20) not null check (user_role in ('admin', 'customer')),
        user_name varchar(50) not null,
        email varchar(150) unique not null,
        password varchar(150) not null,
        phone_number varchar(20) not null
    );

create table
    if not exists vehicles (
        vehicle_id serial primary key,
        vehicle_name varchar(150) not null,
        type varchar(50) not null check (type in ('car', 'bike', 'truck')),
        model varchar(50) not null,
        registration_number varchar(150) unique not null,
        rental_price_per_day decimal(10, 2) not null,
        availability_status varchar(20) not null check (
            availability_status in ('available', 'rented', 'maintenance')
        )
    );

create table
    if not exists bookings (
        booking_id serial primary key,
        booking_user_id int not null references users (user_id),
        booking_vehicle_id int not null references vehicles (vehicle_id),
        start_date date not null,
        end_date date not null,
        booking_status varchar(20) not null check (
            booking_status in ('pending', 'confirmed', 'completed', 'cancelled')
        ),
        total_cost decimal(10, 2) not null
    );

insert into
    users (
        user_role,
        user_name,
        email,
        password,
        phone_number
    )
values
    (
        'customer',
        'Alice',
        'alice@example.com',
        'pass123',
        '1234567890'
    ),
    (
        'admin',
        'Bob',
        'bob@example.com',
        'Pass123',
        '0987654321'
    ),
    (
        'customer',
        'Charlie',
        'charlie@example.com',
        'password123',
        '1122334455'
    );

INSERT INTO
    vehicles (
        vehicle_name,
        type,
        model,
        registration_number,
        rental_price_per_day,
        availability_status
    )
VALUES
    (
        'Toyota Corolla',
        'car',
        '2022',
        'ABC-123',
        50,
        'available'
    ),
    (
        'Honda Civic',
        'car',
        '2021',
        'DEF-456',
        60,
        'rented'
    ),
    (
        'Yamaha R15',
        'bike',
        '2023',
        'GHI-789',
        30,
        'available'
    ),
    (
        'Ford F-150',
        'truck',
        '2020',
        'JKL-012',
        100,
        'maintenance'
    );

insert into
    bookings (
        booking_user_id,
        booking_vehicle_id,
        start_date,
        end_date,
        booking_status,
        total_cost
    )
values
    (
        1,
        2,
        '2023-10-01',
        '2023-10-05',
        'completed',
        240.00
    ),
    (
        1,
        2,
        '2023-11-01',
        '2023-11-03',
        'completed',
        120.00
    ),
    (
        3,
        2,
        '2023-12-01',
        '2023-12-02',
        'confirmed',
        60.00
    ),
    (
        1,
        1,
        '2023-12-10',
        '2023-12-12',
        'pending',
        100.00
    );

select
    b.booking_id,
    u.user_name as customer_name,
    v.vehicle_name,
    b.start_date,
    b.end_date,
    b.booking_status,
    b.total_cost
from
    bookings as b
    inner join users as u on b.booking_user_id = u.user_id
    inner join vehicles as v on b.booking_vehicle_id = v.vehicle_id;

select
    v.vehicle_id,
    v.vehicle_name
from
    vehicles as v
where
    not exists (
        select
            1
        from
            bookings as b
        where
            b.booking_vehicle_id = v.vehicle_id
    );

select
    *
from
    vehicles
where
    type = 'car'
    and availability_status = 'available';