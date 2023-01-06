DROP TABLE CART;

CREATE TABLE CART(
    CARTNUM NUMBER(8) PRIMARY KEY,
    IDX_FK  NUMBER(8) REFERENCES MEMBER (IDX) ON DELETE CASCADE,
    PNU_FK  NUMBER(8) REFERENCES MEMBER (PNUM) ON DELETE CASCADE,
    OQTY NUMBER(8) NOT NULL,
    INDATE DATE DEFAULT SYSDATE,
    CONSTRAINT CART_OQTY_CK CHECK (OQTY > 0 AND OQTY < 51)
    );
    
    DROP SEQUENCE CART_SEQ;
    
    CREATE SEQUENCE CART_SEQ NOCACHE;
    
-- 장바구니 사전준비
grant create view to webiting;

Create sequence CART_SEQ
START WITH 1
INCREMENT BY 1
NOCACHE;

create or replace view cartview as
select c.*,p.pname,pimage1,price, saleprice, 
point, (c.oqty*p.saleprice) totalPrice,
(c.oqty*p.point) totalPoint
from cart c
join
product p
on c.pnum_fk = p.pnum;

commit;