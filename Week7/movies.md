```sql
/* Да се вмъкне информация за актрисата Nicole Kidman. За нея знаем само, че е родена на
20.06.1967 */


INSERT INTO MovieStar(name, birthdate) VALUES('Nicole Kidman', '1967-06-20');


/* Да се изтрият всички продуценти с нетни активи под 30 милиона. */


DELETE FROM movieexec 
WHERE networth<30e7;


/* Да се изтрие информацията за всички филмови звезди, за които не се знае адреса. */

DELETE FROM MovieStar
WHERE address IS NULL;
```
