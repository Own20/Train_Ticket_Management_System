-- ====================================================================================
-- SQL Queries
-- Description: DDL script to retrieve and manipulate data for intended report
-- ====================================================================================
USE traindb;



-- Simple queries
SELECT * FROM admins;
SELECT * FROM users;
SELECT * FROM routes;
SELECT * FROM stations;
SELECT * FROM tickets;
SELECT * FROM payments;
SELECT * FROM ticketstatus;

SELECT full_name, email FROM users;

UPDATE routes
SET RoutePrice = 9000 
WHERE RouteID = 1;

INSERT INTO payments(PaymentType) VALUES ('OVO');

DELETE FROM users WHERE MobileNumber='089844357639';

SELECT MAX(RoutePrice) AS HighestPrice FROM routes;

SELECT MIN(RoutePrice) AS SmallestPrice FROM routes;



-- Complex queries with JOINs, aggregations, and window functions
-- ------------------------------------------------------------------------------------
-- ALL TICKET TRANSACTION DETAILS, SORT BY TRANSACTION TIME
-- ------------------------------------------------------------------------------------
SELECT 
    t.TicketID,
    u.FullName AS CustomerName,
    s1.StationName AS Origin,
    s2.StationName AS Destination,
    r.RoutePrice,
    p.PaymentType,
    ts.TicketStatusDefinition,
    t.TransactionDatetime
FROM Tickets t
JOIN Users u ON t.UserID = u.UserID
JOIN Routes r ON t.RouteID = r.RouteID
JOIN Stations s1 ON r.StationOriginID = s1.StationID
JOIN Stations s2 ON r.StationDestinationID = s2.StationID
JOIN Payments p ON t.PaymentID = p.PaymentID
JOIN TicketStatus ts ON t.StatusID = ts.TicketStatusID
ORDER BY t.TransactionDatetime DESC;

-- ------------------------------------------------------------------------------------
-- TOTAL TICKET REVENUE PER ROUTE
-- ------------------------------------------------------------------------------------
SELECT 
    r.RouteID,
    s1.StationName AS Origin,
    s2.StationName AS Destination,
    COUNT(t.TicketID) AS TotalTickets,
    SUM(r.RoutePrice) AS TotalRevenue
FROM Routes r
LEFT JOIN Tickets t ON r.RouteID = t.RouteID
JOIN Stations s1 ON r.StationOriginID = s1.StationID
JOIN Stations s2 ON r.StationDestinationID = s2.StationID
GROUP BY r.RouteID, s1.StationName, s2.StationName
ORDER BY TotalRevenue DESC;

-- ------------------------------------------------------------------------------------
-- TOP 3 CUSTOMERS BY TOTAL SPENDING
-- ------------------------------------------------------------------------------------
SELECT 
    u.UserID,
    u.FullName,
    SUM(r.RoutePrice) AS TotalSpending
FROM Users u
JOIN Tickets t ON u.UserID = t.UserID
JOIN Routes r ON t.RouteID = r.RouteID
WHERE t.StatusID = 2 -- Only 'Paid'
GROUP BY u.UserID, u.FullName
ORDER BY TotalSpending DESC
LIMIT 3;

-- ------------------------------------------------------------------------------------
-- MOST POPULAR ORIGIN STATION BY DEPARTURES
-- ------------------------------------------------------------------------------------
SELECT 
    s.StationName,
    COUNT(t.TicketID) AS TotalDepartures
FROM Stations s
JOIN Routes r ON s.StationID = r.StationOriginID
JOIN Tickets t ON r.RouteID = t.RouteID
GROUP BY s.StationName
ORDER BY TotalDepartures DESC
LIMIT 1;

-- ------------------------------------------------------------------------------------
-- TOTAL MONTHLY REVENUE WITH YEAR
-- ------------------------------------------------------------------------------------
SELECT 
    DATE_FORMAT(t.TransactionDate, '%Y-%m') AS Month,
    COUNT(t.TicketID) AS TicketsSold,
    SUM(r.RoutePrice) AS Revenue
FROM Tickets t
JOIN Routes r ON t.RouteID = r.RouteID
WHERE t.StatusID = 2
GROUP BY Month
ORDER BY Month;

-- ------------------------------------------------------------------------------------
-- CUSTOMERS WITH NO PURCHASED TICKETS
-- ------------------------------------------------------------------------------------
SELECT 
    u.UserID,
    u.FullName
FROM Users u
LEFT JOIN Tickets t ON u.UserID = t.UserID
WHERE t.TicketID IS NULL;

-- ------------------------------------------------------------------------------------
-- TOP CUSTOMERS BY SPENDING
-- ------------------------------------------------------------------------------------
SELECT 
    u.UserID,
    u.FullName,
    SUM(r.RoutePrice) AS TotalSpending,
    RANK() OVER (ORDER BY SUM(r.RoutePrice) DESC) AS SpendingRank
FROM Users u
JOIN Tickets t ON u.UserID = t.UserID
JOIN Routes r ON t.RouteID = r.RouteID
WHERE t.StatusID = 2
GROUP BY u.UserID, u.FullName;

-- ------------------------------------------------------------------------------------
-- MOST ROUTE REVENUE CONTRIBUTION (%)
-- ------------------------------------------------------------------------------------
SELECT 
    r.RouteID,
    COUNT(t.TicketID) AS TicketsSold,
    SUM(r.RoutePrice) AS RouteRevenue,
    ROUND(
        SUM(r.RoutePrice) * 100.0 / 
        (SELECT SUM(r2.RoutePrice)
         FROM Tickets t2
         JOIN Routes r2 ON t2.RouteID = r2.RouteID
         WHERE t2.StatusID = 2),
    2) AS RevenuePercentage
FROM Tickets t
JOIN Routes r ON t.RouteID = r.RouteID
WHERE t.StatusID = 2
GROUP BY r.RouteID;

-- ------------------------------------------------------------------------------------
-- DAILY TICKET SALES WITH RUNNING TOTAL
-- ------------------------------------------------------------------------------------
SELECT 
    TransactionDate,
    COUNT(TicketID) AS DailySales,
    SUM(COUNT(TicketID)) OVER (ORDER BY TransactionDate) AS RunningTotal
FROM Tickets
GROUP BY TransactionDate
ORDER BY TransactionDate;

-- ------------------------------------------------------------------------------------
-- MOST USED PAYMENT METHOD
-- ------------------------------------------------------------------------------------
SELECT 
    p.PaymentType,
    COUNT(t.TicketID) AS UsageCount
FROM Payments p
JOIN Tickets t ON p.PaymentID = t.PaymentID
GROUP BY p.PaymentType
ORDER BY UsageCount DESC;
