-- ====================================================================================
-- PHYSICAL DATABASE DESIGN
-- Description: DDL script to build the back-end schema for the Train Database Ticketing System.
-- ====================================================================================
USE traindb;



-- Delete existing tables to allow for clean re-runs
DROP TABLE IF EXISTS Admins;
DROP TABLE IF EXISTS Users;
DROP TABLE IF EXISTS Stations;
DROP TABLE IF EXISTS Routes;
DROP TABLE IF EXISTS Payments;
DROP TABLE IF EXISTS TicketStatus;
DROP TABLE IF EXISTS Tickets;



-- Create commands for specific tables containing specific columns
-- ------------------------------------------------------------------------------------
-- 1. ACCOUNT MANAGEMENT TABLES
-- ------------------------------------------------------------------------------------

-- Admins: Stores administrator account information
CREATE TABLE Admins (
    AdminID INT NOT NULL AUTO_INCREMENT,
    FullName VARCHAR(55) NOT NULL,
    Sex CHAR(1),
    Email VARCHAR(55) NOT NULL UNIQUE,
    Password VARCHAR(255) NOT NULL,
    MobileNumber VARCHAR(15),
    Age INT,
    CONSTRAINT PK_admin_id PRIMARY KEY (AdminID)
);

-- Users: Stores passenger/customer account data
CREATE TABLE Users (
    UserID INT NOT NULL AUTO_INCREMENT,
    FullName VARCHAR(55) NOT NULL,
    Sex CHAR(1),
    Email VARCHAR(55) NOT NULL UNIQUE,
    Pin VARCHAR(6),
    MobileNumber VARCHAR(15),
    Age INT,
    CONSTRAINT PK_user_id PRIMARY KEY (UserID)
);



-- ------------------------------------------------------------------------------------
-- 2. ROUTE MANAGEMENT TABLES
-- ------------------------------------------------------------------------------------

-- Stations: Stores all train/bus stations
CREATE TABLE Stations (
    StationID INT NOT NULL AUTO_INCREMENT,
    StationName VARCHAR(25) NOT NULL,
    CONSTRAINT PK_station_id PRIMARY KEY (StationID)
);

-- Routes: Defines travel routes between stations
CREATE TABLE Routes (
    RouteID INT NOT NULL AUTO_INCREMENT,
    StationOriginID INT,
    StationDestinationID INT,
    RoutePrice INT NOT NULL,
    CONSTRAINT PK_route_id PRIMARY KEY (RouteID)
);
ALTER TABLE Routes
ADD CONSTRAINT fk_route_stationoriginid FOREIGN KEY (StationOriginID) 
REFERENCES Stations (StationID);
ALTER TABLE Routes
ADD CONSTRAINT fk_route_stationdestinationid FOREIGN KEY (StationDestinationID) 
REFERENCES Stations (StationID);



-- ------------------------------------------------------------------------------------
-- 3. TRANSACTION TABLES
-- ------------------------------------------------------------------------------------

-- Payments: Stores available payment methods
CREATE TABLE Payments (
    PaymentID INT NOT NULL AUTO_INCREMENT,
    PaymentType VARCHAR(20),
    CONSTRAINT PK_payment_id PRIMARY KEY (PaymentID)
);

-- TicketStatus: Stores ticket status definitions
CREATE TABLE TicketStatus (
    TicketStatusID INT NOT NULL AUTO_INCREMENT,
    TicketStatusDefinition VARCHAR(20),
    CONSTRAINT PK_ticketstatus_id PRIMARY KEY (TicketStatusID)
);

-- Tickets: Stores ticket purchase transactions
CREATE TABLE Tickets (
    TicketID INT NOT NULL AUTO_INCREMENT,
    StatusID INT,
    UserID INT,
    PaymentID INT,
    RouteID INT,
    TransactionDate DATE,
    TransactionDatetime DATETIME,
    CONSTRAINT PK_ticket_id PRIMARY KEY (TicketID)
);
ALTER TABLE Tickets
ADD CONSTRAINT fk_tickets_statusid FOREIGN KEY (StatusID)
REFERENCES TicketStatus (TicketStatusID);
ALTER TABLE Tickets
ADD CONSTRAINT fk_tickets_userid FOREIGN KEY (UserID) 
REFERENCES Users (UserID);
ALTER TABLE Tickets
ADD CONSTRAINT fk_tickets_paymentid FOREIGN KEY (PaymentID) 
REFERENCES Payments (PaymentID);
ALTER TABLE Tickets
ADD CONSTRAINT fk_tickets_routeid FOREIGN KEY (RouteID) 
REFERENCES Routes (RouteID);
