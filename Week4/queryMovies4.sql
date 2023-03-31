USE Movies;
 
/*Напишете заявка, която извежда името на продуцента и имената на
филмите, продуцирани от продуцента на филма ‘Star Wars’.*/
 
SELECT title, name
FROM movieexec JOIN movie ON cert# = producerc#
WHERE cert# = (SELECT producerc#
                FROM movie
                WHERE title = 'Star Wars');
 
/*Напишете заявка, която извежда имената на продуцентите на филмите, в
които е участвал ‘Harrison Ford*/
 
SELECT DISTINCT name
FROM movieexec JOIN movie ON cert# = producerc#
WHERE title = ANY (SELECT movietitle
              FROM starsin
              WHERE starname = 'Harrison Ford');
 
/*. Напишете заявка, която извежда името на студиото и имената на
актьорите, участвали във филми, произведени от това студио, подредени
по име на студио*/
 
SELECT DISTINCT studioname, starname
FROM starsin JOIN movie ON title = movietitle AND YEAR = movieyear
ORDER BY studioname; 
 
/*Напишете заявка, която извежда имената на актьорите, участвали във
филми на продуценти с най-големи нетни активи*/
SELECT starname, networth, title
FROM  starsin JOIN (movieexec JOIN movie ON cert# = producerc#) ON title = movietitle
WHERE networth >= ALL (SELECT networth FROM movieexec);
 
/*. Напишете заявка, която извежда имената на актьорите, които не са
участвали в нито един филм.*/
SELECT name, movietitle
FROM moviestar LEFT JOIN starsin ON name = starname
WHERE movietitle IS NULL;