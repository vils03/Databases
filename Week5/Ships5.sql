USE ships;


/*Напишете заявка, която извежда броя на класовете бойни кораби.*/
SELECT COUNT(DISTINCT class) AS classCount
FROM classes
WHERE type = 'bb';

/*Напишете заявка, която извежда средния брой оръдия за всеки клас боен кораб.*/
SELECT class, AVG(numguns) AS avgGuns
FROM classes
WHERE type = 'bb'
GROUP BY class;

/*Напишете заявка, която извежда средния брой оръдия за всички бойни кораби.*/
SELECT  AVG(numguns) AS avgGuns
FROM classes
WHERE type = 'bb';

/*Напишете заявка, която извежда за всеки клас първата и последната година, в
която кораб от съответния клас е пуснат на вода.*/
SELECT  ships.class, MIN(launched) AS FirstYear, MAX(launched) AS LastYear
FROM classes JOIN ships ON classes.class=ships.class
GROUP BY ships.class;

/*Напишете заявка, която извежда броя на корабите, потънали в битка според
класа.*/
SELECT class, COUNT(ship) AS countSunk
FROM ships JOIN outcomes ON name = ship
WHERE result = 'sunk'
GROUP BY ships.class;

/*Напишете заявка, която извежда броя на корабите, потънали в битка според
класа, за тези класове с повече от 2 кораба.*/
SELECT class, COUNT(ship) AS countSunk
FROM ships JOIN outcomes ON name = ship
WHERE result= 'sunk'
GROUP BY class
HAVING (SELECT COUNT(name) FROM ships) > 2;

/*Напишете заявка, която извежда средния калибър на оръдията на корабите за
всяка страна.*/
SELECT country, AVG(bore) AS avgBore
FROM classes JOIN ships ON classes.class = ships.class
GROUP BY country;
