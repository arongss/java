package javaexp.z01_homework;

import java.util.ArrayList;

public class A12_0914 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		/*
		0914과제 - 신아령
[1단계:개념] 1. (연습이 필요한 분)1:1관계 설정 연습 - 연필/종이, TV/리모콘, 어머니/자식, 스포츠팀/감독
[1단계:개념] 2. 데이터의 처리 단계별 내용을 예제와 함께 기술하세요. 기본유형 ~~~  1:다 객체형까지.. 
# 자바의 데이터 처리 단계
1. bit
	0/1
2. byte : bit 8개 모여 데이터의 기본 유형 시작
   char : 문자단위
   ..
   기본 데이터 유형
   int num01 = 25;
   char ch01 = 'a';
   정수, 실수, 문자, boolean
3. 배열형 데이터
	1) 같은 기본데이터 유형이 모여서 데이터 처리
		int[] arry = {100,200,300};
		double[] arry = {1.5,1.7...};
	2) 문자열
		char[] carry = {'홍','길','동'}
		==> 데이터 유형 만들어 짐.
		String name = "홍길동"; // 문자열데이터
4. 객체형 데이터
	1) 다른 유형의 데이터를 모아서 처리
		class Person{
			String name;
			int age;
			boolean isAult;
		}
		Person p01 = new Person();
5. 배열+객체,
		Person[] p = {new Person(), new Person()....}
		List<Person> plist = new ArrayList<Person>();
6. 객체안에 배열과 객체 포함.
		class Person{
			Woman woman;
		}
		class Person{
			String[]favFoods;
			int [] prices;		
		}
7. 여러 객체를 동적처리(1:다)
		class Person{
			Food[] food;
			List<Friend> flist;
		}
[1단계:개념] 3. 정적배열과 동적배열의 차이점을 예제를 통해서 설명하세요.
		- 정적배열 : 고정된 배열안에 객체를 담는 처리. 크기가 고정되어서 추가나 삭제가 불가능하다.
		int[] arry = {1000,2000,3000};
		- 동적배열 : 데이터타입이 List, ArrayList선형 형식으로 선언된다. 크기가 동적으로 변경이 가능하다. 
		ArrayList list = new ArrayList(); 
		list.add("사과");
		list.add("바나나");
		list.add("딸기");
		for(int idx=0;idx<list.size();idx++) {
			System.out.println(idx+":"+list.get(idx));
		}
[1단계:코드] 4. 구매한 물건(물건명,가격,갯수) 3개를 클래스를 선언하고 정적배열로 선언 할당 후, 배열을 통해서 출력하세요.
		Product[] pArry = {new Product("사과",1500,1),
							new Product("바나나",1000,5),
							new Product("딸기",3000,10)
							};
		for(int idx=0;idx<pArry.length;idx++) {
			System.out.println(idx+":"+pArry[idx]);
			Product p1 = pArry[idx];
			System.out.println("물건명:"+p1.getName());
			System.out.println("가격:"+p1.getPrice());
			System.out.println("갯수:"+p1.getCnt());
		}
	}
}
class Product{
	private String name;
	private int price;
	private int cnt;
	public Product(String name, int price, int cnt) {
		this.name = name;
		this.price = price;
		this.cnt = cnt;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
}
[1단계:코드] 5. 팀(팀명,승,무,패) 3개의 클래스를 정적배열객체로 선언 for문을 통해 getXXX메서드로 출력하세요.
		Team[] tArray = {new Team("삼성",4,5,1),
				new Team("두산",5,1,3),
				new Team("한화",1,4,5)
				};
		for(int idx=0;idx<tArray.length;idx++) {
			Team t1 = tArray[idx];
			System.out.println(idx+":"+t1+":");
			System.out.println(t1.getTname()+":"+t1.getWin()+"승"+t1.getDraw()+"무"+t1.getLose()+"패");
		}
	}
}
class Team{
	private String tname;
	private int win;
	private int draw;
	private int lose;
	public Team(String tname, int win, int draw, int lose) {
		this.tname = tname;
		this.win = win;
		this.draw = draw;
		this.lose = lose;
	}
	public String getTname() {
		return tname;
	}
	public void setTname(String tname) {
		this.tname = tname;
	}
	public int getWin() {
		return win;
	}
	public void setWin(int win) {
		this.win = win;
	}
	public int getDraw() {
		return draw;
	}
	public void setDraw(int draw) {
		this.draw = draw;
	}
	public int getLose() {
		return lose;
	}
	public void setLose(int lose) {
		this.lose = lose;
	}
}
[1단계:개념] 6. 동적배열처리하는 객체 ArrayList에서 사용하는 메서드의 기능을 기본예제를 통하여 설명하세요.
		ArrayList list = new ArrayList(); 
		// .add(추가할데이터)
		list.add("사과");
		list.add("바나나");
		list.add("딸기");
		// .size(); 동적배열의 크기
		for(int idx=0;idx<list.size();idx++) {
			// list.get(인덱스)
			System.out.println(idx+":"+list.get(idx));
		}
[1단계:코드] 7. 읽어야할 도서명 5권을 ArrayList로 선언/추가하고 출력하세요.
		ArrayList books = new ArrayList();
		books.add("데미안");
		for(int idx=0;idx<books.size();idx++) {
			System.out.println("# 읽어야할 도서명 #");
			System.out.println(idx+1+":"+books.get(idx));
		}
		books.add("인간실격");
		books.add("어린왕자");
		books.add("사피엔스");
		books.add("이기적유전자");
		System.out.println("# 스테디셀러5 #");
		for(int idx=0;idx<books.size();idx++) {
			System.out.println(idx+1+":"+books.get(idx));
		}
[1단계:개념] 8. 1:다관계와 1:1관계 처리 구조의 차이점을 기술하세요.
		- 1:1관계 : 1:1 관계에 있는 현실의 요구사항에서 많이 있을 뿐아니라 실제 프로그래밍에서도 많이 발생하여 처리하여야 한다.
		- 1:다관계 : 하나의 객체안에 여러개의 객체들을 사용할 수 있는 형태의 데이터 구조 처리를 말한다.
[1단계:코드] 9. 아래의 1:다관계 동적처리 구조의 데이터를 처리하세요.
      1) 마트/구매물건 2) 도서관/빌린도서  3) 컴퓨터/구성하는부품
		Mart m1 = new Mart("홍대마트");
		m1.addProduct(new BuyProducts("사과",5));
		m1.addProduct(new BuyProducts("바나나",5));
		m1.addProduct(new BuyProducts("딸기",3));
		m1.showAllList();
		Library l1 = new Library("홍대도서관");
		l1.addProduct(new Books("소설",3));
		l1.addProduct(new Books("시",2));
		l1.showAllList();
		Computer1 c1 = new Computer1("노트북");
		c1.addProduct(new Components("키보드",10000));
		c1.addProduct(new Components("마우스",5000));
		c1.showAllList();
	}
}
//마트(마트이름,ArrayList<BuyProducts>)
class Mart{
	private String martName;
	private ArrayList<BuyProducts>mlist;
	public Mart(String martName) {
		this.martName = martName;
		this.mlist = new ArrayList<BuyProducts>();
	}
	public void addProduct(BuyProducts bp) {
		this.mlist.add(bp);
		System.out.println(bp.getPname()+" 구매!!");
	}
	public void addProductAll(ArrayList<BuyProducts> mlist) {
		this.mlist.addAll(mlist);
		System.out.println(mlist.size()+"개 구매!!");
	}
	public void showAllList() {
		System.out.println(martName+"에서 구매리스트");
		if(this.mlist.size()>0) {
			for(BuyProducts bp:this.mlist) {
				System.out.println(bp.getPname()+"\t");
				System.out.println(bp.getCnt()+"개\n");
			}
		}else {
			System.out.println("구매한 물건이 없습니다.");
		}
	}
}
//구매물건(물건명,갯수)
class BuyProducts{
	private String pname;
	private int cnt;
	public BuyProducts(String pname, int cnt) {
		this.pname = pname;
		this.cnt = cnt;
	}
	public String getPname() {
		return pname;
	}
	public void setPname(String pname) {
		this.pname = pname;
	}
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
}
//도서관(도서관명,ArrayList<Books>)
class Library{
	private String libName;
	private ArrayList<Books>blist;
	public Library(String libName) {
		this.libName = libName;
		this.blist = new ArrayList<Books>();
	}
	public void addProduct(Books bk) {
		this.blist.add(bk);
		System.out.println(bk.getKind()+" 대여!!");
	}
	public void addProductAll(ArrayList<Books> blist) {
		this.blist.addAll(blist);
		System.out.println(blist.size()+"권 대여!!");
	}
	public void showAllList() {
		System.out.println(libName+"에서 빌린책리스트");
		if(this.blist.size()>0) {
			for(Books bk:this.blist) {
				System.out.println(bk.getKind()+"\t");
				System.out.println(bk.getBcnt()+"권\n");
			}
		}else {
			System.out.println("빌린 책이 없습니다.");
		}
	}
}
//빌린도서(장르,권수)
class Books{
	private String kind;
	private int bcnt;
	public Books(String kind, int bcnt) {
		this.kind = kind;
		this.bcnt = bcnt;
	}
	public String getKind() {
		return kind;
	}
	public void setKind(String kind) {
		this.kind = kind;
	}
	public int getBcnt() {
		return bcnt;
	}
	public void setBcnt(int bcnt) {
		this.bcnt = bcnt;
	}
}
//컴퓨터(종류,ArrayList<Components>)
class Computer1{
	private String comKind;
	private ArrayList<Components>clist;
	public Computer1(String comKind) {
		this.comKind = comKind;
		this.clist = new ArrayList<Components>();
	}
	public void addProduct(Components cp) {
		this.clist.add(cp);
		System.out.println("구성부품:"+cp.getCname());
	}
	public void addProductAll(ArrayList<Components> blist) {
		this.clist.addAll(blist);
		System.out.println("구성부품:"+blist.size());
	}
	public void showAllList() {
		System.out.println(comKind+" 구성품리스트");
		if(this.clist.size()>0) {
			for(Components cp:this.clist) {
				System.out.println(cp.getCname()+"\t");
				System.out.println(cp.getPrice()+"원\n");
			}
		}else {
			System.out.println("구성부품이 없습니다.");
		}
	}
}
//구성하는부품(품명,가격)
class Components{
	private String cname;
	private int price;
	public Components(String cname, int price) {
		this.cname = cname;
		this.price = price;
	}
	public String getCname() {
		return cname;
	}
	public void setCname(String cname) {
		this.cname = cname;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
}
		 * */
		/*
		0914과제 - 정답
[1단계:코드] 9. 아래의 1:다관계 동적처리 구조의 데이터를 처리하세요.
      1) 마트/구매물건 2) 도서관/빌린도서  3) 컴퓨터/구성하는부품
 		# 처리 순서
 		1. 포함될 클래스
 			필드/get/set/출력메서드
 		2. 포함할 클래스
 			필드(고유 속성, 포함될클래스ArrayList)
 			생성자(고유 속성 초기화, ArrayList객체 생성)
 			메서드(단일 추가메서드/닺ㅇ 추가메서드/전체내용 출력내용처리)
		*/
		Mart m = new Mart("행복");
		m.calcu();
		m.addBuyList(new Product("사과",2000,2));
		m.addBuyList(new Product("바나나",4000,3));
		m.addBuyList(new Product("오렌지",1500,5));
		m.calcu();
		Library lb = new Library("서울시립도서관");
		lb.showLentList();
		lb.addLendList(new LBook("himan","기초자바","2022-10-10"));
		lb.addLendList(new LBook("higirl","jsp향상","2022-10-15"));
		lb.addLendList(new LBook("goodMan","스프링완성","2022-11-11"));
		lb.showLentList();
		Computer01 com = new Computer01("데스크탑","조립품");
		com.setPlist(new Part("CPU","인텔","i7 3.5GHz"));
		com.setPlist(new Part("Ram","하이닉스","16G"));
		com.setPlist(new Part("ssd","삼성","250G"));
		com.showPartList();
	}
}
class Computer01{
	private String kind;// 종류..
	private String comp;// 제조사
	private ArrayList<Part> plist;
	public Computer01(String kind, String comp) {
		this.kind = kind;
		this.comp = comp;
		this.plist = new ArrayList<Part>();
	}
	public void setPlist(Part p) {
		this.plist.add(p);
		System.out.println(p.getPname()+"부품 추가");
	}
	public void showPartList() {
		System.out.println("# 컴퓨터 사양 #");
		System.out.println("종류:"+kind);
		System.out.println("제조사:"+comp);
		if(plist.size()==0) {
			System.out.println("부품이 아직 없네요.");
		}else {
			System.out.println("포함된 부품 리스트");
			for(Part p:plist) {
				System.out.println(p);
			}
		}
	}
	public String getKind() {
		return kind;
	}
	public void setKind(String kind) {
		this.kind = kind;
	}
	public String getComp() {
		return comp;
	}
	public void setComp(String comp) {
		this.comp = comp;
	}
	
	
}
class Part{
	// 부품종류, 제조사, 사양
	private String pname;
	private String comp;
	private String perform;
	public Part(String pname, String comp, String perform) {
		this.pname = pname;
		this.comp = comp;
		this.perform = perform;
	}
	@Override
	public String toString() {
		return "Part [pname=" + pname + ", comp=" + comp + ", perform=" + perform + "]";
	}

	public String getPname() {
		return pname;
	}
	public void setPname(String pname) {
		this.pname = pname;
	}
	public String getComp() {
		return comp;
	}
	public void setComp(String comp) {
		this.comp = comp;
	}
	public String getPerform() {
		return perform;
	}
	public void setPerform(String perform) {
		this.perform = perform;
	}
	
}

class Library{
	private String name;
	private ArrayList<LBook> lblist;
	public Library(String name) {
		this.name = name;
		this.lblist = new ArrayList<LBook>();
	}
	public void addLendList(LBook book) {
		this.lblist.add(book);
		System.out.println(book.getLendId()+"님이 "+book.getTitle()+" 대출하였습니다.");
	}
	public void showLentList() {
		System.out.println(name+"에서 대출된 대출내역");
		if(lblist.size()>0) {
			System.out.println("번호\t대출자\t도서명\t반납일");
			for(int idx=0;idx<lblist.size();idx++) {
				LBook bk = lblist.get(idx);
				bk.lendInfo(idx+1); // 번호 리스트
			}
			System.out.println("총 "+lblist.size()+"권 대출되었습니다!!");
		}else {
			System.out.println("대출된 내역이 없습니다.");
		}
	}
}
class LBook{
	// 빌린사람, 도서명, 반납일
	private String lendId;
	private String title;
	private String endDate;
	public LBook(String lendId, String title, String endDate) {
		this.lendId = lendId;
		this.title = title;
		this.endDate = endDate;
	}
	public void lendInfo(int no) {
		System.out.print(no+"\t");
		System.out.print(lendId+"\t");
		System.out.print(title+"\t");
		System.out.print(endDate+"\n");
	}
	public String getLendId() {
		return lendId;
	}
	public void setLendId(String lendId) {
		this.lendId = lendId;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getEndDate() {
		return endDate;
	}
	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}
	
}
class Mart{
	private String mname;
	private ArrayList<Product> blist;
	public Mart(String mname) {
		this.mname = mname;
		this.blist = new ArrayList<Product>();
	}
	public void addBuyList(Product product) {
		this.blist.add(product);
		System.out.println(product.getName()+"구매목록에 담았습니다.");
	}
	public void calcu() {
		System.out.println(mname+"마트 에서 구매 및 계산서");
		if(blist.size()>0) {
			int cnt = 0;
			int tot = 0;
			System.out.println("no\t물건명\t가격\t갯수\t계");
			for(Product prod:blist) {
				System.out.print(++cnt+"\t");
				tot+=prod.buyInfo();
			}
			System.out.println("총계:"+tot);
		}else {
			System.out.println("아직 구매한 내용이 없습니다.");
		}
	}
	
}
class Product{
	private String name;
	private int price;
	private int cnt;
	public Product(String name, int price, int cnt) {
		this.name = name;
		this.price = price;
		this.cnt = cnt;
	}
	public int buyInfo() {
		System.out.print(this.name+"\t");
		System.out.print(this.price+"\t");
		System.out.print(this.cnt+"\t");
		System.out.print(this.price*this.cnt+"\n");
		return this.price*this.cnt;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	
}



