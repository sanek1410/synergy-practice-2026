CREATE DATABASE TourismWeb;
GO

USE TourismWeb;
GO

CREATE TABLE Tours (
    TourId INT IDENTITY(1, 1) PRIMARY KEY,
    TourName NVARCHAR(100),
    Country NVARCHAR(50),
    Price DECIMAL(10, 2)
);
GO

INSERT INTO Tours (TourName, Country, Price)
VALUES
    (N'Золотое кольцо', N'Россия', 42000),
    (N'Белые ночи', N'Россия', 48500),
    (N'Стамбул', N'Турция', 89000);
GO
