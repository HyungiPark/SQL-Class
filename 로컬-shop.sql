--create table members (memberID varchar2(16 char), memberName varchar2(24 char), memberAddress varchar2(60 char), 
--CONSTRAINT PK_MB_INFO PRIMARY KEY(memberID, memberName));

--create table products (productName varchar2(12 char), cost number(7), makeDate date, company varchar2(15 char), amount number(3),
--constraint PK_PD_INFO primary key(productName, cost))
--ALTER TABLE PRODUCTS DROP PRIMARY KEY;
--ALTER TABLE products
--ADD CONSTRAINT PK_PD_INFO
--PRIMARY KEY(productName, cost, amount); 
--select * from tab;

--insert into members(memberID, memberName, memberAddress) values('Dang', '당탕이', '경기 부천시 중동');
--insert into members(memberID, memberName, memberAddress) values('Jee', '지운이', '서울 은평구 증산동');
--insert into members(memberID, memberName, memberAddress) values('Han', '한주연', '인천 남구 주안동');
--insert into members(memberID, memberName, memberAddress) values('Sang', '상길이', '경기 성남시 분당구');

--insert into products(productName, cost, makeDate, company, amount) values(
--'컴퓨터', 10, to_date('17/01/01','YY/MM/DD'), '삼성', 17);

--insert into products(productName, cost, makeDate, company, amount) values(
--'세탁기', 20, to_date('18-09-01','YY-MM-DD'), 'LG', 3);

--insert into products(productName, cost, makeDate, company, amount) values(
--'냉장고', 5, to_date('19-02-01','YY-MM-DD'), '대우', 22);

--select * from members;
--select * from products;

--SYSTEM 계정에서 create table shop.indexTBL as select first_name, last_name, hire_date from hr.employees; --
-- indexTBL을 생성
--create index idx_indexTBL_firstname on indexTBL(first_name); -- index생성시 create index index명 on 테이블이름(칼럼명);

--select * from indexTBL where first_name='Jack';

--select * from indexTBL where last_name='Jack';

--select * from memberTBL_view;

--select count(*) from members;
--select count(*) from products;

--members 테이블에서 회원이 삭제 된 경우 삭제된 멤버의 정보를 저장할 테이블 생성--
create table deleteMemberTBL(
memberID char(8),
memberName nchar(8),
memberAddress nvarchar2(20),
deletedDate date    --삭제한 날짜
);

desc deleteMemberTBL;

--멤버가 삭제될 경우 자동으로 삭제된 멤버의 정보를 가지는 테이블에 저장하게 하는 트리거 생성--
create TRIGGER trg_deleteMemberTBL -- 트리거이름
    AFTER DELETE --삭제후에 작동하게 지정
    on members --트리거 대상 테이블
    for each row -- 각 행마다 적용됨.
BEGIN
    insert into deleteMemberTBL  -- :old 테이블의 내용을 백업 테이블에 삽입
    values(:old.memberId, :old.memberName, :old.memberAddress, SYSDATE());
END;    

delete from members where memberName='당탕이'; -- 멤버 삭제

select * from deleteMemberTBL; -- 트리거된 테이블에 데이터 추가 되어있는지 확인;
select * from members; -- 기존 회원 테이블에 정상적으로 삭제되어있는지 확인