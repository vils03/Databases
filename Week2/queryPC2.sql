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
но не произвеждат персонални компютри.*/

SELECT maker
FROM product JOIN laptop 
ON product.model = laptop.model 
EXCEPT
SELECT maker
FROM product JOIN pc
ON product.model = pc.model;


/*Напишете заявка, която извежда размерите на тези дискове, които се предлагат
в поне два различни персонални компютъра (два компютъра с различен код).*/

SELECT DISTINCT pc1.hd
FROM  pc as pc1, pc as pc2
WHERE pc1.hd = pc2.hd AND pc1.code != pc2.code; 


/*Напишете заявка, която извежда двойките модели на персонални компютри,
които имат еднаква честота и памет. Двойките трябва да се показват само по
веднъж, например само (i, j), но не и (j, i).*/
SELECT pc1.model, pc2.model
FROM pc AS pc1, pc AS pc2
WHERE pc1.speed = pc2.speed AND pc1.ram = pc2.ram AND pc1.model < pc2.model;


/*Напишете заявка, която извежда производителите на поне два различни
персонални компютъра с честота поне 400.*/
SELECT DISTINCT maker
FROM (product pr JOIN pc ON pr.model = pc.model) JOIN pc pc2 ON pr.model = pc2.model
WHERE pc.speed >=400 AND pc2.speed >= 400 AND pc.code != pc2.code
