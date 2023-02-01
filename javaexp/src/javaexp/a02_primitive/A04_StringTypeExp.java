package javaexp.a02_primitive;

public class A04_StringTypeExp {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		/*내가쓴거
		System.out.println("물건명:"+args[0]);
		System.out.println("가격:"+args[1]);
		System.out.println("갯수:"+args[2]);
		String num01 = args[1];
		String num02 = args[2];
		System.out.println("총비용"+Integer.parseInt(num01)*Integer.parseInt(num02));
		*/
		
		// ex) args A04_StringTypeExp.java
		//  args로 물건명 가격 갯수를 매개변수로 입력 받아.
		//  가격 갯수를 형변환 처리하여 총비용을 출력하세요.
		// java A04_StringTypeExp 오렌지	2000	5
		// java A04_StringTypeExp args[0] args[1] args[2]
		
		//정답
		System.out.println("# 물건 구매 처리 #");
		String pname = args[0]; //물건명 데이터 입력
		int price = Integer.parseInt(args[1]);
		int cnt = Integer.parseInt(args[2]);
		System.out.println("물건명:"+pname);
		System.out.println("가격:"+price);
		System.out.println("갯수:"+cnt);
		System.out.println("총계:"+price*cnt);
		
		
	}

}
