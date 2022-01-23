--아파트 입주민 명단(Residents) 테이블--
--create table Residents (ResidentsName nvarchar2(20),
--ResidentsHome nvarchar2(20), PhoneNumber nvarchar2(20),
--inDate date, constraint PK_RD primary key(ResidentsName,ResidentsHome));
--Residents 데이터 삽입--
--insert into Residents(ResidentsName, ResidentsHome, PhoneNumber, inDate) values('박씨', '101동 1101호', '010-1111-1111', to_date(sysdate,'yyyy-mm-dd'));
--insert into Residents(ResidentsName, ResidentsHome, PhoneNumber, inDate) values('이씨', '101동 1010호', '010-2222-2222', to_date(sysdate,'yyyy-mm-dd'));
--insert into Residents(ResidentsName, ResidentsHome, PhoneNumber, inDate) values('김씨', '101동 1110호', '010-3333-3333', to_date(sysdate,'yyyy-mm-dd'));
--insert into Residents(ResidentsName, ResidentsHome, PhoneNumber, inDate) values('나씨', '102동 1207호', '010-4444-4444', to_date(sysdate,'yyyy-mm-dd'));
--insert into Residents(ResidentsName, ResidentsHome, PhoneNumber, inDate) values('최씨', '102동 1220호', '010-5555-5555', to_date(sysdate,'yyyy-mm-dd'));
--insert into Residents(ResidentsName, ResidentsHome, PhoneNumber, inDate) values('정씨', '102동 1201호', '010-6666-6666', to_date(sysdate,'yyyy-mm-dd'));
--insert into Residents(ResidentsName, ResidentsHome, PhoneNumber, inDate) values('장씨', '103동 1301호', '010-7777-7777', to_date(sysdate,'yyyy-mm-dd'));
--insert into Residents(ResidentsName, ResidentsHome, PhoneNumber, inDate) values('강씨', '103동 1309호', '010-8888-8888', to_date(sysdate,'yyyy-mm-dd'));
--insert into Residents(ResidentsName, ResidentsHome, PhoneNumber, inDate) values('민씨', '103동 1315호', '010-9999-9999', to_date(sysdate,'yyyy-mm-dd'));

--차량 명단 테이블--
--create table CarList (ResidentsName nvarchar2(20),
--ResidentsHome nvarchar2(20), CarNumber nvarchar2(20), 
--constraint PK_CAR_NUMBER primary key(CarNumber));

--아파트 입주민 명단(Residents)에서 기본키를 참조하는 외래키 생성/기본키 삭제시 외래키도 같이 삭제
--alter table CarList add constraint FK_RD FOREIGN key(ResidentsName,ResidentsHome)
--REFERENCES Residents(ResidentsName,ResidentsHome) on DELETE CASCADE;

--CarList 데이터 삽입--
--insert into CarList(ResidentsName, ResidentsHome, CarNumber) values('박씨', '101동 1101호','9999');
--insert into CarList(ResidentsName, ResidentsHome, CarNumber) values('이씨', '101동 1010호','8888');
--insert into CarList(ResidentsName, ResidentsHome, CarNumber) values('김씨', '101동 1110호','7777');
--insert into CarList(ResidentsName, ResidentsHome, CarNumber) values('나씨', '102동 1207호','6666');
--insert into CarList(ResidentsName, ResidentsHome, CarNumber) values('최씨', '102동 1220호','5555');
--insert into CarList(ResidentsName, ResidentsHome, CarNumber) values('정씨', '102동 1201호','4444');
--insert into CarList(ResidentsName, ResidentsHome, CarNumber) values('장씨', '103동 1301호','3333');
--insert into CarList(ResidentsName, ResidentsHome, CarNumber) values('강씨', '103동 1309호','2222');
--insert into CarList(ResidentsName, ResidentsHome, CarNumber) values('민씨', '103동 1315호','1111');

--입주민 전출명단--
--create table DeletedRD(ResidentsName nvarchar2(20),
--ResidentsHome nvarchar2(20), outDate date);

--입주민 전출시 전출명단에 추가되도록 트리거 생성
--create TRIGGER deleteTRG
--after delete on Residents
--for each row
--begin
--    insert into DeletedRD(ResidentsName, ResidentsHome, outDate)
--    values(:old.ResidentsName, :old.ResidentsHome, to_date(sysdate,'yyyy-mm-dd'));
--end;

--지하N층 테이블 ParkNum 기본키 설정안하는 이유는 n층마다 주차지역 번호가 1~20으로 지정했을때 1층에 1번이 있어도 2층에도 같은 번호가 있기때문에 기본키설정안함--
--create table NFloor (FloorNum number, ParkNum number(2), CarNumber nvarchar2(20), ParkingStatus number(2), ParkDate date,
--constraint FK_NK FOREIGN key(CarNumber) REFERENCES CarList(CarNumber));
--기본키(부모테이블)가 삭제 되면 자식테이블의 외래키값도 같이 삭제

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

--주차장 현황<<뷰>>
--주차층수(기본키)
--(지하1층 2층 3층)
--만차 확인(1층당 20대라고 정하면 20대 다 주차중이면 0 아니면 1)

--뷰 생성전에 sysdba 계정으로 접속--
--conn /as sysdba
--Connected.
--grant create view to tester; --뷰 생성권한
--grant create procedure to tester; -- 프로시저 생성 권한

create or replace view ParkingArea AS
select FloorNum,count(*) as "주차 가능"
from NFloor 
where ParkingStatus =1
GROUP by FloorNum;

select * from ParkingArea;

select * from residents;

select * from carlist;

select * from deletedrd;

select * from NFloor order by floornum;

delete from residents where residentsname='정씨';