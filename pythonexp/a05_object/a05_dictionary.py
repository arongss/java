'''
Created on 2022. 12. 27.

@author: SAMSUNG

# 딕셔너리 데이터 선언.
1. 단언 의미 그대로 영어사전과 같은 구조를 가진다.
2. 딕션너리는 2개의 쌍이 하나로 묶이는 자료구조를 의미한다.
3. 딕션너리는 중괄호{}로 묶여 있다.
4. key와 value의 쌍으로 이루어진다.
    {key:value, ...}
    ex) person = {'name':'홍길동', 'age':25, 'loc':'서울강낭'}
    key는 중복되지 않게 처리한다. 만약 중복된 내용이 선언되면, 최종적으로
    변경하거나 할당한 데이터를 기준으로 처리된다.
'''
myDict = {100:"홍길동",101:"김길동",102:"신길동"}
print(myDict)
# ex) 부서 번호와 부서명을 dictionary 형태로 할당하고 출력하세요.
dept = {10:"인사",20:"재무",30:"회계",40:"총무"}
print(dept)
'''
# 딕셔너리 데이터 가져오기, 추가하기, 변경하기, 삭제하기
1. 가져오기
    딕셔너리명[키] : 해당 딕션너리데이터에 할당되어 있는 값을 가져온다.
    myDict[100] ==> "홍길동"
    반복문과 활용
    ex) for key in myDict:
            print(key, myDict[key])
2. 추가하기/변경하기
    1) 키라는 개념이 있어서 해당 키가 없을 때는 추가가 되고, 해당 키가 있을 때는 
        기존 값을 대체한다.
    2) 추가하기
        딕션너리명[새로운키] = 데이터
        emp[103] = "오길동"
    3) 변경하기
        딕션너리명[기존키] = 변경데이터
        emp[100] = "하길동"   홍길동에서 하길동으로 변경
3. 삭제
    del(딕션너리명[키]) : 해당 딕션너리의 키/값을 삭제
    del(딕션너리명) : 해당 딕션너리 전체 삭제
'''
print("사번이 100인데이터의 값:", myDict[100])
for empno in myDict:
    print(empno, myDict[empno])
# 추가
myDict[103] = "오길동"
print("# 추가 후 #")
for empno in myDict:
    print(empno, myDict[empno])
myDict[100] = '하길동'
print("# 수정 수 #")
for empno in myDict:
    print(empno, myDict[empno])
del(myDict[101]); print("삭제후"); print(myDict)
del(myDict); print("전체 삭제후"); # 에러발생 print(myDict==None)
# ex) 부서정보 전체 출력, 등록, 추가, 삭제 처리하고 부서정보를 출력하세요.
for deptno in dept:
    print(deptno, dept[deptno])
dept[50]="기획"; print("추가후:", dept)
dept[10]="정보"; print("수정후:", dept)
del(dept[20]); print("삭제후:", dept)
'''
# set
1. 중복을 제거하는 key값만 저장하는 데이터 구조체
2. 순서확보를 하지 못 한다.
'''
set01 = {'홍길동','김길동','마길동','김길동'}
set02 = {3000,1000,2000,1000}
print(type(set01),set01)
print(type(set02),set02)