SELECT movieno as score_avg from reviews group by num;

SELECT movieno, score FROM reviews;

SELECT COUNT(score) FROM reviews;

SELECT * FROM reviews;

SELECT * FROM member;

select avg(score) from reviews;

select movieno, avg(score) as score_avg from reviews group by movieno;

commit;

select round(avg(score),0) from  reviews where movieNo=10000;

select * from reviews;

alter table reviews drop column score_avg;