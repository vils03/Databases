USE pc;

/*Напишете заявка, която извежда средната честота на персоналните компютри.*/
SELECT AVG(speed) AS AvgSpeed
FROM pc;

/*Напишете заявка, която извежда средния размер на екраните на лаптопите за
всеки производител.*/
SELECT maker, AVG(screen) AS screen
FROM product JOIN laptop ON product.model = laptop.model
GROUP BY maker;

/*Напишете заявка, която извежда средната честота на лаптопите с цена над 1000.*/
SELECT AVG(speed) AS speed
FROM laptop
WHERE price > 1000;

/*Напишете заявка, която извежда средната цена на персоналните компютри,
произведени от производител ‘A’.*/
SELECT AVG(price) AS price
FROM product JOIN pc ON product.model = pc.model
WHERE maker = 'A';

/*Напишете заявка, която извежда средната цена на персоналните компютри и
лаптопите за производител ‘B’*/
SELECT maker, AVG(price) AS price
FROM((SELECT model, price FROM laptop) UNION ALL (SELECT model,price FROM pc)) AS t join product ON t.model = product.model
WHERE maker = 'B'
GROUP BY maker;

/*Напишете заявка, която извежда средната цена на персоналните компютри
според различните им честоти.*/
SELECT speed, AVG(price) AS price
FROM pc
GROUP BY speed ;

/*Напишете заявка, която извежда производителите, които са произвели поне 3
различни персонални компютъра (с различен код).*/
SELECT maker, COUNT(code) AS pcCount
FROM pc JOIN product ON pc.model = product.model
GROUP BY maker
HAVING COUNT(code) >= 3;

/*Напишете заявка, която извежда производителите с най-висока цена на
персонален компютър.*/
SELECT maker, price
FROM product JOIN pc ON product.model = pc.model
WHERE price = (SELECT MAX(price) FROM pc);

/*Напишете заявка, която извежда средната цена на персоналните компютри за
всяка честота по-голяма от 800.*/
SELECT speed, AVG(price) AS avgSpeed
FROM pc
WHERE speed >= 800
GROUP BY speed;


/*Напишете заявка, която извежда средния размер на диска на тези персонални
компютри, произведени от производители, които произвеждат и принтери.
Резултатът да се изведе за всеки отделен производител.*/
SELECT maker, AVG(hd) AS avgHd
FROM pc JOIN product ON pc.model = product.model
WHERE maker IN (SELECT maker FROM printer JOIN product ON printer.model = product.model)
GROUP BY maker;

