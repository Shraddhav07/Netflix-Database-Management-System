# 🎬 Netflix Database Management System

A relational database project that models the core data management operations of a Netflix-like streaming platform using **Microsoft SQL Server**.

The project demonstrates database design, table creation, primary and foreign key relationships, SQL constraints, sample data insertion, and data retrieval using SQL queries.

---

## 📌 Project Overview

Streaming platforms manage large amounts of interconnected data, including users, subscription plans, movies, TV shows, payments, ratings, and viewing activity.

This project implements a relational database called `NetflixDB` to organize and manage these records efficiently while maintaining data integrity.

## 🎯 Project Objectives

- Design a relational database for a streaming platform.
- Create and manage interconnected database tables.
- Implement primary keys and foreign keys.
- Apply SQL constraints to maintain data integrity.
- Insert sample records into all database tables.
- Retrieve and analyze information using SQL queries.
- Practise SQL and relational database management concepts.

## 🛠️ Technologies Used

| Technology | Purpose |
|---|---|
| Microsoft SQL Server | Relational database management |
| SQL | Database operations and queries |
| SQL Server Management Studio (SSMS) | SQL development environment |
| Git & GitHub | Version control and project hosting |

## 🗂️ Database Structure

The project contains **10 relational tables**:

| Table Name | Description |
|---|---|
| Subscription_Plan | Stores subscription plan details |
| Users | Stores registered user information |
| Directors | Stores director information |
| Genres | Stores content categories |
| Actors | Stores actor information |
| Movies_TVShows | Stores movies and TV show details |
| Payments | Stores payment transactions |
| Watch_History | Maintains users' viewing records |
| Ratings | Stores user ratings and reviews |
| Movie_Cast | Connects actors with movies and TV shows |

## 🔗 Entity Relationships

The database implements the following relationships:

- One Subscription Plan → Many Users
- One Director → Many Movies/TV Shows
- One Genre → Many Movies/TV Shows
- One User → Many Payments
- One User → Many Watch History Records
- One User → Many Ratings
- One Movie/TV Show → Many Watch History Records
- One Movie/TV Show → Many Ratings
- Movies/TV Shows ↔ Actors through Movie_Cast

The `Movie_Cast` table implements the many-to-many relationship between movies and actors using a composite primary key.

## ⚙️ Database Constraints

The following SQL constraints are implemented:

- **PRIMARY KEY:** Uniquely identifies each record.
- **FOREIGN KEY:** Maintains relationships between tables.
- **NOT NULL:** Prevents missing values in mandatory columns.
- **UNIQUE:** Prevents duplicate values.
- **CHECK:** Restricts values according to specified conditions.
- **DEFAULT:** Automatically assigns predefined values.

## 📁 Project Structure

```text
Netflix-Database-Management-System/
│
├── SQL/
│   ├── 01_Create_Database.sql
│   ├── 02_Create_Tables.sql
│   ├── 03_Insert_Sample_Data.sql
│   ├── 04_Data_Retrieval_Queries.sql
│   └── 05_Constraint_Testing.sql
│
├── Documentation/
│   ├── ER_Diagram.png
│   └── Project_Report.pdf
│
├── Screenshots/
│   ├── Database_Creation.png
│   ├── Tables_Creation.png
│   ├── Sample_Data.png
│   ├── Constraint_Testing.png
│   └── Data_Retrieval.png
│
└── README.md
```

## 🚀 How to Run the Project

### Prerequisites

- Microsoft SQL Server
- SQL Server Management Studio (SSMS)

### Step 1: Clone the Repository

```bash
git clone https://github.com/YOUR-USERNAME/Netflix-Database-Management-System.git
```

### Step 2: Open the Project

Open SQL Server Management Studio and connect to your SQL Server instance.

### Step 3: Execute the SQL Scripts

Execute the scripts in the following order:

1. `01_Create_Database.sql` – Creates the NetflixDB database.
2. `02_Create_Tables.sql` – Creates all ten database tables and their relationships.
3. `03_Insert_Sample_Data.sql` – Inserts sample records.
4. `04_Data_Retrieval_Queries.sql` – Executes SQL queries to retrieve and analyze data.
5. `05_Constraint_Testing.sql` – Tests the implemented database constraints.

**Important:** Run the database creation and sample-data insertion scripts only when setting up a fresh database. Avoid repeatedly executing the insertion script on an already populated database.

## 🔍 SQL Concepts Demonstrated

- Database creation and selection
- Table creation
- Primary keys and foreign keys
- Composite primary keys
- SQL constraints
- INSERT and SELECT statements
- WHERE, BETWEEN, IN, and LIKE
- ORDER BY
- Aggregate functions
- GROUP BY and HAVING
- INNER JOIN and LEFT JOIN
- TOP clause
- Constraint validation and testing

## 📸 Project Screenshots

Screenshots demonstrating database creation, table structure, sample records, constraint testing, and query execution will be added here.

## 📚 Learning Outcomes

Through this project, I gained practical experience in:

- Designing relational database schemas.
- Understanding relationships between entities.
- Implementing referential integrity.
- Applying SQL constraints.
- Writing SQL queries for data retrieval.
- Organizing database scripts into a structured project.

## 🔮 Future Enhancements

Potential extensions include:

- User watchlist functionality.
- Subscription renewal management.
- Personalized content recommendations.
- Advanced viewing analytics.
- Stored procedures and database views.
- Additional database security and access control.

---

## 👩‍💻 Author

**Shradha Suresh Vishwakarma**

Second Year | Artificial Intelligence and Machine Learning

Database Management System Project

---

⭐ If you find this project useful, feel free to explore the SQL scripts and database design.