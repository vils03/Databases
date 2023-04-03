USE ships;


/*Напишете заявка, която извежда имената на всички кораби без повторения,
които са участвали в поне една битка и чиито имена започват с C или K.*/
SELECT ship
FROM outcomes
GROUP BY ship
HAVING COUNT(result) >0 AND (ship LIKE 'C%' OR ship LIKE 'K%');

/*Напишете заявка, която извежда име и държава на всички кораби, които
никога не са потъвали в битка (може и да не са участвали).*/
SELECT name, country
FROM ships JOIN classes ON ships.class = classes.class
WHERE name NOT IN (SELECT ship FROM outcomes WHERE result='sunk');

/*Напишете заявка, която извежда държавата и броя на потъналите кораби за
тази държава. Държави, които нямат кораби или имат кораб, но той не е
участвал в битка, също да бъдат изведени.*/
SELECT country, COUNT(ship) AS num_sunk
FROM classes LEFT JOIN ships ON classes.class=ships.class
LEFT JOIN outcomes ON ship=name AND result='sunk'
GROUP BY country;

/*Напишете заявка, която извежда име на битките, които са по-мащабни (с
повече участващи кораби) от битката при Guadalcanal.*/
SELECT battle
FROM outcomes 
GROUP BY battle
HAVING COUNT(ship) > ALL (SELECT COUNT(ship) FROM outcomes WHERE battle = 'Guadalcanal');

/*Напишете заявка, която извежда име на битките, които са по-мащабни (с
повече участващи страни) от битката при Surigao Strait.*/
SELECT battle
FROM (outcomes JOIN ships ON ship=name ) JOIN classes ON ships.class=classes.class
GROUP BY country, battle
HAVING COUNT(country) > ALL (SELECT COUNT(country) FROM outcomes WHERE battle = 'Surigao Strait');


/*Напишете заявка, която извежда имената на най-леките кораби с най-много
оръдия.*/
SELECT name, displacement,numguns
FROM classes JOIN ships ON classes.class = ships.class
WHERE displacement = (SELECT MIN(displacement) FROM classes)
ORDER BY numguns;

/*Изведете броя на корабите, които са били увредени в битка, но са били
поправени и по-късно са победили в друга битка.*/
SELECT COUNT(DISTINCT o1.ship) AS num_ships
FROM outcomes o1, outcomes o2, battles  b1, battles b2
WHERE o1.battle = b1.name AND o2.battle=b2.name AND o1.ship=o2.ship
AND o1.result='damaged' AND b1.date < b2.date AND o2.result ='ok';

/*Изведете име на корабите, които са били увредени в битка, но са били
поправени и по-късно са победили в по-мащабна битка (с повече кораби).*/
