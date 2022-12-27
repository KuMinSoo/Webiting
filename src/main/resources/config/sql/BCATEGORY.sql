drop table board_category;

create table board_category(
    bcg_code number(8) primary key,
    bcg_name varchar(40)
);
insert into board_category(bcg_code, bcg_name) values(1,'회원정보');
insert into board_category(bcg_code, bcg_name) values(2,'주문/결제');
insert into board_category(bcg_code, bcg_name) values(3,'취소/환불');
insert into board_category(bcg_code, bcg_name) values(4,'배송관련');
insert into board_category(bcg_code, bcg_name) values(5,'시스템오류');
insert into board_category(bcg_code, bcg_name) values(6,'기타문의');
select * from board_category;

