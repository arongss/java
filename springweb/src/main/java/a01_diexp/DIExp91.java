package a01_diexp;

import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

import a01_diexp.z06_vo.Mart;
import a01_diexp.z06_vo.Product;

public class DIExp91 {
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		// 컨테이너 객체 호출 처리
		String path = "a01_diexp\\di91.xml";
		AbstractApplicationContext 
			ctx = new GenericXmlApplicationContext(path);
		// DL(dependency lookup)으로 id명으로 객체를 찾아서 가져온다.
		Product product = ctx.getBean("product", Product.class);
		System.out.println("컨테이너의 객체호출:"+product);
		product.setName("사과");
		product.setPrice(3000);
		product.setCnt(3);
		Mart mart = ctx.getBean("mart", Mart.class);
		System.out.println("컨테이너의 객체호출:"+mart);
		mart.setMname("행복마트");
		mart.buyList();
		System.out.println("종료");
		ctx.close();
		// di10.xml
		// <bean id="obj" class="java.lang.Object"/>
		// 
	}
}
