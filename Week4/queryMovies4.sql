USE Movies;
 
/*�������� ������, ����� ������� ����� �� ���������� � ������� ��
�������, ����������� �� ���������� �� ����� �Star Wars�.*/
 
SELECT title, name
FROM movieexec JOIN movie ON cert# = producerc#
WHERE cert# = (SELECT producerc#
                FROM movie
                WHERE title = 'Star Wars');
 
/*�������� ������, ����� ������� ������� �� ������������ �� �������, �
����� � �������� �Harrison Ford*/
 
SELECT DISTINCT name
FROM movieexec JOIN movie ON cert# = producerc#
WHERE title = ANY (SELECT movietitle
              FROM starsin
              WHERE starname = 'Harrison Ford');
 
/*. �������� ������, ����� ������� ����� �� �������� � ������� ��
���������, ��������� ��� �����, ����������� �� ���� ������, ���������
�� ��� �� ������*/
 
SELECT DISTINCT studioname, starname
FROM starsin JOIN movie ON title = movietitle AND YEAR = movieyear
ORDER BY studioname; 
 
/*�������� ������, ����� ������� ������� �� ���������, ��������� ���
����� �� ���������� � ���-������ ����� ������*/
SELECT starname, networth, title
FROM  starsin JOIN (movieexec JOIN movie ON cert# = producerc#) ON title = movietitle
WHERE networth >= ALL (SELECT networth FROM movieexec);
 
/*. �������� ������, ����� ������� ������� �� ���������, ����� �� ��
��������� � ���� ���� ����.*/
SELECT name, movietitle
FROM moviestar LEFT JOIN starsin ON name = starname
WHERE movietitle IS NULL;