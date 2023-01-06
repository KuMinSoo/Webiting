-- 주문상품
ALTER TABLE ORDER_PRODUCT
	DROP CONSTRAINT FK_ORDER_DESC_TO_ORDER_PRODUCT; -- 주문개요 -> 주문상품

-- 주문상품
ALTER TABLE ORDER_PRODUCT
	DROP CONSTRAINT FK_PRODUCT_TO_ORDER_PRODUCT; -- 상품 -> 주문상품

-- 주문상품
ALTER TABLE ORDER_PRODUCT
	DROP CONSTRAINT PK_ORDER_PRODUCT; -- 주문상품 기본키

-- 주문상품
DROP TABLE ORDER_PRODUCT;

-- 주문상품
CREATE TABLE ORDER_PRODUCT (
	ONUM      VARCHAR2(30)  NOT NULL, -- 주문번호
	PNUM      NUMBER(8)     NOT NULL, -- 상품번호
	IDX       NUMBER(8)     NULL,     -- 회원번호
	PNAME     VARCHAR2(50)  NULL,     -- 상품명
	SALEPRICE NUMBER(10)    NULL,     -- 단가
	OQTY      NUMBER(8)     NULL,     -- 수량
	PIMAGE    VARCHAR2(100) NULL,     --  이미지1
	OPOINT    NUMBER(8)     NULL      -- 포인트
);

-- 주문상품 기본키
CREATE UNIQUE INDEX PK_ORDER_PRODUCT
	ON ORDER_PRODUCT ( -- 주문상품
		ONUM ASC, -- 주문번호
		PNUM ASC  -- 상품번호
	);

-- 주문상품
ALTER TABLE ORDER_PRODUCT
	ADD
		CONSTRAINT PK_ORDER_PRODUCT -- 주문상품 기본키
		PRIMARY KEY (
			ONUM, -- 주문번호
			PNUM  -- 상품번호
		);        
      
--주문 페이지 사전 준비

Create sequence ONUM_SEQ
START WITH 1
INCREMENT BY 1
NOCACHE;

commit;

create or replace view orderview as
select o.onum, o.pnum, o.idx ,c.pname, c.pimage1, c.price, c.saleprice, c.point, 
(c.oqty*c.saleprice) totalPrice, (c.oqty*c.point) totalPoint
from order_product o join cartview c
on o.pnum = c.pnum_fk;