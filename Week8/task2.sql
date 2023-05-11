CREATE TABLE Users (
id INT, email VARCHAR(30), password VARCHAR(30), reg_date DATE DEFAULT GETDATE());

CREATE TABLE Friends (
user1 INT, user2 INT);

CREATE TABLE Walls ( 
user_id INT, send_id INT, text VARCHAR(50), date DATETIME DEFAULT GETDATE());

CREATE TABLE Groups (
uid INT, name VARCHAR(20), description VARCHAR(50) DEFAULT '');

CREATE TABLE GroupMembers (
uid INT, user_id INT);

