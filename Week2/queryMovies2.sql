USE Movies;
 
 
/*Напишете заявка, която извежда имената на актьорите мъже, участвали във
филма The Usual Suspects*/
SELECT name
FROM starsin JOIN moviestar 
ON starname = name
WHERE gender = 'M' and movietitle = 'The Usual Suspects';
 
 
/* Напишете заявка, която извежда имената на актьорите, участвали във филми от
1995, продуцирани от студио MGM*/
SELECT starname
FROM movie JOIN starsin 
ON year = movieyear
WHERE year = 1995 and studioname = 'MGM';
 
 
/*Напишете заявка, която извежда имената на продуцентите, които са
продуцирали филми на студио MGM*/
SELECT DISTINCT name
FROM movie JOIN movieexec
ON producerc# = cert#
WHERE studioname = 'MGM';
 
 
/*Напишете заявка, която извежда имената на филми с дължина, по-голяма от
дължината на филма Star Wars*/
SELECT mv1.title
FROM movie as mv1, movie as mv2
WHERE mv2.title = 'Star Wars' and mv1.length > mv2.length;
 
/*Напишете заявка, която извежда имената на продуцентите 
с нетни активи поголеми от тези на Stephen Spielberg*/
SELECT mv1.name
FROM movieexec as mv1, movieexec as mv2
WHERE mv2.name = 'Stephen Spielberg' and mv1.networth > mv2.networth;
 
 
 
 
