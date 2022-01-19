create table temp(i number, x number, m varchar2(15));

--프로시저 (함수)
--DECLARE
--    x NUMBER := 100;
--    BEGIN
--        FOR i IN 1..10 LOOP
--           IF MOD(i,2) = 0 THEN  
--                    INSERT INTO TEMP VALUES(i,x,'i is even');
--                ELSE
--                    insert into temp values(i,x,'i is odd');
--           END IF;
--            x := x+100;
--        END LOOP;
--    END;

select * from temp;
