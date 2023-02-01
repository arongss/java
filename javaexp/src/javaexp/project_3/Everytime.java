package javaexp.project_3;

import java.util.Scanner;

import javaexp.project_3.vo.Post;
import javaexp.project_3.vo.Users;

public class Everytime {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Scanner sc = new Scanner(System.in);
		Everytime et = new Everytime();
		LoginDao ldao = new LoginDao();
		MypageDao mdao = new MypageDao();
		JoinDao jdao = new JoinDao();
		String id;
		String pass;
		String newpass;
		String newemail;
		String newnickname;
		while (true) {
			et.showMain();
			int opt1 = sc.nextInt();
			sc.nextLine();
			System.out.println();
			if (opt1 == 1) { // 로그인
				System.out.println("# 로그인 #");
				System.out.println("아이디를 입력해주세요.");
				System.out.print("▶아이디 : ");
				id = sc.nextLine();
				System.out.println("비밀번호를 입력해주세요.");
				System.out.print("▶비밀번호 : ");
				pass = sc.nextLine();
				if (ldao.Login(new Users(id, pass)).size() == 0) {
					System.out.println();
					System.out.println("일치하는 회원정보가 없습니다. 에브리타임 메인으로 돌아갑니다.");
					System.out.println();
				} else {
					for (Users l : ldao.Login(new Users(id, pass))) {
						id = l.getId();
						pass = l.getPass();
					}
					System.out.println();
					System.out.println("안녕하세요! " + id + "님 로그인되었습니다.\n");
					while (true) {
						et.showUser();
						int opt2 = sc.nextInt();
						sc.nextLine();
						System.out.println();
						if (opt2 == 1) { // 마이페이지
							while (true) {
								et.showMypage();
								int opt3 = sc.nextInt();
								sc.nextLine();
								System.out.println();
								if (opt3 == 1) { // 내정보 조회
									System.out.println("# 내정보 조회 #");
									for (Users m : mdao.Mypage(new Users(id, pass))) {
										System.out.println("아이디:\t" + m.getId());
										System.out.println("비밀번호:\t" + m.getPass());
										System.out.println("이메일:\t" + m.getEmail());
										System.out.println("닉네임:\t" + m.getNickname());
										System.out.println("입학년도:\t" + m.getEnterYear());
										System.out.println("대학교:\t" + m.getUniversity());
										System.out.println();
									}
								} else if (opt3 == 2) { // 내정보 수정
									System.out.println("# 내정보 수정 #");
									System.out.println("변경할 비밀번호를 입력해주세요");
									System.out.print("▶새 비밀번호 : ");
									newpass = sc.nextLine();
									System.out.println("변경할 이메일을 입력해주세요.(ex.xxxxx@naver.com)");
									System.out.print("▶새 이메일 : ");
									newemail = sc.nextLine();
									System.out.println("변경할 닉네임을 입력해주세요.");
									System.out.print("▶새 닉네임 : ");
									newnickname = sc.nextLine();
									mdao.UpdateInform(id, new Users(newpass, newemail, newnickname));
									System.out.println("내정보 수정이 완료되었습니다!");
									System.out.println();
								} else if (opt3 == 3) { // 게시글 조회
									System.out.println("# 게시글 조회 #");
									System.out.println("게시글번호\t게시글내용\t좋아요수\t게시판번호\t작성자");
									for (Post p : mdao.Postck(new Post(id))) {
										System.out.print(p.getPno() + "\t" + p.getPcontents() + "\t" + p.getLikecnt()
												+ "\t" + p.getBno() + "\t" + p.getId());
										System.out.println();
									}
								} else if (opt3 == 4) { // 게시글 삭제
									mdao.RunDeletePost();
								} else if (opt3 == 5) { // 회원탈퇴
									jdao.RunDelete();
									break;
								} else if (opt3 == 0) { // 나가기
									System.out.println("마이페이지를 종료합니다.");
									System.out.println();
									break;
								} else {
									System.out.println("잘못 입력하셨습니다. 다시 입력해주세요.\n");
								}
							}
						} else if (opt2 == 0) { // 로그아웃
							System.out.println("로그아웃하고 에브리타임 메인으로 돌아갑니다.");
							System.out.println();
							break;
						} else {
							System.out.println("잘못 입력하셨습니다. 다시 입력해주세요.\n");
						}
					}
				}
			} else if (opt1 == 2) { // 회원가입
				jdao.RunJoinUsers();
			} else if (opt1 == 0) { // 나가기
				System.out.println("에브리타임을 이용해 주셔서 감사합니다.");
				break;
			} else {
				System.out.println("잘못 입력하셨습니다. 다시 입력해주세요.\n");
			}
		}
		sc.close();
	}

	public void showMain() {
		System.out.println("---- 에브리타임 ----");
		System.out.println("1.로그인");
		System.out.println("2.회원가입");
		System.out.println("0.나가기");
		System.out.println("------------------");
		System.out.print("번호 선택: ");
	}

	public void showUser() {
		System.out.println("---- 회원 메뉴 ----");
		System.out.println("1.마이페이지");
		System.out.println("0.로그아웃");
		System.out.println("-----------------");
		System.out.print("번호 선택: ");
	}

	public void showMypage() {
		System.out.println("---- 마이페이지 ----");
		System.out.println("1.내정보 조회");
		System.out.println("2.내정보 수정");
		System.out.println("3.게시글 조회");
		System.out.println("4.게시글 삭제");
		System.out.println("5.회원탈퇴");
		System.out.println("0.나가기");
		System.out.println("------------------");
		System.out.print("번호 선택: ");
	}

}
