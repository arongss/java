package javaexp.a07_access.a02_woodhome;

// WoodCutter의 상속 관걔 클래스
public class Daughter extends WoodCutter {
	public void callWoodCutter() {
//		private이외에는 접근이 가능하다.(상속관계)
//		System.out.println("private:"+privSec);
		System.out.println("default:"+payOurHome);
		System.out.println("protected:"+inheritMoney);
		System.out.println("public:"+announce);
	}
}
