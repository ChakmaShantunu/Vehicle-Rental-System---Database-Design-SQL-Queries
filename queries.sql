create table
    if not exists users (
        user_id serial primary key,
        user_role varchar(20) not null check (user_role in ('admin', 'customer')),
        user_name varchar(50) not null,
        email varchar(150) unique not null,
        password varchar(150) not null,
        phone_number varchar(20) not null
    );