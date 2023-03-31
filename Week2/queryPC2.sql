USE PC;
 
/*Напишете заявка, която извежда производителя и честотата на лаптопите с
размер на диска поне 9 GB*/
SELECT DISTINCT maker, speed
FROM product JOIN laptop
ON product.model = laptop.model
WHERE hd >= 9 and type = 'Laptop';
 
/*Напишете заявка, която извежда модел и цена на продуктите, произведени от
производител с име B.*/
SELECT product.model, laptop.price
FROM product JOIN laptop
ON product.model = laptop.model
WHERE maker = 'B'
UNION
SELECT product.model, pc.price
FROM product JOIN pc
ON product.model = pc.model
WHERE maker = 'B'
UNION
SELECT product.model, printer.price
FROM product JOIN printer
ON product.model = printer.model
WHERE maker = 'B';
 

/*Напишете заявка, която извежда производителите, които произвеждат лаптопи,
но не произвеждат персонални компютри.
*/

SELECT maker
FROM product JOIN laptop 
ON product.model = laptop.model 
EXCEPT
SELECT maker
FROM product JOIN pc
ON product.model = pc.model;


/*Напишете заявка, която извежда размерите на тези дискове, които се предлагат
в поне два различни персонални компютъра (два компютъра с различен код).*/

SELECT 
FROM pc AS p1 JOIN pc AS p2
ON p1.code != p2.code
WHERE 