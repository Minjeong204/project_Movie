DROP TABLE comment_like CASCADE CONSTRAINTS;
DROP TABLE comment CASCADE CONSTRAINTS;
DROP TABLE user CASCADE CONSTRAINTS;
DROP TABLE contents_ CASCADE CONSTRAINTS;
DROP TABLE wish CASCADE CONSTRAINTS;
DROP TABLE platform CASCADE CONSTRAINTS;
DROP TABLE genre CASCADE CONSTRAINTS;

create table comment_like(
user_id varchar(20) not null primary key,
comment_id int not null 
);

CREATE TABLE comment_ (
    comment_id int NOT NULL,
    user_id varchar(20) NOT NULL,
    content_id integer NOT NULL,
    parent_comment int NOT NULL,
    comment_body VARCHAR(100) NOT NULL,
    write_date date NOT NULL,
    update_date date NOT NULL,
    comment_like int NOT NULL,
    PRIMARY KEY (comment_id)
);

CREATE TABLE user_ (
    user_id varchar(20) NOT NULL,
    pwd varchar(20) NOT NULL,
    name varchar(10) NOT NULL,
    email varchar(30) NOT NULL,
    join_date date NOT NULL,
    PRIMARY KEY (user_id)
);

DELETE FROM contents_;

DROP table CONTENTS_;

CREATE TABLE contents_ (
    content_id INTEGER NOT NULL,
    title varchar(30) NOT NULL,
    summary varchar(100) NOT NULL,
    image_path varchar(100) NOT NULL,
    view_count INTEGER NOT NULL,
    rate INTEGER NOT NULL,
    PRIMARY KEY (content_id)
);
CREATE SEQUENCE seq START WITH 1 INCREMENT BY 1 MAXVALUE 100 CYCLE NOCACHE;
insert into contents_ values(seq.nextval,'오늘','엄마가 팥죽 사온댔다','c:://user//',3,5);
insert into contents_ values(tmp_seq.nextval,'금일','엄마가 팥죽 사온댔다','c:://user//',3,5);

select * from contents_;


CREATE TABLE wish (
    user_id varchar(20) NOT NULL,
    content_id INTEGER NOT NULL,
    PRIMARY KEY (user_id, content_id)
);

CREATE TABLE platform (
    platform_name varchar2(30) NOT NULL,
    content_id integer NOT NULL,
    PRIMARY KEY (platform_name, content_id)
);

CREATE TABLE genre (
    genre_name varchar2(10) NOT NULL,
    content_id integer NOT NULL,
    PRIMARY KEY (genre_name, content_id)
);

alter table comment_ add constraint comment_fk2 foreign key (content_id) references contents_ (content_id);
alter table wish add constraint wish_fk1 foreign key (user_id) references user_ (user_id);
alter table wish add constraint wish_fk2 foreign key (content_id) references contents_ (content_id);
alter table platform add constraint platform_fk2 foreign key (content_id) references contents_ (content_id);
alter table genre add constraint genre_fk2 foreign key (content_id) references contents_ (content_id);
alter table comment_like add constraint comment_like_fk1 foreign key (user_id) references user_ (user_id);
alter table comment_like add constraint comment_like_fk2 foreign key (comment_id) references comment_ (comment_id);
    


select * from user_;
DELETE FROM contents_  WHERE content_id = 1;
DELETE FROM user_ WHERE pwd='1234';
ALTER TABLE contents_ MODIFY (genre NOT NULL);
ALTER TABLE contents_ ADD genre VARCHAR(25);
ALTER TABLE contents_ DROP COLUMN genre;
select * from comment_;