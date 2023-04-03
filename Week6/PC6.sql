USE pc;

/*Напишете заявка, която извежда всички модели лаптопи, за които се
предлагат както разновидности с 15" екран, така и с 11" екран.*/
SELECT model, code, screen
FROM laptop
WHERE screen = 15 OR screen = 11;

/*Да се изведат различните модели компютри, чиято цена 
е по-ниска от най-евтиния лаптоп, произвеждан от същия производител.*/
SELECT DISTINCT pc.model
FROM pc JOIN product p1 ON pc.model = p1.model
WHERE pc.price < (SELECT MIN(price) FROM laptop JOIN product p2 ON laptop.model = p2.model
WHERE p1.maker=p2.maker);

/*Един модел компютри може да се предлага в няколко разновидности с
различна цена. Да се изведат тези модели компютри, чиято средна цена (на
различните му разновидности) е по-ниска от най-евтиния лаптоп, произвеждан
от същия производител.*/
SELECT pc.model, p1.maker, AVG(pc.price) AS avgPrice
FROM pc JOIN product p1 ON pc.model = p1.model
GROUP BY pc.model, p1.maker
HAVING AVG(pc.price) <(SELECT MIN(laptop.price) 
FROM laptop JOIN product p2 ON laptop.model = p2.model AND p1.maker=p2.maker);

/*Напишете заявка, която извежда за всеки компютър код на продукта,
производител и брой компютри, които имат цена, по-голяма или равна на
неговата.*/
SELECT pc1.code, pr1.maker, COUNT(pc2.code) AS countC
FROM pc AS pc1, pc AS pc2, product AS pr1 
WHERE pc1.model=pr1.model AND pc2.model=pr1.model AND pc1.price<=pc2.price
GROUP BY pc1.code, pr1.maker;

