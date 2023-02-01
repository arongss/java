'''
Created on 2022. 12. 26.

@author: SAMSUNG
# 객체형 리스트 처리
1. class 형태로 구조화된 내용을 list에 할당하여 다중의 객체형
    리스트를 만드는 것이다.
2. 처리순서
    1) 구성할 class 선언
    2) list선언으로 객체를 생성하면서 할당하기
    3) for문을 통해서 해당 단위 객체 가져와서 처리하기.
'''
class Product:
    def __init__(self, name, price):
        self.name = name
        self.price = price 
    def buy(self, cnt):
        self.cnt = cnt 
        print(self.name, end="\t")
        print(self.price, end="\t")
        print(self.cnt, end="\t")
        return self.price*self.cnt
import random as r
buyList = []
buyList.append(Product("사과",3000))
buyList.append(Product("바나나",4000))
buyList.append(Product("딸기",12000))
tot = 0
for prod in buyList:
    sum=prod.buy(r.randrange(1,6))
    print(sum)
    tot+=sum
print("총비용:",tot)
# ex) Student 클래스를 만들고, 이름, 국어, 영어, 수학 점수를
# 필드로 선언하고, showRecord() 메서드를 통해서 출력하고 평균점수를
# 리턴하여 출력하게 하세요. 위 내용을 list에 할당하고, 학생 3명을
# 할당하고 출력하되, 전체 평균을 출력하세요.
class Student:
    def __init__(self,name,kor,eng,math):
        self.name=name
        self.kor=kor
        self.eng=eng
        self.math=math
    def showRecord(self):
        print(self.name,end="\t")   
        print(self.kor,end="\t") 
        print(self.eng,end="\t") 
        print(self.math,end="\t")     
        tot = self.kor+self.eng+self.math
        return tot/3
stdList = []
stdList.append(Student("홍길동",50,70,90))
stdList.append(Student("신길동",60,80,70))
stdList.append(Student("김길동",70,90,80))
avgTot = 0
for std in stdList:
    avg = std.showRecord()
    print(int(avg))
    avgTot+=avg
print("전과목 전체 평균:",int(avgTot/len(stdList)))