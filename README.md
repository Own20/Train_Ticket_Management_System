# Train E-Ticketing Database System

## 📌 Brief Description
This is a relational database system designed to support an MRT (Mass Rapid Transit) e-ticketing platform. The system enables efficient ticket booking, passenger management, route pricing, and transaction processing in a scalable and structured way.<br>

## 📖 Overview

With high passenger volume in MRT systems, manual ticketing processes create bottlenecks and inefficiencies. HaloKereta addresses this by implementing a structured database system that enables:
- ⚡ Fast and reliable ticket booking
- 👥 Efficient passenger data management
- 🕒 Real-time transaction recording
- 📊 Scalable and maintainable data architecture

The system is designed with a strong focus on data integrity, normalization, and performance, making it suitable for real-world transport systems.

## 🏗️ System Architecture
The system follows a relational database architecture deployed on a cloud-managed environment.

### Architecture Components:
1. Client Layer (UI - conceptual)<br>
Handles user interaction for ticket booking and management
2. Application Layer (future integration)<br>
Processes business logic such as ticket validation and pricing
3. Database Layer (Core System)<br>
MySQL-based relational database storing all transactional and master data
4. Cloud Infrastructure<br>
Hosted on managed database services with:
    - Automated backups
    - Failover mechanisms
    - SSL-secured connections

## 🗄️ Database Design
Core Tables:
- Admins – Administrative users
- Users – MRT passengers
- Stations – Station metadata
- Routes – Travel routes with origin, destination, and pricing
- Payments – Payment methods
- TicketStatus – Ticket lifecycle states
- Tickets – Transaction records

Key Relationships:
- One User → Many Tickets
- One Route → Many Tickets
- One Payment → Many Tickets
- One TicketStatus → Many Tickets
- One Route → Two Stations (Origin & Destination)

Normalization:<br>
Database is structured in Third Normal Form (3NF): no repeating groups, no partial dependencies, no transitive dependencies

Design Improvements (Recommended):
- Fix foreign key relationships
- Use precise data types
- Enforce constraints
- Add audit fields

## ✨ Database Design Highlights
- 🔐 Secure Transaction Design<br>
Sensitive user and transaction data are structured to support secure storage and encrypted access in a cloud environment.
- 🔗 Strong Referential Integrity<br>
All relationships between entities (Users, Tickets, Routes, Payments) are enforced using foreign keys to maintain data consistency.
- 🚉 Route & Station Modeling<br>
Efficient representation of routes using origin–destination relationships enables flexible and scalable trip management.
- 🎫 End-to-End Ticket Lifecycle<br>
Ticket system models the full journey from booking to completion using status tracking (e.g., active, used, cancelled).
- 📊 Transaction-Centric Architecture<br>
Designed to handle high-frequency ticket transactions with timestamped records for accurate tracking and auditing.
- ⚡ Performance-Oriented Design<br>
Indexes and normalized schema reduce redundancy and optimize query execution for large-scale usage.
- 🧩 Scalable Schema Design<br>
Structure supports expansion (e.g., new stations, routes, payment methods) without major redesign.
- 🔄 Normalization (3NF Compliance)<br>
Eliminates redundancy and ensures all attributes depend only on primary keys, improving maintainability.
- 🧱 Modular Entity Structure<br>
Database is logically separated into functional domains:
    - User Management
    - Ticketing System
    - Route & Station Management
    - Payment Processing
- 📈 Analytics-Ready Data Model<br>
Schema supports future analytical use cases such as:
    - Passenger flow analysis
    - Revenue tracking
    - Peak-hour demand insights

## ⚡ Performance Optimisation
Query Optimization
- Reduced unnecessary joins by proper normalization
- Used aggregate functions efficiently (MAX, MIN)
- Structured queries for faster filtering and retrieval

Scalability Considerations
- Designed for high transaction throughput
- Cloud deployment ensures horizontal scalability
- Separation of transactional and master data improves performance

## 💻 Example SQL Capabilities Demonstrated
- CRUD Operations
- Aggregation
- Relational Queries (Extended Capability)

## 🧰 Tech Stack
| Technology | Purpose |
|----------------|------------------------------------------|
| 🐬 MySQL 8 | Relational database management |
| ☁️ Vultr Managed Database | Cloud hosting |
| 💻 SQL (DDL & DML) | Database operations |
| 📐 Draw.io | Database design |

## 🎓  Learning Outcomes Demonstrated
1. Database Engineering
    - Designing normalized relational schemas (3NF)
    - Implementing primary and foreign key constraints
2. Data Management
    - Handling transactional data with timestamps
    - Structuring scalable and maintainable datasets
3. SQL Proficiency
    - Writing optimized queries (CRUD + aggregation + joins)
    - Applying indexing and performance tuning
4. System Design Thinking
    - Translating real-world problems into database solutions
    - Designing systems for scalability and efficiency
5. Cloud & Security Awareness
    - Understanding managed database infrastructure
    - Applying encryption and secure access practices

## 📁 Project Structure
```
/data
    sample_data.sql

/database-schema
    schema.sql

/docs
    database_report.docx
    ERD.png

/queries
    sample_query.sql
```

## 🚀 Future Improvements
- 🌐 Develop REST API layer for system integration
- 📱 Build web/mobile frontend for real user interaction
- 🎫 Implement real-time ticket validation (QR code)
- 📊 Add predictive analytics for demand forecasting
- 💰 Introduce dynamic pricing models
- 🔐 Enhance security with hashed credentials and role-based access control

## 👨‍💻 Author
- Christopher Owen
- Christopher Alexander Tjiandra
- Arvin Yuwono

Computer Science Student | Aspiring Data & Software Engineer