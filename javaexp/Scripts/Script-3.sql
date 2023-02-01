		create table emp100
		as select * from emp;
		alter table emp100
		modify (
			job varchar2(50),
			ename varchar2(50),
			empno number(4) primary key
		);
--		sequence 만들기(primary key 설정)
		create sequence emp100_seq
			start with 1000
			minvalue 1000
			maxvalue 9999;
		insert into emp100 values(emp100_seq.nextval,'홍길동','사원',7800,
			to_date('2022/01/01','YYYY/MM/DD'), 3500, 100, 10);
SELECT * FROM emp100;