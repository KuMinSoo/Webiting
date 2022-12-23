drop table member;
create table review(
    num number(8) primary key,
    userid varchar2(30) references member(userid),
    content varchar2(500) not null,
    score number(1) not null,
    filename varchar2(100) default 'noimage.png',
    wdate date default sysdate,
    pnum_fk number(8) references product(pnum)
);

drop sequence review_seq;
create sequence review_seq nocache;

SELECT * FROM MEMBER;

CREATE TABLE MEMBER (
	idx NUMBER(8) NOT NULL,
	name VARCHAR2(30) NULL,
	userid VARCHAR2(20) NOT NULL, 
	pwd VARCHAR2(16) NULL,
	hp1 CHAR(3) NULL,
	hp2 CHAR(4) NULL,
	hp3 CHAR(4) NULL,
	post CHAR(5) NULL,
	addr1 VARCHAR2(100) NULL,
	addr2 VARCHAR2(100) NULL,
	indate DATE NULL,
	mileage NUMBER(8) NULL,
	status NUMBER(2) NULL,
	CONSTRAINT USERID_UK UNIQUE (USERID)
);

create sequence member_seq nocache;