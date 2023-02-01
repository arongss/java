package javaexp.naver;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Scanner;

public class MyLibProject {
	Connection con;
	PreparedStatement pstmt1; // 사용자
	PreparedStatement pstmt2; // 도서
	Scanner sc = new Scanner(System.in);
	ResultSet rs;

	public static void main(String[] args) throws SQLException {
		MyLibProject lib = new MyLibProject();
		lib.doRun();
	}

	// 실행 메소드
	public void doRun() {
		try {
			System.out.println("접속중");
			System.out.println("접속완료");
			System.out.println();

			int opt1, opt2;
			String id;

			while (true) {
				showMain();
				opt1 = sc.nextInt();
				sc.nextLine(); // 엔터 입력 시 중복처리 방지
				System.out.println();

				// ******************************************** login
				// *******************************************************
				if (opt1 == 1) {
					System.out.print("ID를 입력해 주세요: ");
					id = sc.nextLine();

					String sql = "select * from pro_userDB where id = ?";
					pstmt1 = con.prepareStatement(sql);
					pstmt1.setString(1, id);
					rs = pstmt1.executeQuery();

					if (rs.next()) {
						// ******************************************** manager
						// *******************************************************
						if (id.equals("manager")) {
							System.out.println();
							showManager();
							opt2 = sc.nextInt();
							sc.nextLine(); // 엔터 입력 시 중복처리 방지

							if (opt2 == 1) // 도서 등록
							{
								System.out.println();
								addBook();
							} else if (opt2 == 2) // 도서 전체 조회
							{
								System.out.println();
								totalSel(id);
							} else if (opt2 == 3) // 도서 조회
							{
								System.out.println();
								selBook();
							} else if (opt2 == 4) // 도서 폐기
							{
								System.out.println();
								delBook();
							} else if (opt2 == 5) // 모든 회원 조회
							{
								System.out.println();
								totalUser();
							} else if (opt2 == 6) // 개별 회원 조회
							{
								System.out.println();
								System.out.print("조회할 회원의 ID를 입력해 주세요: ");
								id = sc.nextLine();
//										sc.nextLine();		// 엔터 입력 시 중복처리 방지								
								userInfo(id);
							} else if (opt2 == 7) {
								System.out.println();
								bk_del();
							} else if (opt2 == 0) {
								System.out.println("처음 화면으로 돌아갑니다.");
								System.out.println();
							} else {
								System.out.println();
								System.out.println("잘못 입력하셨습니다.\n");
							}
						}
						// ******************************************** user
						// *******************************************************
						else {
							System.out.println();
							showUser();
							opt2 = sc.nextInt();
							sc.nextLine(); // 엔터 입력 시 중복처리 방지

							if (opt2 == 1) // 대출하기
							{
								sql = "select * from pro_userDB where id = ?";
								pstmt1 = con.prepareStatement(sql);
								pstmt1.setString(1, id);
								rs = pstmt1.executeQuery();
								rs.next();
								int cnt = rs.getInt(3);

								if (rs.getDate(4) != null) {
									System.out.println("블랙리스트로 등록된 회원입니다. " + rs.getDate(4) + "까지 대출이 금지됩니다.");
									System.out.println();
								} else if (cnt == 3) {
									System.out.println("대출 한도 초과입니다.\n");
								} else if (rs.getDate(4) == null && cnt != 3) {
									System.out.println();
									borrowBook(null, id, cnt);
								}
								rs.close();
							} else if (opt2 == 2) // 대출 반납
							{
								sql = "select * from pro_userDB where id = ?";
								pstmt1 = con.prepareStatement(sql);
								pstmt1.setString(1, id);
								rs = pstmt1.executeQuery();
								rs.next();

								int cnt = rs.getInt(3);
								if (cnt == 0) {
									System.out.println();
									System.out.println("대출 중인 도서가 없습니다.\n");
								} else {
									System.out.println();
									returnBook(null, id, cnt);
								}
								rs.close();
							} else if (opt2 == 3) // 대출 정보 조회
							{
								myBorrow(id);
							} else if (opt2 == 4) // 기한 연장
							{
								renew(id);
							} else if (opt2 == 5) {
								System.out.println();
								selBook();
							} else if (opt2 == 6) // 전체 도서 조회
							{
								System.out.println();
								totalSel(id);
							} else if (opt2 == 0) {
								System.out.println();
							} else {
								System.out.println("잘못된 누르셨습니다.\n");
							}
						}
					} else {
						System.out.println("[" + id + "]은(는)등록된 회원이 아닙니다.");
						System.out.println("회원가입 하시겠습니까?(y/n)");
						String yn = sc.nextLine();

						if (yn.equalsIgnoreCase("y")) {
							System.out.println();
							join();
						} else if (yn.equalsIgnoreCase("n")) {
							System.out.println("처음화면으로 돌아갑니다.\n");
						} else {
							System.out.println("잘못 누르셨습니다.\n");
						}
					}
					rs.close();
				}
				// ******************************************** join
				// *******************************************************
				else if (opt1 == 2) {
					join();
				}
				// ******************************************** leave
				// *******************************************************
				else if (opt1 == 3) {
					System.out.print("ID를 입력해 주세요: ");
					id = sc.nextLine();

					String sql = "select * from pro_userDB where id = ?";
					pstmt1 = con.prepareStatement(sql);
					pstmt1.setString(1, id);
					rs = pstmt1.executeQuery();
					if (rs.next()) {
						leave(id);
					} else {
						System.out.println("[" + id + "]은(는)등록된 회원이 아닙니다.\n");
					}
				} else if (opt1 == 0) {
					System.out.println("이용해 주셔서 감사합니다.");
					break;
				} else {
					System.out.println("잘못 입력하셨습니다.");
					System.out.println();
				}
			}
		} catch (SQLException sqle) {
			System.out.println("진행 중에 문제가 발생했습니다!");
			sqle.printStackTrace();
		}
	}

	public void showMain() {
		System.out.println("[[더조은 도서관]]");
		System.out.println("1.로그인");
		System.out.println("2.회원가입");
		System.out.println("3.회원탈퇴");
		System.out.println("0.나가기");
		System.out.print("번호 선택: ");
	}

	public void showManager() {
		System.out.println("[관리자 메뉴]");
		System.out.println("  [도서]");
		System.out.println("1.도서 등록");
		System.out.println("2.도서 전체 목록"); // 전체 목록
		System.out.println("3.도서 조회"); // 하나하나 개별 조회
		System.out.println("4.도서 폐기");
		System.out.println("  [회원]");
		System.out.println("5.회원 전체 목록"); // 전체 회원 조회
		System.out.println("6.회원 조회"); // 개별 회원 조회
		System.out.println("7.블랙리스트 관리");
		System.out.println("0.로그아웃");
		System.out.println();
		System.out.print("번호 선택: ");
	}

	public void showUser() {
		System.out.println("[회원 메뉴]");
		System.out.println("1.대출");
		System.out.println("2.반납");
		System.out.println("3.대출 정보 조회");
		System.out.println("4.반납 기한 연장");
		System.out.println("==================");
		System.out.println("5.도서 조회");
		System.out.println("6.도서 전체 목록");
		System.out.println("0.로그아웃");
		System.out.println();
		System.out.print("번호 선택해 주세요: ");
	}

	public void addBook() throws SQLException {
//				System.out.print("등록번호: ");
//				String bno = sc.nextLine();
		System.out.print("책 제목: ");
		String title = sc.nextLine();
		System.out.print("저자: ");
		String author = sc.nextLine();

		String sql = "insert into pro_bookDB values(pro_lib_seq.nextval, ?, ?, sysdate, 'X', null)";
		pstmt2 = con.prepareStatement(sql);
//				pstmt2.setString(1, bno);
		pstmt2.setString(1, title);
		pstmt2.setString(2, author);
		pstmt2.executeUpdate();

		System.out.println("도서 등록이 완료되었습니다.\n");

//				catch(Exception e)
//				{
//					System.out.println("등록 과정에서 에러가 발생했습니다.");
//					e.printStackTrace();
//				}

		System.out.println("다른 책을 등록하시려면 'Y'키를 눌러주세요.");
		System.out.println("(종료하시려면 아무키나 눌러주세요.)");
		String yn = sc.nextLine();
		if (yn.equalsIgnoreCase("y")) {
			addBook();
		}
	}

	public void selBook() throws SQLException {
		System.out.print("책 제목: ");
		String title = sc.nextLine();
		System.out.println();

		String sql = "select count(*) from pro_bookDB group by title having title = ?";
		pstmt2 = con.prepareStatement(sql);
		pstmt2.setString(1, title);
		rs = pstmt2.executeQuery();
		while (rs.next()) {
			System.out.println("'" + title + "'은(는) 총 " + rs.getInt(1) + "권 입니다.");
		}

		sql = "select * from pro_bookDB where title = ?";
		pstmt2 = con.prepareStatement(sql);
		pstmt2.setString(1, title);
		rs = pstmt2.executeQuery();

		if (rs.next()) {
			String author1 = rs.getString(3);

			sql = "select count(*) from pro_bookDB group by title, author having title = ? and author = ?";
			pstmt2 = con.prepareStatement(sql);
			pstmt2.setString(1, title);
			pstmt2.setString(2, author1);
			rs = pstmt2.executeQuery();
			while (rs.next()) {
				System.out.println("'" + author1 + "'작가의 " + "'" + title + "' 총 " + rs.getInt(1) + "권");
			}
			sql = "select * from pro_bookDB where title = ?";
			pstmt2 = con.prepareStatement(sql);
			pstmt2.setString(1, title);
			rs = pstmt2.executeQuery();
			rs.next();
			author1 = rs.getString(3);
			while (rs.next()) {
				if (!author1.equals(rs.getString(3))) {
					String author2 = rs.getString(3);
					sql = "select count(*) from pro_bookDB group by title, author having title = ? and author = ?";
					pstmt2 = con.prepareStatement(sql);
					pstmt2.setString(1, title);
					pstmt2.setString(2, author2);
					rs = pstmt2.executeQuery();
					while (rs.next()) {
						System.out.println("'" + author2 + "'작가의 " + "'" + title + "' 총 " + rs.getInt(1) + "권");
					}
				}
			}

			sql = "select count(*) from pro_bookDB group by borrow, title having borrow = 'X' and title = ?";
			pstmt2 = con.prepareStatement(sql);
			pstmt2.setString(1, title);
			rs = pstmt2.executeQuery();
			if (rs.next()) {
				System.out.println("▶ 대출 가능한 '" + title + "'은(는) 총 " + rs.getInt(1) + "권입니다.");
			} else {
				System.out.println("▶ 대출 가능한 '" + title + "'은(는) 총 0권입니다.");
			}
			System.out.println("▶ 대출 시에 저자와 등록번호를 꼭 확인해 주세요.");
			System.out.println();

			sql = "select * from pro_bookDB where title = ? order by author, bno";
			pstmt2 = con.prepareStatement(sql);
			pstmt2.setString(1, title);
			rs = pstmt2.executeQuery();
			rs.next();

			System.out.println("-----------------------------------------");
			System.out.println("등록번호: " + rs.getString(1));
			System.out.println("책 제목: " + rs.getString(2));
			System.out.println("저자: " + rs.getString(3));
			System.out.println("등록일: " + rs.getDate(4));
			System.out.println("대출 여부: " + rs.getString(5));
			System.out.println();
			System.out.println("-----------------------------------------");

			while (rs.next()) {
				System.out.println("-----------------------------------------");
				System.out.println("등록번호: " + rs.getString(1));
				System.out.println("책 제목: " + rs.getString(2));
				System.out.println("저자: " + rs.getString(3));
				System.out.println("등록일: " + rs.getDate(4));
				System.out.println("대출 여부: " + rs.getString(5));
				System.out.println();
				System.out.println("-----------------------------------------");
			}
		} else {
			System.out.println("등록되지 않은 도서입니다.");
		}
		rs.close();

		System.out.println("다른 책을 조회하시려면 'Y'키를 눌러주세요.");
		System.out.println("(종료하시려면 아무키나 눌러주세요.)");
		String yn = sc.nextLine();
		if (yn.equalsIgnoreCase("y")) {
			selBook();
		}

//				catch(Exception e)
//				{
//					System.out.println("조회 과정에서 에러가 발생했습니다.");
//					e.printStackTrace();
//				}
	}

	public void totalSel(String id) throws SQLException {
		System.out.println("[[더조은 도서관 도서 목록]]");
		System.out.println();

		if (id.equalsIgnoreCase("manager")) {
			String sql = "select * from pro_bookDB order by bno desc";
			pstmt2 = con.prepareStatement(sql);
			rs = pstmt2.executeQuery();

			while (rs.next()) {
				System.out.println("-----------------------------------------");
				System.out.println("등록번호: " + rs.getString(1));
				System.out.println("책 제목: " + rs.getString(2));
				System.out.println("저자: " + rs.getString(3));
				System.out.println("등록일: " + rs.getDate(4));
				System.out.println("대출 여부: " + rs.getString(5));
				System.out.println("대출자 ID: " + rs.getString(6));
				System.out.println();
				System.out.println("-----------------------------------------");
			}
		} else {
			String sql = "select * from pro_bookDB order by title, author, bno";
			pstmt2 = con.prepareStatement(sql);
			rs = pstmt2.executeQuery();

			while (rs.next()) {
				System.out.println("-----------------------------------------");
				System.out.println("등록번호: " + rs.getString(1));
				System.out.println("책 제목: " + rs.getString(2));
				System.out.println("저자: " + rs.getString(3));
				System.out.println("등록일: " + rs.getDate(4));
				System.out.println("대출 여부: " + rs.getString(5));
				System.out.println();
				System.out.println("-----------------------------------------");
			}
			rs.close();
		}

//				catch(Exception e)
//				{
//					System.out.println("조회 과정에서 에러가 발생했습니다.");
//					e.printStackTrace();
//				}
	}

	public void delBook() throws SQLException {
		System.out.print("등록번호: ");
		String bno = sc.nextLine();

		String sql = "select * from pro_bookDB where bno = ?";
		pstmt2 = con.prepareStatement(sql);
		pstmt2.setString(1, bno);
		rs = pstmt2.executeQuery();

		while (rs.next()) {
			System.out.println("등록번호: " + rs.getString(1));
			System.out.println("책 제목: " + rs.getString(2));
			System.out.println("저자: " + rs.getString(3));
			System.out.println("등록일: " + rs.getDate(4));
			System.out.println("대출 여부: " + rs.getString(5));
			System.out.println();
		}
		System.out.println("해당 도서를 폐기하시겠습니까?(y/n)");
		String yn = sc.nextLine();
		if (yn.equalsIgnoreCase("Y")) {
			sql = "delete from pro_bookDB where bno = ?";
			pstmt2 = con.prepareStatement(sql);
			pstmt2.setString(1, bno);
			pstmt2.executeUpdate();

			System.out.println("도서가 폐기 되었습니다.");
			System.out.println("다른 책을 폐기하시려면 'Y'키를 눌러주세요.");
			System.out.println("(종료하시려면 아무키나 눌러주세요.)");
			yn = sc.nextLine();

			if (yn.equalsIgnoreCase("y")) {
				delBook();
			}
		} else {
			System.out.println("도서 폐기가 취소되었습니다.\n");
		}

//				catch(Exception e)
//				{
//					System.out.println("폐기 과정에서 에러가 발생했습니다.");
//					e.printStackTrace();
//				}		
	}

	public void join() throws SQLException {
		System.out.println("[회원가입]");
		System.out.print("사용할 ID를 입력해 주세요: ");
		String id = sc.nextLine();

		String sql = "select * from pro_userDB where id = ?";
		pstmt1 = con.prepareStatement(sql);
		pstmt1.setString(1, id);
		ResultSet rs = pstmt1.executeQuery();
		if (rs.next()) {
			System.out.println("사용중인 ID입니다.\n");
		} else {
			System.out.print("사용자 이름을 입력해 주세요: ");
			String name = sc.nextLine();

			sql = "insert into pro_userDB values(?, ?, 0, null)";
			pstmt1 = con.prepareStatement(sql);
			pstmt1.setString(1, id);
			pstmt1.setString(2, name);
			pstmt1.executeUpdate();
			System.out.println("회원가입이 완료 되었습니다.\n");
		}
		rs.close();

//				catch(Exception e)
//				{
//					System.out.println("회원가입에 실패했습니다. 다시 가입해 주세요.\n");
//					e.printStackTrace();
//				}
	}

	public void leave(String id) throws SQLException {
		String sql = "select * from pro_borrowDB where bor_id = ? order by bno";
		pstmt1 = con.prepareStatement(sql);
		pstmt1.setString(1, id);
		rs = pstmt1.executeQuery();
		if (rs.next()) {
			System.out.println();
			System.out.println("반납되지 않은 책이 있어서 탈퇴할 수 없습니다.");
			System.out.println();
			System.out.println("[" + id + "] 님의 대출 목록");
			System.out.println("-----------------------------------------");
			System.out.println("책 번호: " + rs.getString(1));
			System.out.println("책 제목: " + rs.getString(2));
			System.out.println("대출일: " + rs.getDate(4));
			System.out.println("반납일: " + rs.getDate(5));
			System.out.println("연장 횟수: " + rs.getInt(6));
			System.out.println();
			System.out.println("-----------------------------------------");

			while (rs.next()) {
				System.out.println();
				System.out.println("-----------------------------------------");
//						System.out.println("대출자 아이디: " + rs.getString(3));
				System.out.println("책 번호: " + rs.getString(1));
				System.out.println("책 제목: " + rs.getString(2));
				System.out.println("대출일: " + rs.getDate(4));
				System.out.println("반납일: " + rs.getDate(5));
				System.out.println("연장 횟수: " + rs.getInt(6));
				System.out.println();
				System.out.println("-----------------------------------------");
			}
		} else {
			System.out.println();
			System.out.println("탈퇴하시려면 'EXIT'를 입력해 주세요.");
			String yn = sc.nextLine();
			if (yn.equalsIgnoreCase("EXIT")) {
				sql = "delete from pro_userDB where id = ?";
				pstmt1 = con.prepareStatement(sql);
				pstmt1.setString(1, id);
				pstmt1.executeUpdate();
				System.out.println("이용해 주셔서 감사합니다.\n");
			} else {
				System.out.println("잘못 누르셨습니다. 처음 화면으로 돌아갑니다.\n");
			}
		}
	}

	public void borrowBook(String bno, String id, int cnt) throws SQLException {
		while (true) {
			System.out.print("대출할 책의 번호를 입력해주세요: ");
			bno = sc.nextLine();

			String sql = "select * from pro_bookDB where bno = ?";
			pstmt2 = con.prepareStatement(sql);
			pstmt2.setString(1, bno);
			rs = pstmt2.executeQuery();
			if (rs.next()) {
				String str = rs.getString(5);
				if (str.equalsIgnoreCase("X")) {
					sql = "update pro_bookDB set borrow = 'O' where bno = ?";
					pstmt2 = con.prepareStatement(sql);
					pstmt2.setString(1, bno);
					pstmt2.executeUpdate();

					sql = "update pro_bookDB set bor_id = ? where bno = ?";
					pstmt2 = con.prepareStatement(sql);
					pstmt2.setString(1, id);
					pstmt2.setString(2, bno);
					pstmt2.executeUpdate();

					sql = "select * from pro_bookDB where bno = ?";
					pstmt2 = con.prepareStatement(sql);
					pstmt2.setString(1, bno);
					rs = pstmt2.executeQuery();
					rs.next();
					String title = rs.getString(2); // pro_bookDB에서 책 제목 받아서

					sql = "insert into pro_borrowDB values(?, ?, ?, sysdate, sysdate + 7, 0, null, null)";
					pstmt2 = con.prepareStatement(sql);
					pstmt2.setString(1, bno);
					pstmt2.setString(2, title); // pro_borrowDB에 삽입
					pstmt2.setString(3, id);
					pstmt2.executeUpdate();

					sql = "select * from pro_borrowDB where bno = ?";
					pstmt2 = con.prepareStatement(sql);
					pstmt2.setString(1, bno);
					rs = pstmt2.executeQuery();
					rs.next();

					System.out.println("대출이 완료되었습니다.");
					System.out.println("반납일은 " + rs.getDate(5) + "입니다.\n");

					sql = "update pro_userDB set bor_cnt = ? where id = ?";
					pstmt1 = con.prepareStatement(sql);
					pstmt1.setInt(1, cnt + 1);
					pstmt1.setString(2, id);
					pstmt1.executeUpdate();

					System.out.println("다른 책을 대출하시려면 'Y'키를 눌러주세요.");
					System.out.println("(종료하시려면 아무키나 눌러주세요.)");
					String yn = sc.nextLine();
					if (yn.equalsIgnoreCase("y")) {
						cnt = cnt + 1;
						if (cnt == 3) {
							System.out.println("대출 한도 초과입니다.\n");
							break;
						}
						continue;
					} else {
						break;
					}
				} else {
					System.out.println("이미 대출 중인 도서입니다.\n");
					break;
				}
			} else {
				System.out.println("등록되지 않은 도서입니다.\n");
				break;
			}
		}
		rs.close();

//				}
//				catch(Exception e)
//				{
//					System.out.println("대출오류");
//					e.printStackTrace();
//				}
	}

	public void returnBook(String bno, String id, int cnt) throws SQLException {
		while (true) {
			System.out.print("반납할 책의 번호를 입력해주세요: ");
			bno = sc.nextLine();

			String sql = "select * from pro_bookDB where bno = ?";
			pstmt2 = con.prepareStatement(sql);
			pstmt2.setString(1, bno);
			rs = pstmt2.executeQuery();

			if (rs.next()) {
				String str = rs.getString(5);
				String bor_id = rs.getString(6);
				// System.out.println(bor_id);

				if (bor_id == null) {
					System.out.println("회원님께서 대출하신 도서가 아닙니다\n");
					cnt++;
					return;
				}

				if (bor_id.equals(id)) {
					if (str.equalsIgnoreCase("O")) {
						sql = "update pro_bookDB set borrow = 'X' where bno = ?"; // 반납 시 pro_bookDB 대여 상태 X로 바꿈
						pstmt2 = con.prepareStatement(sql);
						pstmt2.setString(1, bno);
						pstmt2.executeUpdate();

						sql = "update pro_bookDB set bor_id = null where bno = ?"; // 반납 시 pro_bookDB 대여 유저 null로 바꿈
						pstmt2 = con.prepareStatement(sql);
						pstmt2.setString(1, bno);
						pstmt2.executeUpdate();

						sql = "update pro_borrowDB set get_date = sysdate where bno = ?"; // 반납 시 pro_borrowDB에
																							// 반납일(sysdate) 입력
						pstmt2 = con.prepareStatement(sql);
						pstmt2.setString(1, bno);
						pstmt2.executeUpdate();

						sql = "select * from pro_borrowDB where bno = ?";
						pstmt2 = con.prepareStatement(sql);
						pstmt2.setString(1, bno);
						rs = pstmt2.executeQuery();
						rs.next();
						String re = rs.getString(5);
						String get = rs.getString(7);

						int cmp = get.compareTo(re); // 반납일과 예정일 비교
						/*
						 * 반납일과 예정일을 비교했을 때 반납일이 예정일보다 빠르면 반납 완료. 반납일과 예정일이 같아도 반납 완료. 반납일이 예정일보다 늦으면
						 * 연체.
						 */
						if (cmp == 0) // cmp가 0이면(예정일 당일 반납) 반납 완료.
						{
							sql = "delete from pro_borrowDB where bno = ?"; // 반납 완료시 pro_borrowDB에서 삭제
							pstmt2 = con.prepareStatement(sql);
							pstmt2.setString(1, bno);
							pstmt2.executeUpdate();
							System.out.println("반납이 완료되었습니다.");
						} else if (cmp < 0) // cmp가 음수면(예정일 이전 반납) 반납 완료.
						{
							sql = "delete from pro_borrowDB where bno = ?"; // 반납 완료시 pro_borrowDB에서 삭제
							pstmt2 = con.prepareStatement(sql);
							pstmt2.setString(1, bno);
							pstmt2.executeUpdate();
							System.out.println("반납이 완료되었습니다.");
						} else // cmp가 양수면(예정일 이후 반납) 연체.
						{
							sql = "update pro_userDB set bk_end = sysdate +7 where id = ?"; // 연체되면 pro_borrowDB에 반납일
																							// 입력하고 기록 남김, pro_userDB는
																							// 블랙리스트 처리
							pstmt1 = con.prepareStatement(sql); // 대출은 pro_bookDB에서만 판단하고 pro_borrowDB와는 관계없으므로 기록 남아도
																// 상관없음
							pstmt1.setString(1, id); // 블랙리스트 등록 기간은 7일
							pstmt1.executeUpdate();

							sql = "update pro_borrowDB set bk_user = ? where bno = ?"; // pro_borrowDB에 연체자 ID 입력
							pstmt2 = con.prepareStatement(sql);
							pstmt2.setString(1, id);
							pstmt2.setString(2, bno);
							pstmt2.executeUpdate();

							System.out.println("연체되었습니다. 7일간 대출이 금지됩니다.");
						}
						System.out.println();

						sql = "update pro_userDB set bor_cnt = ? where id = ?";
						pstmt1 = con.prepareStatement(sql);
						pstmt1.setInt(1, cnt - 1);
						pstmt1.setString(2, id);
						pstmt1.executeUpdate();

						System.out.println("다른 책을 반납하시려면 'Y'키를 눌러주세요.");
						System.out.println("(종료하시려면 아무키나 눌러주세요.)");
						String yn = sc.nextLine();
						if (yn.equalsIgnoreCase("y")) {
							cnt = cnt - 1;
							if (cnt == 0) {
								System.out.println("대출 중인 도서가 없습니다.\n");
								break;
							}
							continue;
						} else {
							break;
						}
					} else {
						System.out.println("대출되지 않은 도서입니다.\n");
						break;
					}
				} else {
					System.out.println("회원님께서 대출하신 도서가 아닙니다.\n");
					break;
				}
			} else {
				System.out.println("등록되지 않은 도서입니다.\n");
				break;
			}
		}
		rs.close();
//				}
//				catch(Exception e)
//				{
//					System.out.println("대출오류");
//					e.printStackTrace();
//				}			
	}

	public void myBorrow(String id) throws SQLException {
		String sql = "select * from pro_borrowDB where bor_id = ? order by bno";
		pstmt1 = con.prepareStatement(sql);
		pstmt1.setString(1, id);
		rs = pstmt1.executeQuery();

		System.out.println();
		System.out.println("[" + id + "] 님의 대출 목록");

		while (rs.next()) {
			if (rs.getDate(7) == null) {
				System.out.println("-----------------------------------------");
				System.out.println("책 번호: " + rs.getString(1));
				System.out.println("책 제목: " + rs.getString(2));
				System.out.println("대출일: " + rs.getDate(4));
				System.out.println("반납일: " + rs.getDate(5));
				System.out.println("연장 횟수: " + rs.getInt(6));
				System.out.println();
				System.out.println("-----------------------------------------");
			}

//					while(rs.next())
//					{
//						System.out.println();
//						System.out.println("-----------------------------------------");
////						System.out.println("대출자 아이디: " + rs.getString(3));
//						System.out.println("책 번호: " + rs.getString(1));									
//						System.out.println("책 제목: " + rs.getString(2));
//						System.out.println("대출일: " + rs.getDate(4));
//						System.out.println("반납일: " + rs.getDate(5));
//						System.out.println("연장 횟수: " + rs.getInt(6));
//						System.out.println();
//						System.out.println("-----------------------------------------");
//					}
		}
//				else
//				{
//					System.out.println();
//					System.out.println("대출 중인 책이 없습니다.\n");
//				}
		rs.close();
	}

	public void renew(String id) throws SQLException {
		while (true) {
			System.out.println();
			System.out.println("반납기한 연장은 1회에 한하여 가능합니다.");
			System.out.print("연장할 책의 번호를 입력해 주세요: ");
			String bno = sc.nextLine();

			String sql = "select * from pro_borrowDB where bno = ?";
			pstmt1 = con.prepareStatement(sql);
			pstmt1.setString(1, bno);
			rs = pstmt1.executeQuery();
			rs.next();
			int cnt = rs.getInt(6);
			String bor_id = rs.getString(3);

			if (bor_id.equals(id)) {
				if (cnt == 0) {
					sql = "update pro_borrowDB set re_date = re_date +7 where bno = ?";
					pstmt2 = con.prepareStatement(sql);
					pstmt2.setString(1, bno);
					pstmt2.executeUpdate();

					System.out.println("연장되었습니다.\n"); // id 체크를 하지 않아서 내가 빌린 책이 아니어도 연장할 수 있음. 후에 수정 필요

					sql = "update pro_borrowDB set renew_cnt = 1 where bno = ?";
					pstmt2 = con.prepareStatement(sql);
					pstmt2.setString(1, bno);
					pstmt2.executeUpdate();

					System.out.println("다른 책을 연장하시려면 'Y'키를 눌러주세요.");
					System.out.println("(종료하시려면 아무키나 눌러주세요.)");
					String yn = sc.nextLine();

					if (yn.equalsIgnoreCase("y")) {
						continue;
					} else {
						break;
					}
				} else if (cnt == 1) {
					System.out.println("해당 도서는 연장 횟수 초과로 더이상 연장할 수 없습니다.\n");
//							break;
					System.out.println("다른 책을 연장하시려면 'Y'키를 눌러주세요.");
					System.out.println("(종료하시려면 아무키나 눌러주세요.)");
					String yn = sc.nextLine();

					if (yn.equalsIgnoreCase("y")) {
						continue;
					} else {
						break;
					}
				}
			} else {
				System.out.println("회원님께서 대출하신 도서가 아닙니다.\n");
				break;
			}
			rs.close();
		}
	}

	public void totalUser() throws SQLException {
		System.out.println("[[더조은 도서관 회원 목록]]");
		System.out.println();

		String sql = "select * from pro_userDB where id != 'manager' order by id";
		pstmt1 = con.prepareStatement(sql);
		ResultSet rs = pstmt1.executeQuery();

		while (rs.next()) {
			System.out.println("-----------------------------------------");
			System.out.println("회원 ID: " + rs.getString(1));
			System.out.println("회원 이름: " + rs.getString(2));
			System.out.println("대출 권 수: " + rs.getString(3));

			if (rs.getDate(4) != null) {
				System.out.println();
				System.out.println("<<<<<<<<<<블랙리스트 회원입니다.>>>>>>>>>>");
				System.out.println("블랙리스트 종료일: " + rs.getDate(4));
			}
			System.out.println();
			System.out.println("-----------------------------------------");
		}
		rs.close();
	}

	public void userInfo(String id) throws SQLException {
		String sql = "select * from pro_userDB where id = ?";
		pstmt1 = con.prepareStatement(sql);
		pstmt1.setString(1, id);
		rs = pstmt1.executeQuery();
		rs.next();

		if (rs.getDate(4) != null) {
			System.out.println();
			System.out.println("회원 ID: " + rs.getString(1));
			System.out.println("회원 이름: " + rs.getString(2));
			System.out.println("대출 권 수: " + rs.getString(3));
			System.out.println("<<<<<<<<<<블랙리스트 회원입니다.>>>>>>>>>>");
			System.out.println("블랙리스트 종료일: " + rs.getDate(4));
			System.out.println();
			System.out.println("-----------------------------------------");

			sql = "select * from pro_borrowDB where bor_id = ? order by bno";
			pstmt1 = con.prepareStatement(sql);
			pstmt1.setString(1, id);
			rs = pstmt1.executeQuery();
			while (rs.next()) {
				if (rs.getDate(7) == null) {
					System.out.println("[대여중인 도서 목록]");
					System.out.println();
					System.out.println("책 번호: " + rs.getString(1));
					System.out.println("책 제목: " + rs.getString(2));
					System.out.println("대출일: " + rs.getDate(4));
					System.out.println("반납일: " + rs.getDate(5));
					System.out.println("연장 횟수: " + rs.getInt(6));
					System.out.println();
					System.out.println("-----------------------------------------");
				}
			}
			rs.close();
		} else {
			System.out.println();
			System.out.println("회원 ID: " + rs.getString(1));
			System.out.println("회원 이름: " + rs.getString(2));
			System.out.println("대출 권 수: " + rs.getString(3));
			System.out.println();
			System.out.println("-----------------------------------------");

			sql = "select * from pro_borrowDB where bor_id = ? order by bno";
			pstmt1 = con.prepareStatement(sql);
			pstmt1.setString(1, id);
			rs = pstmt1.executeQuery();

			while (rs.next()) {
				System.out.println("[대여중인 도서 목록]");
				System.out.println();
				System.out.println("책 번호: " + rs.getString(1));
				System.out.println("책 제목: " + rs.getString(2));
				System.out.println("대출일: " + rs.getDate(4));
				System.out.println("반납일: " + rs.getDate(5));
				System.out.println("연장 횟수: " + rs.getInt(6));
				System.out.println();
				System.out.println("-----------------------------------------");
			}
			System.out.println();
			rs.close();
		}
		rs.close();
	}

	public void bk_del() throws SQLException {
		String sql = "select * from pro_userDB where id != 'manager' order by id";
		pstmt1 = con.prepareStatement(sql);
		ResultSet rs = pstmt1.executeQuery();

		System.out.println("<<블랙리스트>>");
		System.out.println();

		while (rs.next()) {
			if (rs.getDate(4) != null) {
				System.out.println("-----------------------------------------");
				System.out.println("회원 ID: " + rs.getString(1));
				System.out.println("회원 이름: " + rs.getString(2));
				System.out.println("대출 권 수: " + rs.getString(3));
				System.out.println("블랙리스트 종료일: " + rs.getDate(4));
				System.out.println();
				System.out.println("-----------------------------------------");
			}
		}

		System.out.println("블랙리스트에서 해제할 회원의 ID를 입력해 주세요.");
		String id = sc.nextLine();

		sql = "select sysdate from dual";
		pstmt1 = con.prepareStatement(sql);
		rs = pstmt1.executeQuery();
		rs.next();
		String sysdate = rs.getString(1);
//				System.out.println(sysdate);

		sql = "select * from pro_userDB where id = ?";
		pstmt1 = con.prepareStatement(sql);
		pstmt1.setString(1, id);
		rs = pstmt1.executeQuery();
		rs.next();
		String bk_end = rs.getString(4);

		if (bk_end == null) {
			System.out.println("해당 회원은 블랙리스트가 아닙니다.\n");
			return;
		}

		int cmp = bk_end.compareTo(sysdate); // 해제일과 오늘을 비교

		if (cmp == 0) // cmp가 0이면(블랙리스트 해제일) 해제 완료.
		{
			sql = "update pro_userDB set bk_end = null where id = ?";
			pstmt2 = con.prepareStatement(sql);
			pstmt2.setString(1, id);
			pstmt2.executeUpdate();

			sql = "delete from pro_borrowDB where bk_user = ?";
			pstmt2 = con.prepareStatement(sql);
			pstmt2.setString(1, id);
			pstmt2.executeUpdate();

			System.out.println("블랙리스트에서 해제되었습니다.\n");
		} else if (cmp < 0) // cmp가 음수면(해제일 이후) 해제 완료.
		{
			sql = "update pro_userDB set bk_end = null where id = ?";
			pstmt2 = con.prepareStatement(sql);
			pstmt2.setString(1, id);
			pstmt2.executeUpdate();

			sql = "delete from pro_borrowDB where bk_user = ?";
			pstmt2 = con.prepareStatement(sql);
			pstmt2.setString(1, id);
			pstmt2.executeUpdate();

			System.out.println("블랙리스트에서 해제되었습니다.\n");
		} else // cmp가 양수면(해제일 이전) 유지.
		{
			System.out.println("해당 회원은 현재 블랙리스트 기간입니다.");
		}
		System.out.println();
	}
}
