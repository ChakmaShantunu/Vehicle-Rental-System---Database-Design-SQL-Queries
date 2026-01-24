Vehicle Rental System - Database Design & SQL Queries
📌 Overview

This project represents a simplified Vehicle Rental System designed to demonstrate core concepts of database design, ERD relationships, and SQL querying. The system manages users, vehicles, and bookings while maintaining real-world business rules.

The assignment focuses on understanding:

-- Entity Relationship Diagrams (ERD)

-- Primary Keys and Foreign Keys

-- SQL queries using JOIN, EXISTS, WHERE, GROUP BY, and HAVING

🎯 Objectives

-- By completing this assignment, the following learning outcomes are achieved:

-- Design an ERD with One-to-One, One-to-Many, and Many-to-One relationships

-- Understand and apply Primary Keys (PK) and Foreign Keys (FK)

-- Write SQL queries using INNER JOIN, NOT EXISTS, WHERE, GROUP BY, and HAVING

🧩 Database Design & Business Logic

The system manages three core entities:

1️⃣ Users

Stores system users who can be Admins or Customers.

Attributes:

-- user_id (Primary Key)

-- role (Admin / Customer)

-- name

-- email (unique)

-- password

-- phone_number

Rules:

-- Each user must have a unique email address

2️⃣ Vehicles

-- Stores all rentable vehicles.

Attributes:

-- vehicle_id (Primary Key)

-- vehicle_name

-- type (car / bike / truck)

#model

-- registration_number (unique)

-- price_per_day

-- availability_status (available / rented / maintenance)

3️⃣ Bookings

-- Stores booking records made by users.

#Attributes:

-- booking_id (Primary Key)

-- booking_user_id (Foreign Key → Users)

-- booking_vehicle_id (Foreign Key → Vehicles)

-- start_date

-- end_date

-- booking_status (pending / confirmed / completed / cancelled)

#total_cost

🔗 Relationship Design (ERD)

-- The ERD includes the following relationships:

-- One-to-Many: One User → Many Bookings

-- Many-to-One: Many Bookings → One Vehicle

-- Logical One-to-One: Each booking is linked to exactly one user and one vehicle

#The ERD clearly shows:

-- Primary Keys (PK)

-- Foreign Keys (FK)

-- Relationship cardinality

-- Status fields for business logic

📎 ERD Tool Used: Lucidchart

🧪 Part 2: SQL Queries
#Query 1: JOIN

-- Goal: Retrieve booking information along with customer name and vehicle name.

-- Concepts Used: INNER JOIN

#Query 2: EXISTS

-- Goal: Find all vehicles that have never been booked.

-- Concepts Used: NOT EXISTS

#Query 3: WHERE

-- Goal: Retrieve all available vehicles of a specific type (e.g. cars).

-- Concepts Used: SELECT, WHERE

#Query 4: GROUP BY and HAVING

-- Goal: Find the total number of bookings for each vehicle and display only those vehicles that have more than 2 bookings.

-- Concepts Used: GROUP BY, HAVING, COUNT

---
📌 **Author:** Shantunu Chakma  
📅 **Assignment Type:** Vehicle Rental -- Database Design & SQL Queries

