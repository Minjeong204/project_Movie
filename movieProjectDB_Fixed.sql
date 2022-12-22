drop table schedule;
drop table movie;
drop table dayRoom;
drop table Room;
drop table ticket;
drop table member;
drop table reviews;

CREATE TABLE movie(
	movieNo number primary key, --영화 번호
	movieName VARCHAR2(20), --영화 제목
	category number, --장르
	runtime number, --120분
	img VARCHAR2(50), --이미지 파일 불러오기 위한 제목
	info VARCHAR2(200) --영화 정보
);

INSERT INTO movie VALUES(10000, '어벤저스', 01, 120, '1.jpg', '재밌다');
INSERT INTO movie VALUES(10001, '노팅힐', 02, 120, '2.jpg', '감동적이다');
INSERT INTO movie VALUES(10002, '아이언맨', 01, 120, '3.jpg', '멋있다');
INSERT INTO movie VALUES(10003, '겨울왕국2', 05, 130, '4.jpg', '재밌다');
INSERT INTO movie VALUES(10004, '엑시트', 03, 140, '5.jpg', '킬링타임');
INSERT INTO movie VALUES(10005, '반도', 04, 155, '6.jpg', '잘생겼다');
INSERT INTO movie VALUES(10006, '23아이덴티디', 04, 150, '7.jpg', '꿀잼');

CREATE TABLE MEMBER(
	id VARCHAR2(20) PRIMARY KEY, --아이디
	pw VARCHAR2(20), --비밀번호
	email VARCHAR2(50), --이메일
	tel VARCHAR2(20), --전화번호
	birth DATE --생년월일
);

insert into member values('test','1234','test@test.com','010-1234-1234','2002-05-12');

CREATE TABLE SCHEDULE( --상영관(ROOM) --관람시간 영화관이랑 연결해주는 테이블
	schNo NUMBER PRIMARY KEY, --스케줄 번호
	movieName varchar2(20),
    movieNo NUMBER, -- 영화 번호
	runDay DATE, --상영 날짜
	runtime NUMBER, --상영 시간 : 몇분짜리 영화인지
	roomNo NUMBER, -- 상영관 번호
    CONSTRAINT FK_movieNo foreign key(movieNo) REFERENCES movie(movieNo)
);

insert into schedule values(1, '어벤저스',10000,TO_DATE('2022/07/29 11:50','yyyy/mm/dd hh24:mi'),120,1);
insert into schedule values(2, '어벤저스',10000,TO_DATE('2022/07/29 13:50','yyyy/mm/dd hh24:mi'),120,1);
insert into schedule values(3, '어벤저스',10000,TO_DATE('2022/07/29 15:10','yyyy/mm/dd hh24:mi'),120,1);
insert into schedule values(4, '어벤저스',10000,TO_DATE('2022/07/29 20:50','yyyy/mm/dd hh24:mi'),120,1);
insert into schedule values(5, '어벤저스',10000,TO_DATE('2022/07/29 21:50','yyyy/mm/dd hh24:mi'),120,1);

insert into schedule values(6, '아이언맨',10002,TO_DATE('2022/08/01 11:50','yyyy/mm/dd hh24:mi'),120,2);
insert into schedule values(7, '아이언맨',10002,TO_DATE('2022/08/01 14:50','yyyy/mm/dd hh24:mi'),120,2);
insert into schedule values(8, '아이언맨',10002,TO_DATE('2022/08/01 17:00','yyyy/mm/dd hh24:mi'),120,2);
insert into schedule values(9, '아이언맨',10002,TO_DATE('2022/08/01 20:50','yyyy/mm/dd hh24:mi'),120,2);

insert into schedule values(10, '노팅힐',10001,TO_DATE('2022/07/29 09:50','yyyy/mm/dd hh24:mi'),120,3);
insert into schedule values(11, '노팅힐',10001,TO_DATE('2022/07/29 12:30','yyyy/mm/dd hh24:mi'),120,3);
insert into schedule values(12, '노팅힐',10001,TO_DATE('2022/07/29 15:50','yyyy/mm/dd hh24:mi'),120,3);
insert into schedule values(13, '노팅힐',10001,TO_DATE('2022/07/29 18:00','yyyy/mm/dd hh24:mi'),120,3);
insert into schedule values(14, '노팅힐',10001,TO_DATE('2022/07/29 21:30','yyyy/mm/dd hh24:mi'),120,3);

insert into schedule values(15, '겨울왕국2',10003,TO_DATE('2022/07/29 10:00','yyyy/mm/dd hh24:mi'),130,4);
insert into schedule values(16, '겨울왕국2',10003,TO_DATE('2022/07/29 12:40','yyyy/mm/dd hh24:mi'),130,4);
insert into schedule values(17, '겨울왕국2',10003,TO_DATE('2022/07/29 15:00','yyyy/mm/dd hh24:mi'),130,4);
insert into schedule values(18, '겨울왕국2',10003,TO_DATE('2022/07/29 18:30','yyyy/mm/dd hh24:mi'),130,4);
insert into schedule values(19, '겨울왕국2',10003,TO_DATE('2022/07/29 22:20','yyyy/mm/dd hh24:mi'),130,4);

insert into schedule values(20, '엑시트',10004,TO_DATE('2022/07/29 09:30','yyyy/mm/dd hh24:mi'),140,5);
insert into schedule values(21, '엑시트',10004,TO_DATE('2022/07/29 12:00','yyyy/mm/dd hh24:mi'),140,5);
insert into schedule values(22, '엑시트',10004,TO_DATE('2022/07/29 14:20','yyyy/mm/dd hh24:mi'),140,5);
insert into schedule values(23, '엑시트',10004,TO_DATE('2022/07/29 18:10','yyyy/mm/dd hh24:mi'),140,5);
insert into schedule values(24, '엑시트',10004,TO_DATE('2022/07/29 23:00','yyyy/mm/dd hh24:mi'),140,5);

insert into schedule values(25, '반도',10005,TO_DATE('2022/07/29 09:40','yyyy/mm/dd hh24:mi'),155,6);
insert into schedule values(26, '반도',10005,TO_DATE('2022/07/29 12:50','yyyy/mm/dd hh24:mi'),155,6);
insert into schedule values(27, '반도',10005,TO_DATE('2022/07/29 16:20','yyyy/mm/dd hh24:mi'),155,6);
insert into schedule values(28, '반도',10005,TO_DATE('2022/07/29 19:50','yyyy/mm/dd hh24:mi'),155,6);
insert into schedule values(29, '반도',10005,TO_DATE('2022/07/29 23:10','yyyy/mm/dd hh24:mi'),155,6);

insert into schedule values(30, '23아이덴티디',10006,TO_DATE('2022/07/29 08:10','yyyy/mm/dd hh24:mi'),150,7);
insert into schedule values(31, '23아이덴티디',10006,TO_DATE('2022/07/29 11:10','yyyy/mm/dd hh24:mi'),150,7);
insert into schedule values(32, '23아이덴티디',10006,TO_DATE('2022/07/29 15:00','yyyy/mm/dd hh24:mi'),150,7);
insert into schedule values(33, '23아이덴티디',10006,TO_DATE('2022/07/29 18:30','yyyy/mm/dd hh24:mi'),150,7);
insert into schedule values(34, '23아이덴티디',10006,TO_DATE('2022/07/29 23:00','yyyy/mm/dd hh24:mi'),150,7);



CREATE TABLE ROOM( --상영관
    roomNo NUMBER primary key --상영관 번호
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
	ticketNo NUMBER PRIMARY KEY, --티켓 번호
	movieName varchar2(20), -- 영화 이름
	bookDate DATE, -- 상영하는 날짜
	schNo NUMBER, --스케줄 번호
	roomNo number, --상영관
	seatNo NUMBER, --내가 선택한 좌석 번호
	id VARCHAR2(20) --회원아이디
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
