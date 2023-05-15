
USE master
GO
if exists (select * from sysdatabases where name='FLIGHTS')
	DROP DATABASE FLIGHTS
GO

CREATE DATABASE FLIGHTS
GO
USE FLIGHTS
GO

CREATE TABLE Airline (
	code CHAR(2) PRIMARY KEY,
	name VARCHAR(30) NOT NULL, 
	country VARCHAR(30) NOT NULL
);

CREATE TABLE Airport (
	code CHAR(3) PRIMARY KEY,
	name VARCHAR(30) NOT NULL, 
	country VARCHAR(30) NOT NULL, 
	city VARCHAR(30) NOT NULL
);

CREATE TABLE Airplane (
	code INT PRIMARY KEY, 
	type VARCHAR(10) NOT NULL,
	seats INT NOT NULL,
	year INT NOT NULL
);

CREATE TABLE Customer (
	id INT PRIMARY KEY,
	fname VARCHAR(30) NOT NULL,
	lname VARCHAR(30) NOT NULL,
	email VARCHAR(30) NOT NULL UNIQUE
);

CREATE TABLE Agency (
	name VARCHAR(30) PRIMARY KEY,
	country VARCHAR(30) NOT NULL,
	city VARCHAR(30) NOT NULL,
	phone CHAR(10) NOT NULL UNIQUE
);

CREATE TABLE Flight (
	fnumber INT PRIMARY KEY,
	airline_operator CHAR(2) REFERENCES Airline(code),
	dep_airport CHAR(3) REFERENCES Airport(code),
	arr_airport CHAR(3) REFERENCES Airport(code),
	flight_time DATETIME NOT NULL,
	flight_duration INT NOT NULL,
	airplane_code INT REFERENCES Airplane(code)
);

CREATE TABLE Booking (
	code INT PRIMARY KEY,
	agency_name VARCHAR(30) REFERENCES Agency(name) ON DELETE SET NULL,
	airline_code CHAR(2) REFERENCES Airline(code),
	flight_number INT REFERENCES Flight(fnumber),
	customer_id INT REFERENCES Customer(id),
	booking_date DATETIME NOT NULL,
	flight_date DATETIME NOT NULL,
	price DECIMAL NOT NULL,
	status VARCHAR(10) NOT NULL
);
INSERT INTO AIRPORT
VALUES	('SVO', 'Sheremetyevo', 'Russian Federation', 'Moscow'),
		('DME', 'Domodedovo', 'Russian Federation', 'Moscow'),
		('SOF', 'Sofia International', 'Bulgaria', 'Sofia'),
		('BOJ', 'Burgas International', 'Bulgaria', 'Burgas'),
		('CDG', 'Charles De Gaulle', 'France', 'Paris'),
		('ORY', 'Orly', 'France', 'Paris'),
		('LBG', 'Le Bourget', 'France', 'Paris'),
		('JFK', 'John F Kennedy International', 'United States','New York'),
		('ORD', 'Chicago O''Hare International', 'United States', 'Chicago'),
		('IST', 'Ataturk International', 'Turkey', 'Istanbul'),
		('ESB', 'Esenboga International', 'Turkey', 'Ankara'),
		('AHN', 'Athens', 'Greece', 'Athens'),
		('FKB', 'Karlsruhe', 'Germany', 'Karlsruhe'),
		('TXL', 'Tegel', 'Germany', 'Berlin'),
		('BER', 'Berlin Metropolitan Area', 'Germany', 'Berlin'),
		('MUC', 'Franz Josef Strauss', 'Germany', 'Munich'),
		('GVA', 'Geneve-Cointrin', 'Switzerland', 'Geneve'),
		('BRN', 'Belp', 'Switzerland', 'Berne'),
		('FCO', 'Leonardo da Vinci International', 'Italy', 'Rome'),
		('LIN', 'Linate', 'Italy', 'Milan'),
		('LHR', 'London Heathrow', 'United Kingdom', 'London');
select * from airport;
--airplanes
INSERT INTO AIRPLANE
VALUES	('319', 'Airbus A319', 150, 2003),
		('320', 'Airbus A320', 280, 2013),
		('321', 'Airbus A321', 150, 2018),
		('100', 'Fokker 100', 80, 2000),
		('738', 'Boeing 737-800', 90, 2020),
		('735', 'Boeing 737-800', 90, 2016),
		('AT5', 'ATR 42�0', 50, 1995),
		('DH4', 'De Havilland DHC-8-400', 70, 1992);
select * from airplane;
--flights
INSERT INTO FLIGHT
VALUES	('FB1363', 'SU', 'SOF', 'SVO', '12:45', 100, '738'),
		('FB1364', 'SU', 'SVO', 'SOF', '10:00', 120, '321'),
		('SU2060', 'SU', 'SVO', 'SOF', '11:10', 110, '738'),
		('SU2061', 'SU', 'SOF', 'SVO', '13:00', 110, '320'),
		('FB363', 'FB', 'SOF', 'SVO', '15:10', 110, '738'),
		('FB364', 'FB', 'SVO', 'SOF', '21:05', 120, '738'),
		('FB437', 'FB', 'SOF', 'MUC', '09:10', 120, '319'),
		('FB438', 'FB', 'MUC', 'SOF', '12:10', 90, '738'),
		('TK1027', 'TK', 'IST', 'SOF', '07:00', 100, '738'),
		('TK1028', 'TK', 'SOF', 'IST', '10:00', 100, 'AT5'),
		('OA307', 'OA', 'AHN', 'SOF', '09:25', 40, '738'),
		('OA308', 'OA', 'SOF', 'AHN', '10:25', 40, '738'),
		('EZY3159', 'U2', 'LHR', 'SOF', '10:05', 90, '738'),
		('EZY3160', 'U2', 'SOF', 'LHR', '12:45', 90, '738'),
		('EZY1931', 'U2', 'LHR', 'SOF', '10:15', 90, '738'),
		('EZY1932', 'U2', 'SOF', 'LHR', '13:05', 90, '738'),
		('LH1702', 'LH', 'MUC', 'SOF', '10:10', 100, '738'),
		('LH1703', 'LH', 'SOF', 'MUC', '13:10', 100, '738'),
		('FB851', 'FB', 'SOF', 'LHR', '13:30', 100, '738'),
		('FB852', 'FB', 'LHR', 'SOF', '16:30', 100, '100'),
		('LH1426', 'LH', 'FKB', 'SOF', '11:05', 120, '738'),
		('LH1427', 'LH', 'SOF', 'FKB', '13:45', 120, '735'),
		('FB457', 'FB', 'SOF', 'CDG', '09:10', 100, '319'),
		('FB458', 'FB', 'ORY', 'SOF', '12:10', 100, '738'),
		('TK1037', 'TK', 'ESB', 'SOF', '07:00', 90, '738'),
		('TK1038', 'TK', 'SOF', 'ESB', '10:00', 90, 'AT5');
select * from flight
INSERT INTO CUSTOMER (ID, FNAME, LNAME, EMAIL)
VALUES	(1, 'Petar', 'Milenov', 'petter@mail.com'),
		(2, 'Dimitar', 'Petrov', 'petrov@mail.com'),
		(3, 'Ivan', 'Ivanov', 'ivanov@mail.com'),
		(4, 'Petar', 'Slavov', 'slavov@mail.com'),
		(5, 'Bogdan', 'Bobov', 'bobov@mail.com'),
		(6, 'Petar', 'Kirov', 'kirov@mail.com'),
		(7, 'Vladimir', 'Petrov', 'vladov@mail.com');
select * from Customer;
INSERT INTO AGENCY
VALUES	('Travel One', 'Bulgaria', 'Sofia', '0783482233'),
		('Travel Two', 'Bulgaria', 'Plovdiv', '02882234'),
		('Travel Tour', 'Bulgaria', 'Sofia', NULL),
		('Aerotravel', 'Bulgaria', 'Varna', '02884233'),
		('Aerofly', 'Bulgaria', 'Sofia', '02882533'),
		('Fly Tour', 'Bulgaria', 'Sofia', '02881233');
select * from Agency;
INSERT INTO BOOKING
VALUES	('YN298P', 'Travel One', 'FB', 'FB1363', 1, '2021-04-27', '2021-12-25', 300, 0),
		('YA298P', 'Travel Two', 'TK', 'TK1038', 2, '2021-04-27', '2021-12-25', 300, 1),
		('YB298P', 'Travel Tour', 'TK', 'TK1037', 3, '2021-04-27', '2021-05-25', 400, 0),
		('YC298P', 'Travel One', 'TK', 'TK1028', 4, '2021-04-27', '2021-11-25', 350, 0),
		('YD298P', 'Travel Tour', 'TK', 'TK1028', 1, '2021-04-27', '2021-12-20', 250, 1),
		('YE298P', 'Aerofly', 'TK', 'TK1027', 2, '2021-04-27', '2021-12-21', 150, 0),
		('YJ298P', 'Aerofly', 'SU', 'SU2061', 3, '2021-04-27', '2021-12-05', 500, 1),
		('YS298P', 'Aerofly', 'SU', 'SU2061', 4, '2021-04-27', '2021-11-15', 400, 0),
		('YK298P', 'Aerofly', 'SU', 'SU2060', 1, '2021-04-26', '2021-08-08', 350, 0),
		('YM298P', 'Aerotravel', 'OA', 'OA308', 2, '2021-04-26', '2021-07-10', 350, 1),
		('YN198P', 'Aerotravel', 'OA', 'OA307', 3, '2021-04-26', '2021-11-25', 450, 0),
		('YN498P', 'Aerofly', 'LH', 'LH1703', 1, '2021-04-26', '2021-05-25', 300, 1),
		('YN598P', 'Aerotravel', 'FB', 'FB1363', 5, '2021-04-26', '2021-06-25', 300, 0),
		('YN698P', 'Fly Tour', 'FB', 'FB852', 6, '2021-04-26', '2021-07-25', 330, 1),
		('YL298P', 'Fly Tour', 'FB', 'FB851', 7, '2021-04-26', '2021-05-25', 360, 0),
		('YZ298P', 'Fly Tour', 'FB', 'FB458', 1, '2021-04-26', '2021-06-25', 380, 1),
		('YN268P', 'Fly Tour', 'FB', 'FB457', 2, '2021-04-26', '2021-12-21', 390, 0);
select * from booking;
