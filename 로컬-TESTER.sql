--����Ʈ ���ֹ� ���(Residents) ���̺�--
--create table Residents (ResidentsName nvarchar2(20),
--ResidentsHome nvarchar2(20), PhoneNumber nvarchar2(20),
--inDate date, constraint PK_RD primary key(ResidentsName,ResidentsHome));
--Residents ������ ����--
--insert into Residents(ResidentsName, ResidentsHome, PhoneNumber, inDate) values('�ھ�', '101�� 1101ȣ', '010-1111-1111', to_date(sysdate,'yyyy-mm-dd'));
--insert into Residents(ResidentsName, ResidentsHome, PhoneNumber, inDate) values('�̾�', '101�� 1010ȣ', '010-2222-2222', to_date(sysdate,'yyyy-mm-dd'));
--insert into Residents(ResidentsName, ResidentsHome, PhoneNumber, inDate) values('�达', '101�� 1110ȣ', '010-3333-3333', to_date(sysdate,'yyyy-mm-dd'));
--insert into Residents(ResidentsName, ResidentsHome, PhoneNumber, inDate) values('����', '102�� 1207ȣ', '010-4444-4444', to_date(sysdate,'yyyy-mm-dd'));
--insert into Residents(ResidentsName, ResidentsHome, PhoneNumber, inDate) values('�־�', '102�� 1220ȣ', '010-5555-5555', to_date(sysdate,'yyyy-mm-dd'));
--insert into Residents(ResidentsName, ResidentsHome, PhoneNumber, inDate) values('����', '102�� 1201ȣ', '010-6666-6666', to_date(sysdate,'yyyy-mm-dd'));
--insert into Residents(ResidentsName, ResidentsHome, PhoneNumber, inDate) values('�徾', '103�� 1301ȣ', '010-7777-7777', to_date(sysdate,'yyyy-mm-dd'));
--insert into Residents(ResidentsName, ResidentsHome, PhoneNumber, inDate) values('����', '103�� 1309ȣ', '010-8888-8888', to_date(sysdate,'yyyy-mm-dd'));
--insert into Residents(ResidentsName, ResidentsHome, PhoneNumber, inDate) values('�ξ�', '103�� 1315ȣ', '010-9999-9999', to_date(sysdate,'yyyy-mm-dd'));

--���� ��� ���̺�--
--create table CarList (ResidentsName nvarchar2(20),
--ResidentsHome nvarchar2(20), CarNumber nvarchar2(20), 
--constraint PK_CAR_NUMBER primary key(CarNumber));

--����Ʈ ���ֹ� ���(Residents)���� �⺻Ű�� �����ϴ� �ܷ�Ű ����/�⺻Ű ������ �ܷ�Ű�� ���� ����
--alter table CarList add constraint FK_RD FOREIGN key(ResidentsName,ResidentsHome)
--REFERENCES Residents(ResidentsName,ResidentsHome) on DELETE CASCADE;

--CarList ������ ����--
--insert into CarList(ResidentsName, ResidentsHome, CarNumber) values('�ھ�', '101�� 1101ȣ','9999');
--insert into CarList(ResidentsName, ResidentsHome, CarNumber) values('�̾�', '101�� 1010ȣ','8888');
--insert into CarList(ResidentsName, ResidentsHome, CarNumber) values('�达', '101�� 1110ȣ','7777');
--insert into CarList(ResidentsName, ResidentsHome, CarNumber) values('����', '102�� 1207ȣ','6666');
--insert into CarList(ResidentsName, ResidentsHome, CarNumber) values('�־�', '102�� 1220ȣ','5555');
--insert into CarList(ResidentsName, ResidentsHome, CarNumber) values('����', '102�� 1201ȣ','4444');
--insert into CarList(ResidentsName, ResidentsHome, CarNumber) values('�徾', '103�� 1301ȣ','3333');
--insert into CarList(ResidentsName, ResidentsHome, CarNumber) values('����', '103�� 1309ȣ','2222');
--insert into CarList(ResidentsName, ResidentsHome, CarNumber) values('�ξ�', '103�� 1315ȣ','1111');

--���ֹ� ������--
--create table DeletedRD(ResidentsName nvarchar2(20),
--ResidentsHome nvarchar2(20), outDate date);

--���ֹ� ����� �����ܿ� �߰��ǵ��� Ʈ���� ����
--create TRIGGER deleteTRG
--after delete on Residents
--for each row
--begin
--    insert into DeletedRD(ResidentsName, ResidentsHome, outDate)
--    values(:old.ResidentsName, :old.ResidentsHome, to_date(sysdate,'yyyy-mm-dd'));
--end;

--����N�� ���̺� ParkNum �⺻Ű �������ϴ� ������ n������ �������� ��ȣ�� 1~20���� ���������� 1���� 1���� �־ 2������ ���� ��ȣ�� �ֱ⶧���� �⺻Ű��������--
--create table NFloor (FloorNum number, ParkNum number(2), CarNumber nvarchar2(20), ParkingStatus number(2), ParkDate date,
--constraint FK_NK FOREIGN key(CarNumber) REFERENCES CarList(CarNumber));
--�⺻Ű(�θ����̺�)�� ���� �Ǹ� �ڽ����̺��� �ܷ�Ű���� ���� ����

--insert into NFloor (FloorNum, ParkNum, CarNumber, ParkingStatus, ParkDate) values(1, 1,'9999',0,to_date(sysdate,'yy.mm.dd'));
--insert into NFloor (FloorNum, ParkNum, ParkingStatus) values(1,2,1);
--insert into NFloor (FloorNum, ParkNum, ParkingStatus) values(1,3,1);
--insert into NFloor (FloorNum, ParkNum, ParkingStatus) values(1,4,1);
--insert into NFloor (FloorNum, ParkNum, ParkingStatus) values(1,5,1);
--insert into NFloor (FloorNum, ParkNum, ParkingStatus) values(1,6,1);
--insert into NFloor (FloorNum, ParkNum, CarNumber, ParkingStatus, ParkDate) values(1, 7,'8888',0,to_date(sysdate,'yy.mm.dd'));
--insert into NFloor (FloorNum, ParkNum, ParkingStatus) values(1,8,1);
--insert into NFloor (FloorNum, ParkNum, ParkingStatus) values(1,9,1);
--insert into NFloor (FloorNum, ParkNum, CarNumber, ParkingStatus, ParkDate) values(1, 10,'7777',0,to_date(sysdate,'yy.mm.dd'));
--
--insert into NFloor (FloorNum, ParkNum, ParkingStatus) values(2,1,1);
--insert into NFloor (FloorNum, ParkNum, ParkingStatus) values(2,2,1);
--insert into NFloor (FloorNum, ParkNum, CarNumber, ParkingStatus, ParkDate) values(2, 3,'6666',0,to_date(sysdate,'yy.mm.dd'));
--insert into NFloor (FloorNum, ParkNum, ParkingStatus) values(2,4,1);
--insert into NFloor (FloorNum, ParkNum, CarNumber, ParkingStatus, ParkDate) values(2, 5,'5555',0,to_date(sysdate,'yy.mm.dd'));
--insert into NFloor (FloorNum, ParkNum, ParkingStatus) values(2,6,1);
--insert into NFloor (FloorNum, ParkNum, ParkingStatus) values(2,7,1);
--insert into NFloor (FloorNum, ParkNum, ParkingStatus) values(2,8,1);
--insert into NFloor (FloorNum, ParkNum, ParkingStatus) values(2,9,1);
--insert into NFloor (FloorNum, ParkNum, CarNumber, ParkingStatus, ParkDate) values(2, 10,'4444',0,to_date(sysdate,'yy.mm.dd'));
--
--insert into NFloor (FloorNum, ParkNum, CarNumber, ParkingStatus, ParkDate) values(3, 1,'3333',0,to_date(sysdate,'yy.mm.dd'));
--insert into NFloor (FloorNum, ParkNum, CarNumber, ParkingStatus, ParkDate) values(3, 2,'2222',0,to_date(sysdate,'yy.mm.dd'));
--insert into NFloor (FloorNum, ParkNum, ParkingStatus) values(3,3,1);
--insert into NFloor (FloorNum, ParkNum, ParkingStatus) values(3,4,1);
--insert into NFloor (FloorNum, ParkNum, ParkingStatus) values(3,5,1);
--insert into NFloor (FloorNum, ParkNum, ParkingStatus) values(3,6,1);
--insert into NFloor (FloorNum, ParkNum, CarNumber, ParkingStatus, ParkDate) values(3, 7,'1111',0,to_date(sysdate,'yy.mm.dd'));
--insert into NFloor (FloorNum, ParkNum, ParkingStatus) values(3,8,1);
--insert into NFloor (FloorNum, ParkNum, ParkingStatus) values(3,9,1);
--insert into NFloor (FloorNum, ParkNum, ParkingStatus) values(3,10,1);

--������ ��Ȳ<<��>>
--��������(�⺻Ű)
--(����1�� 2�� 3��)
--���� Ȯ��(1���� 20���� ���ϸ� 20�� �� �������̸� 0 �ƴϸ� 1)

--�� �������� sysdba �������� ����--
--conn /as sysdba
--Connected.
--grant create view to tester; --�� ��������
--grant create procedure to tester; -- ���ν��� ���� ����

create or replace view ParkingArea AS
select FloorNum,count(*) as "���� ����"
from NFloor 
where ParkingStatus =1
GROUP by FloorNum;

select * from ParkingArea;

select * from residents;

select * from carlist;

select * from deletedrd;

select * from NFloor order by floornum;

delete from residents where residentsname='����';