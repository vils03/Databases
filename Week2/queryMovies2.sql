USE Movies;
 
 
/*�������� ������, ����� ������� ������� �� ��������� ����, ��������� ���
����� The Usual Suspects*/
SELECT name
FROM starsin JOIN moviestar 
ON starname = name
WHERE gender = 'M' and movietitle = 'The Usual Suspects';
 
 
/* �������� ������, ����� ������� ������� �� ���������, ��������� ��� ����� ��
1995, ����������� �� ������ MGM*/
SELECT starname
FROM movie JOIN starsin 
ON year = movieyear
WHERE year = 1995 and studioname = 'MGM';
 
 
/*�������� ������, ����� ������� ������� �� ������������, ����� ��
����������� ����� �� ������ MGM*/
SELECT DISTINCT name
FROM movie JOIN movieexec
ON producerc# = cert#
WHERE studioname = 'MGM';
 
 
/*�������� ������, ����� ������� ������� �� ����� � �������, ��-������ ��
��������� �� ����� Star Wars*/
SELECT mv1.title
FROM movie as mv1, movie as mv2
WHERE mv2.title = 'Star Wars' and mv1.length > mv2.length;
 
/*�������� ������, ����� ������� ������� �� ������������ 
� ����� ������ �������� �� ���� �� Stephen Spielberg*/
SELECT mv1.name
FROM movieexec as mv1, movieexec as mv2
WHERE mv2.name = 'Stephen Spielberg' and mv1.networth > mv2.networth;
 
 
 
 
