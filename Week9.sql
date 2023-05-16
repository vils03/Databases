/*Създайте изглед, който извежда име на авиокомпания оператор на полета, номер на полет
и брой пътници, потвърдили резервация за този полет. Тествайте изгледa.*/

DROP VIEW view_operator_flight_passenger;

CREATE VIEW view_operator_flight_passenger
AS
SELECT agency, flight_number, COUNT(customer_id) AS numCustomers
FROM bookings
WHERE status=1
GROUP BY agency, flight_number;

/*Създайте изглед, който за всяка агенция извежда името на клиента с най-много
резервации. Тествайте изгледa.*/
CREATE VIEW view_most_reservations
AS
SELECT fname
FROM bookings JOIN customers ON customer_id=id
WHERE COUNT(flight_number) > ALL COUNT(flight_number)
ORDER BY fname;


/*Създайте изглед за таблицата Agencies, който извежда всички данни за агенциите от град
София. Дефинирайте изгледa с CHECK OPTION. Тествайте изгледa.*/

CREATE VIEW view_sofia_agencies
AS
SELECT *
FROM AGENCIES
WHERE CITY='Sofia'
WITH CHECK OPTION
;

/*Създайте изглед за таблицата Agencies, който извежда всички данни за агенциите, такива
че телефонните номера на тези агенции да имат стойност NULL. Дефинирайте изгледa с
CHECK OPTION. Тествайте изгледa.*/
CREATE VIEW view_phone_null
AS
SELECT *
FROM agencies
WHERE phone IS NULL
WITH CHECK OPTION;
