USE ships;

/*�������� ������, ����� ������� ����� �� �������� � ��������������� ���
50000.*/
SELECT name
FROM ships JOIN classes ON ships.class = classes.class
WHERE displacement > 50000;


