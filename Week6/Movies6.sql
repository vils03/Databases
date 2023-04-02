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
