USE movies;

/*Напишете заявка, която извежда заглавие и година на всички филми, които са
по-дълги от 120 минути и са снимани преди 2000 г. Ако дължината на филма е
неизвестна, заглавието и годината на този филм също да се изведат.*/
SELECT title, year, length
FROM movie
WHERE (length >120 OR length IS NULL)AND year < 2000 ;

/*Напишете заявка, която извежда име и пол на всички актьори (мъже и жени),
чието име започва с 'J' и са родени след 1948 година. Резултатът да бъде
подреден по име в намаляващ ред.*/
SELECT name, gender
FROM moviestar
WHERE name LIKE 'J%' AND birthdate > 1948
ORDER BY name DESC;

/*Напишете заявка, която извежда име на студио и брой на актьорите,
участвали във филми, които са създадени от това студио.*/
SELECT studioname, COUNT(DISTINCT starname) AS numActors
FROM movie JOIN starsin ON title = movietitle
GROUP BY studioname;

/*Напишете заявка, която за всеки актьор извежда име на актьора и броя на
филмите, в които актьорът е участвал.*/
SELECT starname, COUNT(movietitle) AS numMovies
FROM starsin
GROUP BY starname;

/*Напишете заявка, която за всяко студио извежда име на студиото и заглавие
на филма, излязъл последно на екран за това студио.*/
SELECT studioname, title, year
FROM movie m1
WHERE year >= ALL(SELECT year FROM movie m2 WHERE m1.studioname= m2.studioname);

/*Напишете заявка, която извежда името на най-младия актьор (мъж)*/
SELECT name
FROM moviestar
WHERE birthdate = (SELECT MAX(birthdate) FROM moviestar WHERE gender = 'M');

/*Напишете заявка, която извежда име на актьор и име на студио за тези
актьори, участвали в най-много филми на това студио.*/
SELECT studioname, starname, COUNT(starname) AS num_movies
FROM movie JOIN starsin ON title = movietitle AND year = movieyear
GROUP BY studioname, starname
HAVING COUNT(movietitle)>= ALL 
(SELECT COUNT(movietitle) FROM movie JOIN starsin ON title = movietitle AND year = movieyear
GROUP BY studioname, starname);

/*Напишете заявка, която извежда заглавие и година на филма, и брой на
актьорите, участвали в този филм за тези филми с повече от двама актьори*/
SELECT title, year, COUNT(starname) AS numActors
FROM starsin JOIN movie ON title = movietitle AND year = movieyear
GROUP BY title, year
HAVING COUNT(starname) >2;

