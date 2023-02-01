SELECT * FROM emp100;
	update emp100
		set ename = '홍길동',
			job = '과장',
			sal = 6000
		where empno = 7369;
	delete emp100
	where empno = 1003;