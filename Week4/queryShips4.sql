USE Ships;

/*�������� ������, ����� ������� ������ ������� ���������� �� �����
�����, ����������� � ������� �� ������� ����. � ��������� �� ������ ��
�� �������� ���� �������, ����� ����� ������.*/
SELECT *
FROM ships s LEFT JOIN classes c ON s.class = c.class
WHERE NOT s.name IS NULL;

/*��������� ������� ������, ���� ���� ��� �������� � ��������� �
���������, ����� ����� ������, �� ����������� ������ ��� ������ ���
���� �������.*/
SELECT *
FROM ships s LEFT JOIN classes c ON s.class = c.class
WHERE NOT s.name IS NULL OR c.class IN (SELECT name
									    FROM ships); 
									   
/*�� ����� ������ �������� ������� �� ��������, ����� ������ �� ��
��������� � �����*/
