--create table members (memberID varchar2(16 char), memberName varchar2(24 char), memberAddress varchar2(60 char), 
--CONSTRAINT PK_MB_INFO PRIMARY KEY(memberID, memberName));

--create table products (productName varchar2(12 char), cost number(7), makeDate date, company varchar2(15 char), amount number(3),
--constraint PK_PD_INFO primary key(productName, cost))
--ALTER TABLE PRODUCTS DROP PRIMARY KEY;
--ALTER TABLE products
--ADD CONSTRAINT PK_PD_INFO
--PRIMARY KEY(productName, cost, amount); 
--select * from tab;

--insert into members(memberID, memberName, memberAddress) values('Dang', '������', '��� ��õ�� �ߵ�');
--insert into members(memberID, memberName, memberAddress) values('Jee', '������', '���� ���� ���굿');
--insert into members(memberID, memberName, memberAddress) values('Han', '���ֿ�', '��õ ���� �־ȵ�');
--insert into members(memberID, memberName, memberAddress) values('Sang', '�����', '��� ������ �д籸');

--insert into products(productName, cost, makeDate, company, amount) values(
--'��ǻ��', 10, to_date('17/01/01','YY/MM/DD'), '�Ｚ', 17);

--insert into products(productName, cost, makeDate, company, amount) values(
--'��Ź��', 20, to_date('18-09-01','YY-MM-DD'), 'LG', 3);

--insert into products(productName, cost, makeDate, company, amount) values(
--'�����', 5, to_date('19-02-01','YY-MM-DD'), '���', 22);

--select * from members;
--select * from products;

--SYSTEM �������� create table shop.indexTBL as select first_name, last_name, hire_date from hr.employees; --
-- indexTBL�� ����
--create index idx_indexTBL_firstname on indexTBL(first_name); -- index������ create index index�� on ���̺��̸�(Į����);

--select * from indexTBL where first_name='Jack';

--select * from indexTBL where last_name='Jack';

--select * from memberTBL_view;

--select count(*) from members;
--select count(*) from products;

--members ���̺��� ȸ���� ���� �� ��� ������ ����� ������ ������ ���̺� ����--
create table deleteMemberTBL(
memberID char(8),
memberName nchar(8),
memberAddress nvarchar2(20),
deletedDate date    --������ ��¥
);

desc deleteMemberTBL;

--����� ������ ��� �ڵ����� ������ ����� ������ ������ ���̺� �����ϰ� �ϴ� Ʈ���� ����--
create TRIGGER trg_deleteMemberTBL -- Ʈ�����̸�
    AFTER DELETE --�����Ŀ� �۵��ϰ� ����
    on members --Ʈ���� ��� ���̺�
    for each row -- �� �ึ�� �����.
BEGIN
    insert into deleteMemberTBL  -- :old ���̺��� ������ ��� ���̺� ����
    values(:old.memberId, :old.memberName, :old.memberAddress, SYSDATE());
END;    

delete from members where memberName='������'; -- ��� ����

select * from deleteMemberTBL; -- Ʈ���ŵ� ���̺� ������ �߰� �Ǿ��ִ��� Ȯ��;
select * from members; -- ���� ȸ�� ���̺� ���������� �����Ǿ��ִ��� Ȯ��