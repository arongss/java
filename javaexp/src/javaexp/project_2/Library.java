package javaexp.project_2;

import java.util.Scanner;

import javaexp.project_2.vo.Lending;
import javaexp.project_2.vo.Library_Book;
import javaexp.project_2.vo.Llist;
import javaexp.project_2.vo.Member;
import javaexp.project_2.vo.Review;
import javaexp.project_2.vo.Rlist;

public class Library {
	private static Scanner sc;
	private static Scanner sc1;

	public static void main(String[] args) {
		sc = new Scanner(System.in);
		sc1 = new Scanner(System.in);
		LoginDao dao = new LoginDao();
		String id;
		String password;
		String auth = null;
		int bnumber;
		int lbnumber;
		int rbnumber;
		int extension = 0;
		String possible = null;
		Integer charge = null;
		Integer charge1 = null;
		while (true) {
			System.out.println();
			System.out.println("------------------ 도서관메인 ------------------");
			System.out.println("1.로그인 2.이용자회원가입 3.관리자회원가입 4.회원탈퇴 0.종료");
			System.out.println("---------------------------------------------");
			System.out.print("원하는 번호를 입력하세요: ");
			int opt1 = sc.nextInt();
			sc.nextLine();
			System.out.println();
			if (opt1 == 1) { // 1.로그인
				System.out.println("# 로그인 #");
				System.out.println("아이디를 입력해주세요.");
				System.out.print("▶아이디 : ");
				id = sc.nextLine();
				System.out.println("비밀번호를 입력해주세요.");
				System.out.print("▶비밀번호 : ");
				password = sc.nextLine();
				if (dao.Login(new Member(id, password)).size() == 0) {
					System.out.println("일치하는 회원정보가 없습니다.");
				} else {
					for (Member m : dao.Login(new Member(id, password))) {
						id = m.getId();
						password = m.getPassword();
						auth = m.getAuth();
					}
					if (auth.equals("관리자")) {
						System.out.println("관리자 " + id + "님 로그인되었습니다.");
						ManagerDao mdao = new ManagerDao();
						while (true) {
							System.out.println("--------------------- 관리자메인 ---------------------");
							System.out.println("1.도서추가 2.도서삭제 3.도서목록확인 4.회원정보확인 5.연체회원확인 ");
							System.out.println("6.대출현황확인 7.대출내역확인 8.반납내역확인 9.도서신청확인 0.로그아웃");
							System.out.println("---------------------------------------------------");
							System.out.print("원하는 번호를 입력하세요: ");
							int opt2 = sc.nextInt();
							sc.nextLine();
							System.out.println();
							if (opt2 == 1) {
								mdao.RunInsertBook();
							} else if (opt2 == 2) { // 2.도서삭제
								mdao.RunDeleteBook();
							} else if (opt2 == 3) { // 3.도서목록확인
								mdao.RunBookList();
							} else if (opt2 == 4) { // 4.회원정보확인
								mdao.RunMemberList();
							} else if (opt2 == 5) { // 5.연체회원확인
								mdao.RunChargeList();
							} else if (opt2 == 6) { // 6.대출현황확인
								mdao.RunNowLendingList();
							} else if (opt2 == 7) { // 7.대출내역확인
								mdao.RunAllLList();
							} else if (opt2 == 8) { // 8.반납내역확인
								mdao.RunAllRList();
							} else if (opt2 == 9) { // 9.도서신청확인
								mdao.RunApplicationList();
							} else if (opt2 == 0) { // 0.로그아웃
								System.out.println("관리자로그아웃하고 도서관메인으로 돌아갑니다.");
								break;
							} else {
								System.out.println("잘못된 입력입니다.\n");
							}
						}
					} else if (auth.equals("이용자")) {
						System.out.println("이용자 " + id + "님 로그인되었습니다.");
						UserDao udao = new UserDao();
						Lend ldao = new Lend();
						Return rdao = new Return();
						while (true) {
							System.out.println("----------------- 이용자메인 -----------------");
							System.out.println("1.마이페이지 2.도서신청 3.도서검색 4.도서대여 5.도서반납");
							System.out.println("6.대출목록 7.반납일자 8.연장신청 9.연체료조회 10.남은기간");
							System.out.println("11.랭킹 12.도서리뷰보기 0.로그아웃");
							System.out.println("-------------------------------------------");
							System.out.print("원하는 번호를 입력하세요: ");
							int opt3 = sc.nextInt();
							sc.nextLine();
							System.out.println();
							if (opt3 == 1) { // 1.마이페이지
								System.out.println("# 마이페이지 #");
								for (Member m : udao.Mypage(new Member(id, password))) {
									System.out.println("아이디:\t" + m.getId());
									System.out.println("비밀번호:\t" + m.getPassword());
									System.out.println("이름:\t" + m.getMname());
									System.out.println("주민번호:\t" + m.getCivilNum());
									System.out.println("포인트:\t" + m.getPoint());
									System.out.println("가입일:\t" + m.getJdate());
									System.out.println("권한:\t" + m.getAuth());
								}
							} else if (opt3 == 2) { // 2.도서신청
								udao.RunInsertApplication();
							} else if (opt3 == 3) { // 3.도서검색
								udao.RunSearchBook();
							} else if (opt3 == 4) { // 4.도서대여
								System.out.println("대출을 원하는 도서의 번호를 입력해주세요.");
								System.out.print("▶도서번호 : ");
								lbnumber = sc.nextInt();
								for (Library_Book lb : ldao.PossibleCk(new Library_Book(lbnumber))) {
									possible = lb.getPossible();
								}
								if (possible.equals("가능")) {
									ldao.LendBook(new Lending(id, lbnumber));
									ldao.LendBook2(new Llist(id, lbnumber));
									ldao.LendBook3(lbnumber);
									System.out.println(id + "님이 " + lbnumber + "번 도서를 대출하였습니다.");
								} else if (possible.equals("불가능")) {
									System.out.println("현재 대출 중인 도서입니다.");
								}
							} else if (opt3 == 5) { // 5.도서반납
								System.out.println("반납을 원하는 도서의 번호를 입력해주세요.");
								System.out.print("▶도서번호 : ");
								rbnumber = sc.nextInt();
								for (Lending ld : rdao.LendingCk(new Lending(rbnumber))) {
									charge = ld.getCharge();
								}
								if (charge == null) {
									System.out.println("대여중인 도서가 없습니다.");
								} else if (charge > 0) {
									System.out.println("반납불가!! 연체료가 존재합니다.");
								} else {
									rdao.ReturnBook(rbnumber);
									rdao.ReturnBook2(new Rlist(id, rbnumber));
									rdao.ReturnBook3(rbnumber);
									System.out.println(id + "님이 " + rbnumber + "번 도서를 반납하였습니다.");
									System.out.println();
									System.out.println("## " + rbnumber + "번 도서의 리뷰를 작성하시겠습니까?");
									System.out.println("1.리뷰작성 2.리뷰작성안함");
									System.out.print("원하는 번호를 입력해주세요. :");
									int opt4 = sc.nextInt();
									sc.nextLine();
									System.out.println();
									if (opt4 == 1) {
										System.out.print("▶점수(1~5) : ");
										System.out.println();
										int score = sc.nextInt();
										System.out.print("▶리뷰 : ");
										System.out.println();
										String contents = sc1.nextLine();
										System.out.println();
										udao.InsertReview(new Review(id, rbnumber, score, contents));
										System.out.println("리뷰를 작성해주셔서 감사합니다!");
									} else if (opt4 == 2) {
										System.out.println("아쉽네요. 다음에 리뷰작성해주세요ㅠㅠ");
									}
								}
							} else if (opt3 == 6) { // 6.대출목록
								System.out.println("# 대출목록 #");
								System.out.println("아이디\t도서번호\t대출일자\t\t연장횟수\t반납기한\t\t현재날짜\t\t남은일수\t연체료");
								for (Lending ld : udao.MyLendingList(new Lending(id))) {
									System.out.print(ld.getId() + "\t");
									System.out.print(ld.getBnumber() + "\t");
									System.out.print(ld.getLdate() + "\t");
									System.out.print(ld.getExtension() + "\t");
									System.out.print(ld.getDuedate() + "\t");
									System.out.print(ld.getSysdate() + "\t");
									System.out.print(ld.getDays() + "\t");
									System.out.print(ld.getCharge() + "\n");
								}
							} else if (opt3 == 7) { // 7.반납일자
								System.out.println("# 반납일자 #");
								for (Lending ld : udao.DaysList(new Lending(id))) {
									System.out.println(ld.getId() + "님이 대여한 도서번호 " + ld.getBnumber() + "의 반납일자는 "
											+ ld.getDuedate() + "입니다.");
								}
							} else if (opt3 == 8) { // 8.연장신청
								System.out.println("연장을 원하는 도서의 번호를 입력해주세요.");
								System.out.print("▶도서번호 : ");
								bnumber = sc.nextInt();
								for (Lending l : rdao.LendingCk(new Lending(bnumber))) {
									charge1 = l.getCharge();
									extension = l.getExtension();
								}
								if (charge1 == null) {
									System.out.println("대여중인 도서가 없습니다.");
								} else if (charge1 > 0) {
									System.out.println("연장불가!! 연체된 도서입니다.");
								} else {
									if (extension == 0) {
										udao.Extension(bnumber);
										System.out.println("연장신청했습니다. 반납기한을 지켜주세요!");
									} else if (extension == 1) {
										System.out.println("이미 연장신청된 도서입니다. 연장신청은 최대 1번만 가능합니다.");
									}
								}
							} else if (opt3 == 9) { // 9.연체료조회
								System.out.println("# 연체료 #");
								for (Lending ld : udao.ChargeList(new Lending(id))) {
									System.out.println(ld.getId() + "님이 대여한 도서번호 " + ld.getBnumber() + "의 연체료는 "
											+ ld.getCharge() + "원 입니다.");
								}
							} else if (opt3 == 10) { // 10.남은기간
								System.out.println("# 남은기간 #");
								for (Lending ld : udao.DaysList(new Lending(id))) {
									System.out.println(ld.getId() + "님이 대여한 도서번호 " + ld.getBnumber() + "의 남은기간은 "
											+ ld.getDays() + "일 입니다.");
								}
							} else if (opt3 == 11) { // 11.랭킹
								udao.RunBookRank(); // 베스트책
								System.out.println();
								udao.RunMemRank(); // 이달의 독서왕
								System.out.println();
							} else if (opt3 == 12) { // 12.도서리뷰보기
								udao.RunReviewList();
							} else if (opt3 == 0) { // 0.로그아웃
								System.out.println("이용자로그아웃하고 도서관메인으로 돌아갑니다.");
								break;
							} else {
								System.out.println("잘못된 입력입니다.\n");
							}
						}
					}
				}
			} else if (opt1 == 2) { // 2.이용자회원가입
				dao.RunInsertUser();
			} else if (opt1 == 3) { // 3.관리자회원가입
				dao.RunInsertManager();
			} else if (opt1 == 4) { // 4.회원탈퇴
				dao.RunDelete();
			} else if (opt1 == 0) { // 0.종료
				System.out.println("도서관시스템을 종료합니다. 이용해 주셔서 감사합니다.");
				break;
			} else {
				System.out.println("잘못된 입력입니다. 도서관메인으로 돌아갑니다.\n");
			}
		}
	}
}
