USE master;
GO
/*�����յ�MyPetShop���ݿ�*/
/*�����ʵ�ʻ����������ݿ��ļ�����־�ļ��Ĵ��·��*/
CREATE DATABASE Studentdata
ON 
( NAME = Studentdata,
    FILENAME = 'D:\Project\VS-project\Solution1\WebSite1\App_Data\Studentdata.mdf',/*...\App_Data\Studentdata.mdf*/
    SIZE = 5MB,
    MAXSIZE = 50MB,
    FILEGROWTH = 1MB )
LOG ON
( NAME = Studentdata_log,
    FILENAME = 'D:\Project\VS-project\Solution1\WebSite1\App_Data\Studentdata_log.ldf',/* ...\App_Data\Studentdata_log.ldf*/
    SIZE = 3MB,
    MAXSIZE = 25MB,
    FILEGROWTH = 1MB )
		COLLATE Chinese_PRC_CI_AS;
GO
USE Studentdata

CREATE TABLE Studentsmath(
    ѧ�� INT PRIMARY KEY,
    ���� VARCHAR(50),
    רҵ VARCHAR(10),
    �Ա� VARCHAR(10) CHECK(�Ա� IN ('��', 'Ů')),
    ���� INT,
    �������� DATE,
    ��ͥסַ VARCHAR(100),
    �ߵ���ѧ int,
    ���Դ��� int,
    ������ int,
    �ܳɼ� int
);


INSERT INTO Studentsmath (ѧ��, ����, רҵ, �Ա�, ����, ��������, ��ͥסַ,�ߵ���ѧ,���Դ���,������,�ܳɼ�)
VALUES ('10001', '����', '��ѧ', '��', 20, '2003-05-12', '�����г�����', 85, 78, 90, 253),
       ('10002', '����', '��ѧ', '��', 19, '2004-02-28', '�����к�����', 92, 85, 88, 265),
       ('10003', '����', '��ѧ', '��', 21, '2002-09-08', '�����ж�����', 78, 91, 85, 254),
       ('10004', '����', '��ѧ', '��', 18, '2005-12-01', '������������', 89, 80, 87, 256),
       ('10005', 'Ǯ��', '��ѧ', 'Ů', 20, '2003-07-22', '�����з�̨��', 86, 89, 92, 267),
       ('10006', '���', '��ѧ', 'Ů', 19, '2004-04-15', '������ʯ��ɽ��', 91, 88, 82, 261),
       ('10007', '�ܾ�', '��ѧ', 'Ů', 21, '2002-10-21', '������ͨ����', 80, 78, 89, 247),
       ('10008', '��ʮ', '��ѧ', 'Ů', 18, '2005-11-11', '�����в�ƽ��', 88, 92, 90, 270),
       ('10009', '֣ʮһ', '��ѧ', '��', 20, '2003-03-17', '�����з�ɽ��', 85, 86, 83, 254),
       ('10010', '��ʮ��', '��ѧ', '��', 19, '2004-01-02', '�����д�����', 92, 90, 85, 267),
       ('10011', '��ʮ��', '��ѧ', '��', 21, '2002-08-13', '������˳����', 78, 89, 90, 257),
       ('10012', '��ʮ��', '��ѧ', '��', 18, '2005-10-28', '�����л�����', 89, 92, 86, 267),
       ('10013', '��ʮ��', '��ѧ', 'Ů', 20, '2003-06-04', '������������', 86, 85, 89, 260),
       ('10014', 'Ǯʮ��', '��ѧ', 'Ů', 19, '2004-03-01', '������������', 91, 78, 92, 261),
       ('10015', '��ʮ��', '��ѧ', 'Ů', 21, '2002-11-18', '������ƽ����', 80, 91, 83, 254),
       ('10016', '��ʮ��', '��ѧ', 'Ů', 18, '2005-12-30', '��������ͷ����', 88, 80, 88, 256);

CREATE TABLE Studentscomputer(
    ѧ�� INT PRIMARY KEY,
    ���� VARCHAR(50),
    רҵ VARCHAR(10),
    �Ա� VARCHAR(10) CHECK(�Ա� IN ('��', 'Ů')),
    ���� INT,
    �������� DATE,
    ��ͥסַ VARCHAR(100),
    ���ݽṹ int,
    ����ϵͳ int,
    ��������� int,
    ��������ԭ�� int,
    �ܳɼ� int
);
INSERT INTO Studentscomputer (ѧ��, ����, רҵ, �Ա�, ����, ��������, ��ͥסַ,���ݽṹ,����ϵͳ,���������,��������ԭ��,�ܳɼ�)VALUES
('20001', '��ʮ��', '�����', '��', 22, '2001-02-03', '�����к�����', 85, 80, 90, 75, 330),
('20002', '���ʮ', '�����', 'Ů', 20, '2003-05-10', '�����г�����', 75, 90, 85, 80, 330),
('20003', '����һ', '�����', '��', 21, '2002-03-22', '�����ж�����', 80, 70, 95, 85, 330),
('20004', '�Զ���', '�����', 'Ů', 23, '2000-12-31', '������������', 90, 75, 75, 90, 330),
('20005', '�ܶ���', '�����', '��', 21, '2002-09-18', '�����в�ƽ��', 75, 85, 80, 90, 330),
('20006', 'Ǯ����', '�����', 'Ů', 20, '2003-08-08', '�����з�̨��', 80, 80, 75, 95, 330),
('20007', '�����', '�����', '��', 22, '2001-06-02', '������ͨ����', 75, 90, 85, 80, 330),
('20008', '������', '�����', 'Ů', 23, '2000-10-11', '������˳����', 70, 85, 90, 85, 330),
('20009', '�¶���', '�����', '��', 20, '2003-01-28', '�����з�ɽ��', 85, 75, 90, 80, 330),
('20010', '�ֶ���', '�����', 'Ů', 22, '2001-08-06', '�����д�����', 90, 85, 75, 80, 330),
('20011', '�ƶ���', '�����', '��', 21, '2002-07-16', '������ʯ��ɽ��', 80, 90, 85, 75, 330),
('20012', '����ʮ', '�����', 'Ů', 23, '2000-06-08', '������������', 75, 80, 95, 80, 330),
('20013', '֣��һ', '�����', '��', 20, '2003-03-29', '�����л�����', 85, 75, 90, 80, 330),
('20014', '������', '�����', 'Ů', 22, '2001-04-25', '��������ͷ����', 90, 85, 75, 80, 330),
('20015', '������', '�����', '��', 23, '2000-11-19', '������������', 75, 90, 80, 85, 330),
('20016', '������', '�����', 'Ů', 20, '2003-01-12', '�����з�ɽ��', 80, 80, 85, 85, 330),
('20017', '������', '�����', '��', 22, '2001-09-09', '��������ͷ����', 75, 90, 80, 85, 330),
('20018', '������', '�����', 'Ů', 21, '2002-08-15', '������������', 85, 75, 90, 80, 330);

CREATE TABLE Mmtuser(
    ID INT PRIMARY KEY,
    Username NCHAR (10),
    Password NCHAR (10),
);
INSERT INTO Mmtuser(ID,Username,Password)VALUES
(01,'admin1','12345'),
(02,'admin2','22222'),
(03,'admin3','54321');