USE pc;

/*Напишете заявка, която извежда производителите на персонални
компютри с честота над 500*/
SELECT DISTINCT maker
FROM pc JOIN product ON pc.model = product.model
WHERE speed > 500;


/*Напишете заявка, която извежда код, модел и цена на принтерите с
най-висока цена.*/
SELECT code, model, price
FROM printer
WHERE price >= ALL (SELECT price FROM printer);

/*Напишете заявка, която извежда лаптопите, чиято честота е по-ниска от
честотата на всички персонални компютри.*/
SELECT DISTINCT *
FROM laptop
WHERE speed < ALL (SELECT speed FROM pc);

/*Напишете заявка, която извежда модела и цената на продукта (PC,
лаптоп или принтер) с най-висока цена.*/
--???

/*Напишете заявка, която извежда производителя на цветния принтер с
най-ниска цена.*/
SELECT maker
FROM product JOIN printer ON product.model = printer.model
WHERE printer.color = 'y' AND printer.price <= ALL (SELECT price FROM printer WHERE color = 'y');

/*Напишете заявка, която извежда производителите на тези персонални
компютри с най-малко RAM памет, които имат най-бързи процесори.*/
SELECT DISTINCT maker
FROM product JOIN pc ON product.model = pc.model
WHERE ram <= ALL(SELECT ram FROM pc) OR speed >= ALL(SELECT speed FROM pc);
