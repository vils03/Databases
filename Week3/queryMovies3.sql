USE Movies;

/*. Напишете заявка, която извежда имената на актрисите,
които са също и
продуценти с нетни активи над 10 милиона.*/
SELECT name
FROM moviestar
WHERE name IN (SELECT name
FROM movieexec
WHERE networth >= 10000000);


/*Напишете заявка, която извежда имената на тези актьори
(мъже и жени),
които не са продуценти.
*/
SELECT name
FROM moviestar
WHERE name NOT IN (SELECT name FROM movieexec);


/*Напишете заявка, която извежда имената на всички
филми с дължина,
по-голяма от дължината на филма ‘Star Wars’*/
SELECT m1.title
FROM movie m1
WHERE m1.length > (SELECT m2.length 
		 FROM movie m2
		 WHERE m2.title = 'Star Wars');

/*Напишете заявка, която извежда имената на 
продуцентите и имената на
филмите за всички филми, които са продуцирани от 
продуценти с нетни
активи по-големи от тези на ‘Merv Griffin’
*/
SELECT title, mv1.name
FROM movie  JOIN movieexec mv1 ON cert# = producerc# 
WHERE mv1.networth > (SELECT networth
				  FROM movieexec mv2
				  WHERE mv2.name = 'Merv Griffin');

