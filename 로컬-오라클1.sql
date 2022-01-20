--create table shop.indexTBL
--as select first_name, last_name, hire_date from hr.employees;
--
--create view shop.memberTBL_view as
--select memberName, memberAddress from shop.members;

-- 스토어드 프로시저 생성
--create procedure shop.myProc as
--var1 INT;
--var2 INT;
--BEGIN
--    select count(*) into var1 from shop.members;
--    select count(*) into var2 from shop.products;
--    DBMS_OUTPUT.PUT_LINE(var1+var2);
--END;

set serveroutput on;
execute shop.myproc;