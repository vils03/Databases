USE Movies;

#### 1. Напишете заявка, която извежда адреса на студио ‘Disney’
```sql
SELECT address
FROM studio
WHERE name = 'Disney';
```

#### 2. Напишете заявка, която извежда рождената дата на актьора Jack Nicholson
```sql
SELECT birthdate
FROM moviestar
WHERE name = 'Jack Nicholson';
```

#### 3. Напишете заявка, която извежда имената на актьорите, които са
участвали във филм от 1980 или във филм, в чието заглавие има думата
‘Knight’
```sql
SELECT starname
FROM starsin
WHERE movieyear = 1980 or movietitle like '%Knight%';
```

#### 4. Напишете заявка, която извежда имената на продуцентите с нетни
активи над 10 000 000 долара
```sql
SELECT name
FROM movieexec
WHERE networth >= 10e6;
```


#### 5. Напишете заявка, която извежда имената на актьорите, които са мъже
или живеят на Prefect Rd.
```sql
SELECT name
FROM moviestar
WHERE gender = 'M' or address = 'Prefect Rd';
```