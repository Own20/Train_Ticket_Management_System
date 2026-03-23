# Train E-Ticketing Database System

## Brief Description
This is a relational database system designed to support an MRT (Mass Rapid Transit) e-ticketing platform. The system enables efficient ticket booking, passenger management, route pricing, and transaction processing in a scalable and structured way.<br>

This project was developed as part of a Database Technology course, with a focus on solving real-world transportation challenges—specifically replacing inefficient manual ticketing processes with a fully digital, data-driven solution.<br>

The system emphasizes:
- High-volume transaction handling
- Data consistency and integrity
- Scalable relational schema design
- Secure cloud-based deployment

## Objectives
- Replace manual passenger recording with an automated system
- Enable seamless e-ticket booking for MRT users
- Ensure efficient storage and retrieval of transactional data
- Design a normalized and scalable relational database

## Tech Stack
- Database: MySQL 8
- Cloud Platform: Vultr Managed Database
- Tools: SQL (DDL, DML), ERD Modeling
- Security: SSL Encryption, Password Encryption

## Technical Capabilities Demonstrated
1. Relational Database Design
- Designed a multi-entity relational schema with 7 core tables
- Implemented primary and foreign key constraints
- Ensured referential integrity across all relationships
2. Data Normalization
- Achieved Third Normal Form (3NF):
    - Eliminated redundant data
    - Removed transitive dependencies
    - Ensured all attributes depend only on primary keys
3. Query Engineering<br>
Implemented core SQL operations:
- CRUD Operations (SELECT, INSERT, UPDATE, DELETE)
- Aggregate functions:
    - MAX() for highest route price
    - MIN() for lowest route price
- Data filtering and transformation queries
4. Transactional Data Handling<br>
Designed ticketing system with:
- Transaction timestamps (DATE, DATETIME)
- Payment tracking
- Ticket lifecycle management (status-based)
5. Cloud Database Deployment
- Deployed using managed cloud database services
- Leveraged:
    - Automated backups
    - Failover systems
    - High availability architecture
6. Security Implementation
- Encrypted database at rest and in transit (SSL)
- Secured credentials and authentication
- Used managed infrastructure to reduce vulnerabilities

## Database Schema Overview
Core Entities
- Admins – System administrators
- Users – MRT passengers
- Stations – MRT station data
- Routes – Travel routes with pricing
- Payments – Payment methods
- TicketStatus – Ticket lifecycle states
- Tickets – Transactional ticket records

## Entity Relationships
A User can have multiple Tickets<br>
Each Ticket is linked to:
- One Route
- One Payment Method
- One Ticket Status
A Route connects two Stations (origin & destination)

## System Features
- E-ticket booking system
- Route-based pricing
- Multiple payment methods
- Ticket status tracking
- User and admin management

## Future Improvements
- Integration with mobile/web frontend
- Real-time ticket validation (QR-based)
- Predictive analytics for passenger demand
- Dynamic pricing based on peak hours
- API layer for microservices architecture