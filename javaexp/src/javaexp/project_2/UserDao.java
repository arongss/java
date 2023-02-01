package javaexp.project_2;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

import javaexp.a13_database.DB;
import javaexp.project_2.vo.Application;
import javaexp.project_2.vo.Lending;
import javaexp.project_2.vo.Library_Book;
import javaexp.project_2.vo.Member;
import javaexp.project_2.vo.Rank;
import javaexp.project_2.vo.Review;

public class UserDao {
	private Connection con;
	private PreparedStatement pstmt;
	private ResultSet rs;
	Scanner sc = new Scanner(System.in);

	// 마이페이지
	public List<Member> Mypage(Member sch) {
		List<Member> list = new ArrayList<Member>();
		String sql = "SELECT * FROM Member WHERE id = ? and password = ?";
		try {
			con = DB.con();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, sch.getId());
			pstmt.setString(2, sch.getPassword());
			rs = pstmt.executeQuery();
			while (rs.next()) {
				list.add(new Member(rs.getString("id"), rs.getString("password"), rs.getString("mname"),
						rs.getString("civilNum"), rs.getInt("point"), rs.getDate("jdate"), rs.getString("auth")));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("DB에러:" + e.getMessage());
		} catch (Exception e) {
			System.out.println("일반 에러:" + e.getMessage());
		} finally {
			DB.close(rs, pstmt, con);
		}
		return list;
	}

//	public void RunMypage() {
//		UserDao dao = new UserDao();
//		System.out.println("# 마이페이지 #");
//		System.out.println("확인을 위해 아이디/비밀번호를 입력해주세요.");
//		System.out.print("▶아이디 : ");
//		String id = sc.nextLine();
//		System.out.print("▶비밀번호 : ");
//		String password = sc.nextLine();
//		for (Member m : dao.Mypage(new Member(id, password))) {
//			System.out.println("아이디:\t" + m.getId());
//			System.out.println("비밀번호:\t" + m.getPassword());
//			System.out.println("이름:\t" + m.getMname());
//			System.out.println("주민번호:\t" + m.getCivilNum());
//			System.out.println("포인트:\t" + m.getPoint());
//			System.out.println("가입일:\t" + m.getJdate());
//			System.out.println("권한:\t" + m.getAuth());
//		}
//	}

	// 도서신청
	public void InsertApplication(Application a) {
		String sql = "INSERT INTO Application values(?,?,?)";
		try {
			con = DB.con();
			con.setAutoCommit(false);
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, a.getId());
			pstmt.setString(2, a.getBookname());
			pstmt.setString(3, a.getWriter());
			pstmt.executeUpdate();
			con.commit();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("DB에러:" + e.getMessage());
			try {
				con.rollback();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				System.out.println("roolback 에러:" + e.getMessage());
			}
		} catch (Exception e) {
			System.out.println("일반 에러:" + e.getMessage());
		} finally {
			DB.close(rs, pstmt, con);
		}
	}

	public void RunInsertApplication() {
		UserDao dao = new UserDao();
		System.out.println("# 도서신청 #");
		System.out.println("신청자 아이디와 신청도서정보를 입력해주세요.");
		System.out.print("▶아이디 : ");
		String apid = sc.nextLine();
		System.out.print("▶도서명 : ");
		String apbookname = sc.nextLine();
		System.out.print("▶저자 : ");
		String apwriter = sc.nextLine();
		dao.InsertApplication(new Application(apid, apbookname, apwriter));
		System.out.println("도서신청이 접수되었습니다.");
	}

	// 도서검색
	public List<Library_Book> SearchBook(Library_Book sch) {
		List<Library_Book> list = new ArrayList<Library_Book>();
		String sql = "SELECT * \r\n" + "FROM LIBRARY_BOOK lb \r\n" + "WHERE BNUMBER = ?";
		try {
			con = DB.con();
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, sch.getBnumber());
			rs = pstmt.executeQuery();
			while (rs.next()) {
				list.add(new Library_Book(rs.getInt("bnumber"), rs.getString("isbn"), rs.getString("bname"),
						rs.getString("writer"), rs.getString("publisher"), rs.getString("cont"),
						rs.getString("possible")));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("DB에러:" + e.getMessage());
		} catch (Exception e) {
			System.out.println("일반 에러:" + e.getMessage());
		} finally {
			DB.close(rs, pstmt, con);
		}
		return list;
	}

	public void RunSearchBook() {
		UserDao dao = new UserDao();
		System.out.println("# 도서검색 #");
		System.out.println("검색할 책의 도서번호를 입력하세요.");
		System.out.print("▶도서번호 : ");
		int bnumber = sc.nextInt();
		System.out.println("도서번호\t일련번호\t도서명\t저자\t출판사\t분류번호\t대여가능여부");
		for (Library_Book lb : dao.SearchBook(new Library_Book(bnumber))) {
			System.out.print(lb.getBnumber() + "\t");
			System.out.print(lb.getIsbn() + "\t");
			System.out.print(lb.getBname() + "\t");
			System.out.print(lb.getWriter() + "\t");
			System.out.print(lb.getPublisher() + "\t");
			System.out.print(lb.getCont() + "\t");
			System.out.print(lb.getPossible() + "\n");
		}
	}

	// 대출목록
	public List<Lending> MyLendingList(Lending sch) {
		List<Lending> list = new ArrayList<Lending>();
		String sql = "SELECT id, bnumber, ldate, (ldate+14)+extension*7 duedate, sysdate, extension,\r\n"
				+ "	CASE\r\n" + "	WHEN -1*ceil((ldate+14)-sysdate) > 0 THEN 'D+'||floor(sysdate-(ldate+14))\r\n"
				+ "	ELSE 'D'||-1*ceil((ldate+14)-sysdate) END days,\r\n" + "	CASE\r\n"
				+ "	WHEN 300*(floor(sysdate-(ldate+14))) < 0 THEN 0\r\n"
				+ "	ELSE 300*(floor(sysdate-(ldate+14)))\r\n" + "	end charge\r\n" + "FROM lending\r\n"
				+ "WHERE id = ?";
		try {
			con = DB.con();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, sch.getId());
			rs = pstmt.executeQuery();
			while (rs.next()) {
				list.add(new Lending(rs.getString("id"), rs.getInt("bnumber"), rs.getDate("ldate"),
						rs.getInt("extension"), rs.getDate("duedate"), rs.getDate("sysdate"), rs.getString("days"),
						rs.getInt("charge")));
			}
			if (list.size() == 0) {
				System.out.println("대여한 도서가 없습니다.");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("DB에러:" + e.getMessage());
		} catch (Exception e) {
			System.out.println("일반 에러:" + e.getMessage());
		} finally {
			DB.close(rs, pstmt, con);
		}
		return list;
	}

//	public void RunMyLendingList() {
//		UserDao dao = new UserDao();
//		System.out.println("# 대출목록 #");
//		System.out.println("본인 확인을 위해 아이디를 입력하세요.");
//		System.out.print("▶아이디 : ");
//		String id = sc.nextLine();
//		System.out.println("아이디\t도서번호\t대출일자\t\t연장횟수\t반납기한\t\t현재날짜\t\t남은일수\t연체료");
//		for (Lending ld : dao.MyLendingList(new Lending(id))) {
//			System.out.print(ld.getId() + "\t");
//			System.out.print(ld.getBnumber() + "\t");
//			System.out.print(ld.getLdate() + "\t");
//			System.out.print(ld.getExtension() + "\t");
//			System.out.print(ld.getDuedate() + "\t");
//			System.out.print(ld.getSysdate() + "\t");
//			System.out.print(ld.getDays() + "\t");
//			System.out.print(ld.getCharge() + "\n");
//		}
//	}

	// 반납일자
	public List<Lending> DuedateList(Lending sch) {
		List<Lending> list = new ArrayList<Lending>();
		String sql = "SELECT id, bnumber, ldate, (ldate+14)+extension*7 duedate, sysdate, extension,\r\n"
				+ "	CASE\r\n" + "	WHEN -1*ceil((ldate+14)-sysdate) > 0 THEN 'D+'||floor(sysdate-(ldate+14))\r\n"
				+ "	ELSE 'D'||-1*ceil((ldate+14)-sysdate) END days,\r\n" + "	CASE\r\n"
				+ "	WHEN 300*(floor(sysdate-(ldate+14))) < 0 THEN 0\r\n"
				+ "	ELSE 300*(floor(sysdate-(ldate+14)))\r\n" + "	end charge\r\n" + "FROM lending\r\n"
				+ "WHERE id = ?";
		try {
			con = DB.con();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, sch.getId());
			rs = pstmt.executeQuery();
			while (rs.next()) {
				list.add(new Lending(rs.getString("id"), rs.getInt("bnumber"), rs.getDate("ldate"),
						rs.getInt("extension"), rs.getDate("duedate"), rs.getDate("sysdate"), rs.getString("days"),
						rs.getInt("charge")));
			}
			System.out.println("대여한 도서는 총" + list.size() + "권 입니다.");
			if (list.size() == 0) {
				System.out.println("대여한 도서가 없습니다.");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("DB에러:" + e.getMessage());
		} catch (Exception e) {
			System.out.println("일반 에러:" + e.getMessage());
		} finally {
			DB.close(rs, pstmt, con);
		}
		return list;
	}

//	public void RunDuedateList() {
//		UserDao dao = new UserDao();
//		System.out.println("# 반납일자 #");
//		System.out.println("본인 확인을 위해 아이디를 입력하세요.");
//		System.out.print("▶아이디 : ");
//		String id = sc.nextLine();
//		for (Lending ld : dao.DaysList(new Lending(id))) {
//			System.out.println();
//			System.out.println(ld.getId() + "님이 대여한 도서번호 " + ld.getBnumber() + "의 반납일자는 " + ld.getDuedate() + "입니다.");
//		}
//	}

	// 연장신청
	public void Extension(int bnumber) {
		String sql = "UPDATE LENDING SET EXTENSION = 1\r\n" + "WHERE BNUMBER = ?";
		try {
			con = DB.con();
			con.setAutoCommit(false);
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, bnumber);
			pstmt.executeUpdate();
			con.commit();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("DB에러:" + e.getMessage());
			try {
				con.rollback();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				System.out.println("roolback 에러:" + e.getMessage());
			}
		} catch (Exception e) {
			System.out.println("일반 에러:" + e.getMessage());
		} finally {
			DB.close(rs, pstmt, con);
		}
	}

	// 연체료
	public List<Lending> ChargeList(Lending sch) {
		List<Lending> list = new ArrayList<Lending>();
		String sql = "SELECT id, bnumber, ldate, (ldate+14)+extension*7 duedate, sysdate, extension,\r\n"
				+ "	CASE\r\n" + "	WHEN -1*ceil((ldate+14)-sysdate) > 0 THEN 'D+'||floor(sysdate-(ldate+14))\r\n"
				+ "	ELSE 'D'||-1*ceil((ldate+14)-sysdate) END days,\r\n" + "	CASE\r\n"
				+ "	WHEN 300*(floor(sysdate-(ldate+14))) < 0 THEN 0\r\n"
				+ "	ELSE 300*(floor(sysdate-(ldate+14)))\r\n" + "	end charge\r\n" + "FROM lending\r\n"
				+ "WHERE id = ?";
		try {
			con = DB.con();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, sch.getId());
			rs = pstmt.executeQuery();
			while (rs.next()) {
				list.add(new Lending(rs.getString("id"), rs.getInt("bnumber"), rs.getDate("ldate"),
						rs.getInt("extension"), rs.getDate("duedate"), rs.getDate("sysdate"), rs.getString("days"),
						rs.getInt("charge")));
			}
			if (list.size() == 0) {
				System.out.println("대여한 도서가 없습니다.");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("DB에러:" + e.getMessage());
		} catch (Exception e) {
			System.out.println("일반 에러:" + e.getMessage());
		} finally {
			DB.close(rs, pstmt, con);
		}
		return list;
	}

//	public void RunChargeList() {
//		UserDao dao = new UserDao();
//		System.out.println("# 연체료 #");
//		System.out.println("본인 확인을 위해 아이디를 입력하세요.");
//		System.out.print("▶아이디 : ");
//		String id = sc.nextLine();
//		for (Lending ld : dao.ChargeList(new Lending(id))) {
//			System.out.println();
//			System.out.println(ld.getId() + "님이 대여한 도서번호 " + ld.getBnumber() + "의 연체료는 " + ld.getCharge() + "원 입니다.");
//		}
//		System.out.println("연체료를 결제해주세요.");
//	}

	// 남은기간
	public List<Lending> DaysList(Lending sch) {
		List<Lending> list = new ArrayList<Lending>();
		String sql = "SELECT id, bnumber, ldate, (ldate+14)+extension*7 duedate, sysdate, extension,\r\n"
				+ "	CASE\r\n" + "	WHEN -1*ceil((ldate+14)-sysdate) > 0 THEN 'D+'||floor(sysdate-(ldate+14))\r\n"
				+ "	ELSE 'D'||-1*ceil((ldate+14)-sysdate) END days,\r\n" + "	CASE\r\n"
				+ "	WHEN 300*(floor(sysdate-(ldate+14))) < 0 THEN 0\r\n"
				+ "	ELSE 300*(floor(sysdate-(ldate+14)))\r\n" + "	end charge\r\n" + "FROM lending\r\n"
				+ "WHERE id = ?";
		try {
			con = DB.con();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, sch.getId());
			rs = pstmt.executeQuery();
			while (rs.next()) {
				list.add(new Lending(rs.getString("id"), rs.getInt("bnumber"), rs.getDate("ldate"),
						rs.getInt("extension"), rs.getDate("duedate"), rs.getDate("sysdate"), rs.getString("days"),
						rs.getInt("charge")));
			}
			System.out.println("반납해야할 도서는 총 " + list.size() + "권 입니다.");
			if (list.size() == 0) {
				System.out.println("대여한 도서가 없습니다.");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("DB에러:" + e.getMessage());
		} catch (Exception e) {
			System.out.println("일반 에러:" + e.getMessage());
		} finally {
			DB.close(rs, pstmt, con);
		}
		return list;
	}

//	public void RunDaysList() {
//		UserDao dao = new UserDao();
//		System.out.println("# 남은기간 #");
//		System.out.println("본인 확인을 위해 아이디를 입력하세요.");
//		System.out.print("▶아이디 : ");
//		String id = sc.nextLine();
//		for (Lending ld : dao.DaysList(new Lending(id))) {
//			System.out.println();
//			System.out.println(ld.getId() + "님이 대여한 도서번호 " + ld.getBnumber() + "의 남은기간은 " + ld.getDays() + "일 입니다.");
//		}
//	}

	// 랭킹
	public List<Rank> MemRank(Rank r) {
		List<Rank> list = new ArrayList<Rank>();
		String sql = "SELECT * FROM \r\n" + "(SELECT id,count(id), to_char(sysdate, 'YYYY-MM') FROM RLIST\r\n"
				+ "WHERE to_char(sysdate, 'YYYY-MM')=to_char(rdate,'YYYY-MM')\r\n"
				+ "GROUP BY id ORDER BY count(id) desc)\r\n" + "WHERE rownum =1";
		try {
			con = DB.con();
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				list.add(new Rank(rs.getString("id")));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("DB에러:" + e.getMessage());
		} catch (Exception e) {
			System.out.println("일반 에러:" + e.getMessage());
		} finally {
			DB.close(rs, pstmt, con);
		}
		return list;
	}

	public void RunMemRank() {
		UserDao dao = new UserDao();
		System.out.println("# 이달의 독서왕 #");
		for (Rank r : dao.MemRank(new Rank())) {
			System.out.println(r.getId() + "님이 이달의 독서왕입니다!");
		}
	}

	public List<Rank> BookRank(Rank r) {
		List<Rank> list = new ArrayList<Rank>();
		String sql = "SELECT * \r\n" + "FROM (SELECT bnumber \r\n" + "FROM RLIST\r\n" + "GROUP BY BNUMBER \r\n"
				+ "ORDER BY count(BNUMBER) DESC)\r\n" + "WHERE rownum = 1";
		try {
			con = DB.con();
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				list.add(new Rank(rs.getInt("bnumber")));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("DB에러:" + e.getMessage());
		} catch (Exception e) {
			System.out.println("일반 에러:" + e.getMessage());
		} finally {
			DB.close(rs, pstmt, con);
		}
		return list;
	}

	public void RunBookRank() {
		UserDao dao = new UserDao();
		System.out.println("# 베스트 도서 #");
		for (Rank r : dao.BookRank(new Rank())) {
			System.out.println(r.getBnumber() + "번도서가 가장 많이 빌린 도서입니다!");
		}
	}

	// 도서리뷰작성
	public void InsertReview(Review r) {
		String sql = "INSERT INTO Review values(?,?,?,?)";
		try {
			con = DB.con();
			con.setAutoCommit(false);
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, r.getId());
			pstmt.setInt(2, r.getBnumber());
			pstmt.setInt(3, r.getScore());
			pstmt.setString(4, r.getContents());
			pstmt.executeUpdate();
			con.commit();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("DB에러:" + e.getMessage());
			try {
				con.rollback();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				System.out.println("roolback 에러:" + e.getMessage());
			}
		} catch (Exception e) {
			System.out.println("일반 에러:" + e.getMessage());
		} finally {
			DB.close(rs, pstmt, con);
		}
	}

//	public void RunInsertReview() {
//		UserDao dao = new UserDao();
//		System.out.println("# 도서리뷰작성 #");
//		System.out.println("양식대로 입력해주세요.");
//		System.out.print("▶아이디 : ");
//		String id = sc.nextLine();
//		System.out.print("▶도서번호 : ");
//		int bnumber = sc.nextInt();
//		System.out.print("▶점수(1~5) : ");
//		int score = sc.nextInt();
//		System.out.print("▶리뷰 : ");
//		String contents = sc.nextLine();
//		dao.InsertReview(new Review(id, bnumber, score, contents));
//		System.out.println("리뷰를 작성해주셔서 감사합니다!");
//	}

	// 도서리뷰보기
	public List<Review> ReviewList(Review sch) {
		List<Review> rlist = new ArrayList<Review>();
		String sql = "SELECT * FROM Review WHERE bnumber = ?";
		try {
			con = DB.con();
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, sch.getBnumber());
			rs = pstmt.executeQuery();
			while (rs.next()) {
				rlist.add(new Review(rs.getString("id"), rs.getInt("bnumber"), rs.getInt("score"),
						rs.getString("contents")));
			}
			if (rlist.size() == 0) {
				System.out.println("작성된 리뷰가 없습니다.");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("DB에러:" + e.getMessage());
		} catch (Exception e) {
			System.out.println("일반 에러:" + e.getMessage());
		} finally {
			DB.close(rs, pstmt, con);
		}
		return rlist;
	}

	public void RunReviewList() {
		UserDao dao = new UserDao();
		System.out.println("# 도서리뷰보기 #");
		System.out.println("리뷰보기를 원하는 도서번호를 입력해주세요.");
		System.out.print("▶도서번호 : ");
		int bnumber = sc.nextInt();
		System.out.println("아이디\t도서번호\t별점\t리뷰내용");
		for (Review r : dao.ReviewList(new Review(bnumber))) {
			System.out.print(r.getId() + "\t");
			System.out.print(r.getBnumber() + "\t");
			System.out.print(r.getScore() + "\t");
			System.out.print(r.getContents() + "\n");
		}
	}

}
