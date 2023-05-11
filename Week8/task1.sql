CREATE TABLE Product1 (maker CHAR(1), model CHAR(4), type VARCHAR(7));

CREATE TABLE Printer1 (code INT, model CHAR(4), price DECIMAL(18,2));

INSERT INTO Product1 VALUES ('a', '1234', 'Type');

INSERT INTO Printer1 VALUES (222, '1234', 123.23);

ALTER TABLE Printer1 ADD type VARCHAR(6) CONSTRAINT type_check CHECK (type IN ('laser', 'jet', 'matrix'));

ALTER TABLE Printer1 ADD color CHAR(1) DEFAULT 'n' CONSTRAINT color_check CHECK (color IN ('y', 'n'));

ALTER TABLE Printer1 DROP COLUMN price;

DROP TABLE Printer1, Product1;
