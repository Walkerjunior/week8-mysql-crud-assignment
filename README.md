# 📘 Week 8 Assignment: MySQL + CRUD API

This repository contains two main parts:

---

## ✅ Question 1: Library Management System (MySQL)

A fully relational database for managing a library's operations, including:

- **Authors**
- **Books**
- **Categories**
- **Members**
- **Borrow Records**

### Features:
- Primary keys, foreign keys, unique and not-null constraints
- 1-to-Many and Many-to-Many relationships
- Sample data included

### Files:
- `library.sql` – contains all `CREATE TABLE` statements and sample inserts
- `erd_library.png` – Entity-Relationship Diagram for the schema

---

## ✅ Question 2: Contact Book API (FastAPI + MySQL)

A simple backend API that lets you manage contacts using FastAPI and a MySQL database.

### Features:
- Create, Read, Update, Delete contacts
- Each contact has a `name` and a unique `email`
- API built using FastAPI
- Connected to MySQL with SQLAlchemy

### Files:
- `contact-api/schema.sql` – MySQL schema for the `contacts` table
- `contact-api/requirements.txt` – dependencies
- `contact-api/app/` – contains main API and database config

---

## 🛠️ Setup Instructions

### 📦 Clone and Set Up

```bash
git clone https://github.com/Walkerjunior/week8-mysql-crud-assignment.git
cd week8-mysql-crud-assignment

📌 Question 1 (Library SQL)
To import into MySQL:

bash
Copy
Edit
mysql -u root -p < library.sql
🚀 Question 2 (FastAPI)
Navigate to the API directory:

bash
Copy
Edit
cd contact-api
Create database in MySQL:

sql
Copy
Edit
CREATE DATABASE contacts_db;
USE contacts_db;
SOURCE schema.sql;
Install dependencies:

bash
Copy
Edit
pip install -r requirements.txt
Run the server:

bash
Copy
Edit
uvicorn app.main:app --reload
Open in browser: http://127.0.0.1:8000/docs

📷 ERD Screenshot

🔗 Author
Prepared by: Walkerjunior
GitHub: https://github.com/Walkerjunior

yaml
Copy
Edit

