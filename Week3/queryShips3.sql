USE ships;

/*Напишете заявка, която извежда страните, чиито кораби са с най-голям
брой оръдия.*/
SELECT DISTINCT country
FROM classes
WHERE numguns >= ALL (SELECT numguns FROM classes);

/*Напишете заявка, която извежда класовете, за които поне един от
корабите е потънал в битка*/
SELECT class
FROM classes
WHERE class IN (SELECT class FROM ships WHERE name IN
(SELECT ship FROM outcomes WHERE result ='sunk'));

/*Напишете заявка, която извежда името и класа на корабите с 16 инчови
оръдия.*/
SELECT name, classes.class
FROM ships JOIN classes ON ships.class = classes.class
WHERE bore = 16;


/*Напишете заявка, която извежда имената на битките, в които са
участвали кораби от клас ‘Kongo’*/
SELECT battle
FROM ships JOIN outcomes ON name=ship
WHERE class = 'Kongo';

/*Напишете заявка, която извежда класа и името на корабите, чиито брой
оръдия е по-голям или равен на този на корабите със същия калибър
оръдия.*/
SELECT ships.class, name
FROM classes c1 JOIN ships ON c1.class = ships.class
WHERE numguns>=ALL(SELECT numguns FROM classes WHERE bore=c1.bore)
ORDER BY class;
