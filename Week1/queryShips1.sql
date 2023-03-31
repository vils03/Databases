USE Ships;

/*Напишете заявка, която извежда класа и страната за всички 
класове с по-малко от 10 оръдия*/
SELECT class, country
FROM classes
WHERE numguns < 10;


/*Напишете заявка, която извежда имената на корабите, пуснати на вода
преди 1918. Задайте псевдоним shipName на колоната.*/
SELECT name as 'shipName'
FROM ships
WHERE launched < 1918;

/*Напишете заявка, която извежда имената на корабите, потънали в битка
и имената на съответните битки*/
SELECT ship
FROM outcomes
WHERE result = 'sunk';

/*Напишете заявка, която извежда имената на корабите с име, съвпадащо
с името на техния клас.
*/
SELECT name
FROM ships
WHERE name = class;

/*Напишете заявка, която извежда имената на корабите, които започват с
буквата R.*/
SELECT name
FROM ships
WHERE name like 'R%';

/*Напишете заявка, която извежда имената на корабите, които съдържат 2
или повече думи*/
SELECT name
FROM ships
WHERE name like '% %';
