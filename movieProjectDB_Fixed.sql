drop table schedule;
drop table movie;
drop table dayRoom;
drop table Room;
drop table ticket;
drop table member;
drop table reviews;

CREATE TABLE movie(
	movieNo number primary key, --��ȭ ��ȣ
	movieName VARCHAR2(20), --��ȭ ����
	category number, --�帣
	runtime number, --120��
	img VARCHAR2(50), --�̹��� ���� �ҷ����� ���� ����
	info VARCHAR2(200) --��ȭ ����
);

INSERT INTO movie VALUES(10000, '�����', 01, 120, '1.jpg', '��մ�');
INSERT INTO movie VALUES(10001, '������', 02, 120, '2.jpg', '�������̴�');
INSERT INTO movie VALUES(10002, '���̾��', 01, 120, '3.jpg', '���ִ�');
INSERT INTO movie VALUES(10003, '�ܿ�ձ�2', 05, 130, '4.jpg', '��մ�');
INSERT INTO movie VALUES(10004, '����Ʈ', 03, 140, '5.jpg', 'ų��Ÿ��');
INSERT INTO movie VALUES(10005, '�ݵ�', 04, 155, '6.jpg', '�߻����');
INSERT INTO movie VALUES(10006, '23���̵�Ƽ��', 04, 150, '7.jpg', '����');

CREATE TABLE MEMBER(
	id VARCHAR2(20) PRIMARY KEY, --���̵�
	pw VARCHAR2(20), --��й�ȣ
	email VARCHAR2(50), --�̸���
	tel VARCHAR2(20), --��ȭ��ȣ
	birth DATE --�������
);

insert into member values('test','1234','test@test.com','010-1234-1234','2002-05-12');

CREATE TABLE SCHEDULE( --�󿵰�(ROOM) --�����ð� ��ȭ���̶� �������ִ� ���̺�
	schNo NUMBER PRIMARY KEY, --������ ��ȣ
	movieName varchar2(20),
    movieNo NUMBER, -- ��ȭ ��ȣ
	runDay DATE, --�� ��¥
	runtime NUMBER, --�� �ð� : ���¥�� ��ȭ����
	roomNo NUMBER, -- �󿵰� ��ȣ
    CONSTRAINT FK_movieNo foreign key(movieNo) REFERENCES movie(movieNo)
);

insert into schedule values(1, '�����',10000,TO_DATE('2022/07/29 11:50','yyyy/mm/dd hh24:mi'),120,1);
insert into schedule values(2, '�����',10000,TO_DATE('2022/07/29 13:50','yyyy/mm/dd hh24:mi'),120,1);
insert into schedule values(3, '�����',10000,TO_DATE('2022/07/29 15:10','yyyy/mm/dd hh24:mi'),120,1);
insert into schedule values(4, '�����',10000,TO_DATE('2022/07/29 20:50','yyyy/mm/dd hh24:mi'),120,1);
insert into schedule values(5, '�����',10000,TO_DATE('2022/07/29 21:50','yyyy/mm/dd hh24:mi'),120,1);

insert into schedule values(6, '���̾��',10002,TO_DATE('2022/08/01 11:50','yyyy/mm/dd hh24:mi'),120,2);
insert into schedule values(7, '���̾��',10002,TO_DATE('2022/08/01 14:50','yyyy/mm/dd hh24:mi'),120,2);
insert into schedule values(8, '���̾��',10002,TO_DATE('2022/08/01 17:00','yyyy/mm/dd hh24:mi'),120,2);
insert into schedule values(9, '���̾��',10002,TO_DATE('2022/08/01 20:50','yyyy/mm/dd hh24:mi'),120,2);

insert into schedule values(10, '������',10001,TO_DATE('2022/07/29 09:50','yyyy/mm/dd hh24:mi'),120,3);
insert into schedule values(11, '������',10001,TO_DATE('2022/07/29 12:30','yyyy/mm/dd hh24:mi'),120,3);
insert into schedule values(12, '������',10001,TO_DATE('2022/07/29 15:50','yyyy/mm/dd hh24:mi'),120,3);
insert into schedule values(13, '������',10001,TO_DATE('2022/07/29 18:00','yyyy/mm/dd hh24:mi'),120,3);
insert into schedule values(14, '������',10001,TO_DATE('2022/07/29 21:30','yyyy/mm/dd hh24:mi'),120,3);

insert into schedule values(15, '�ܿ�ձ�2',10003,TO_DATE('2022/07/29 10:00','yyyy/mm/dd hh24:mi'),130,4);
insert into schedule values(16, '�ܿ�ձ�2',10003,TO_DATE('2022/07/29 12:40','yyyy/mm/dd hh24:mi'),130,4);
insert into schedule values(17, '�ܿ�ձ�2',10003,TO_DATE('2022/07/29 15:00','yyyy/mm/dd hh24:mi'),130,4);
insert into schedule values(18, '�ܿ�ձ�2',10003,TO_DATE('2022/07/29 18:30','yyyy/mm/dd hh24:mi'),130,4);
insert into schedule values(19, '�ܿ�ձ�2',10003,TO_DATE('2022/07/29 22:20','yyyy/mm/dd hh24:mi'),130,4);

insert into schedule values(20, '����Ʈ',10004,TO_DATE('2022/07/29 09:30','yyyy/mm/dd hh24:mi'),140,5);
insert into schedule values(21, '����Ʈ',10004,TO_DATE('2022/07/29 12:00','yyyy/mm/dd hh24:mi'),140,5);
insert into schedule values(22, '����Ʈ',10004,TO_DATE('2022/07/29 14:20','yyyy/mm/dd hh24:mi'),140,5);
insert into schedule values(23, '����Ʈ',10004,TO_DATE('2022/07/29 18:10','yyyy/mm/dd hh24:mi'),140,5);
insert into schedule values(24, '����Ʈ',10004,TO_DATE('2022/07/29 23:00','yyyy/mm/dd hh24:mi'),140,5);

insert into schedule values(25, '�ݵ�',10005,TO_DATE('2022/07/29 09:40','yyyy/mm/dd hh24:mi'),155,6);
insert into schedule values(26, '�ݵ�',10005,TO_DATE('2022/07/29 12:50','yyyy/mm/dd hh24:mi'),155,6);
insert into schedule values(27, '�ݵ�',10005,TO_DATE('2022/07/29 16:20','yyyy/mm/dd hh24:mi'),155,6);
insert into schedule values(28, '�ݵ�',10005,TO_DATE('2022/07/29 19:50','yyyy/mm/dd hh24:mi'),155,6);
insert into schedule values(29, '�ݵ�',10005,TO_DATE('2022/07/29 23:10','yyyy/mm/dd hh24:mi'),155,6);

insert into schedule values(30, '23���̵�Ƽ��',10006,TO_DATE('2022/07/29 08:10','yyyy/mm/dd hh24:mi'),150,7);
insert into schedule values(31, '23���̵�Ƽ��',10006,TO_DATE('2022/07/29 11:10','yyyy/mm/dd hh24:mi'),150,7);
insert into schedule values(32, '23���̵�Ƽ��',10006,TO_DATE('2022/07/29 15:00','yyyy/mm/dd hh24:mi'),150,7);
insert into schedule values(33, '23���̵�Ƽ��',10006,TO_DATE('2022/07/29 18:30','yyyy/mm/dd hh24:mi'),150,7);
insert into schedule values(34, '23���̵�Ƽ��',10006,TO_DATE('2022/07/29 23:00','yyyy/mm/dd hh24:mi'),150,7);



CREATE TABLE ROOM( --�󿵰�
    roomNo NUMBER primary key --�󿵰� ��ȣ
);

insert into room values(1);
insert into room values(2);
insert into room values(3);
insert into room values(4);
insert into room values(5);
insert into room values(6);
insert into room values(7);

create table DayRoom(
    roomNo number,
    schNo number,
    seatCnt number default 0,
    CONSTRAINT FK_roomNo foreign key(roomNo) REFERENCES room(roomNo)
);

insert into Dayroom values(1,1,0);
insert into Dayroom values(1,2,0);
insert into Dayroom values(1,3,0);
insert into Dayroom values(1,4,0);
insert into Dayroom values(1,5,0);

insert into Dayroom values(2,6,0);
insert into Dayroom values(2,7,0);
insert into Dayroom values(2,8,0);
insert into Dayroom values(2,9,0);

insert into Dayroom values(3,10,0);
insert into Dayroom values(3,11,0);
insert into Dayroom values(3,12,0);
insert into Dayroom values(3,13,0);
insert into Dayroom values(3,14,0);

insert into Dayroom values(4,15,0);
insert into Dayroom values(4,16,0);
insert into Dayroom values(4,17,0);
insert into Dayroom values(4,18,0);
insert into Dayroom values(4,19,0);

insert into Dayroom values(5,20,0);
insert into Dayroom values(5,21,0);
insert into Dayroom values(5,22,0);
insert into Dayroom values(5,23,0);
insert into Dayroom values(5,24,0);

insert into Dayroom values(6,25,0);
insert into Dayroom values(6,26,0);
insert into Dayroom values(6,27,0);
insert into Dayroom values(6,28,0);
insert into Dayroom values(6,29,0);

insert into Dayroom values(7,30,0);
insert into Dayroom values(7,31,0);
insert into Dayroom values(7,32,0);
insert into Dayroom values(7,33,0);
insert into Dayroom values(7,34,0);


CREATE TABLE TICKET(
	ticketNo NUMBER PRIMARY KEY, --Ƽ�� ��ȣ
	movieName varchar2(20), -- ��ȭ �̸�
	bookDate DATE, -- ���ϴ� ��¥
	schNo NUMBER, --������ ��ȣ
	roomNo number, --�󿵰�
	seatNo NUMBER, --���� ������ �¼� ��ȣ
	id VARCHAR2(20) --ȸ�����̵�
);
create table reviews(
    num number(8) default 0,
    id varchar2(20),
    content varchar2(200),
    movieNo number(8),
    writedate Date
);


commit;


SELECT * FROM member;
SELECT * FROM dayroom;
SELECT * FROM movie;
select * from room;
select * from schedule;
select * from ticket;
select * from reviews;
