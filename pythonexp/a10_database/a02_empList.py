'''
Created on 2023. 1. 4.

@author: SAMSUNG
'''
import cx_Oracle as oci
# 1. 연결
conn = oci.connect("scott/tiger@localhost:1521/xe")
if conn != None:
    print("연결성공! 버젼:", conn.version)
# 2. 커서객체 생성
cursor = conn.cursor()
# 3. sql문 선언 및 실행
ename = input("검색할 사원명을 입력하세요(키워드):")
sql = """
select *
from emp
where ename like '%'||'{}'||'%'
""".format(ename)
cursor.execute(sql)
# 4. fetchall()을 통해서 결과값 튜플형식으로 가져오기
empDup = cursor.fetchall()
empList = []
# 5. 반복문을 통해서 출력하기.
for emp in empDup:
    empList.append(list(emp))
    # 튜플(읽기) ==> 리스트(읽기/쓰기)
    print("{}\t{}\t{}\t{}\t{}\t{}\t{}\t{}".format(emp[0],emp[1],emp[2],emp[3],emp[4],emp[5],emp[6],emp[7]))
    print(empList)
