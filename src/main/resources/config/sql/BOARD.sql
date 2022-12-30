drop table board;

create table board(
    num number(8) primary key,
    name varchar2(30) not null,
    passwd varchar2(30) not null,
    subject varchar2(200),
    content varchar2(2000),
    wdate date default sysdate,
    readnum number(8) default 0,
    filename varchar2(500),
    originFilename varchar2(500),
    filesize number(8),
    refer number(8),
    lev number(8),
    sunbun number(8),
    bcg_code number(4),
    secret varchar2(8),
    constraint board_bcg_code_fk Foreign key (bcg_code)
    references board_category (bcg_code)
    
);
drop sequence board_seq;

create sequence board_seq
start with 1
increment by 1
nocache;