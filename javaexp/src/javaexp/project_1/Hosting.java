package javaexp.project_1;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.util.Scanner;

public class Hosting {
	private static int roomNum = 0;
	private static RoomInfo[] room = new RoomInfo[1]; 
	private static Scanner sc = new Scanner(System.in);
	private static String name, kind, loc, facility, period;
	private static int capacity, price;
	private static int num;

	public static void host() {
		System.out.println("# 에어비앤비에서 호스팅을 시작해보세요 #");
		System.out.println("숙소 이름을 만들어주세요.");
		name = sc.next();
		room[roomNum].setRoomName(name);
		System.out.println("게스트가 머무르게 될 숙소의 종류가 무엇인가요?");
		kind = sc.next();
		room[roomNum].setRoomKind(kind);
		System.out.println("숙소의 위치는 어디인가요?");
		loc = sc.next();
		room[roomNum].setRoomLoc(loc);
		System.out.println("숙소 편의시설 정보를 추가해 주세요.");
		facility = sc.next();
		room[roomNum].setRoomFacility(facility);
		System.out.println("게스트가 최대 얼마동안 숙박할 수 있나요?");
		period = sc.next();
		room[roomNum].setRoomPeriod(period);
		System.out.println("숙소에서 맞이할 최대 인원수를 알려주세요.");
		capacity = sc.nextInt();
		room[roomNum].setRoomCapacity(capacity);
		System.out.println("숙소 1박요금을 설정해 주세요.");
		price = sc.nextInt();
		room[roomNum].setRoomPrice(price);
		System.out.println("에어비앤비의 호스트가 되신것을 축하드립니다!!");
		roomNum++;
	}

	public static void check() {
		for (RoomInfo rooms : room) {
			if (rooms.getRoomName() != null) {
				System.out.println("숙소이름: " + rooms.getRoomName());
				System.out.println("숙소유형: " + rooms.getRoomKind());
				System.out.println("숙소위치: " + rooms.getRoomLoc());
				System.out.println("편의시설: " + rooms.getRoomFacility());
				System.out.println("최대숙박기간: " + rooms.getRoomPeriod() + "일");
				System.out.println("최대인원수: " + rooms.getRoomCapacity() + "명");
				System.out.println("숙박요금: " + rooms.getRoomPrice() + "원");
			} else if (rooms.getRoomName() == null) {
				System.out.println("등록된 숙소 정보가 없습니다!"); // 숙소정보가 없을 때 
			}
		}
	}

	public static void remove() {
		System.out.print("숙소이름을 입력하세요: ");
		name = sc.next();
		int remove = 0;
		for (int cnt = 0; cnt < room.length; cnt++) {
			if (name.equals(room[cnt].getRoomName())) {
				System.out.println("숙소 삭제 성공");
				room[cnt].setRoomName(null);
				room[cnt].setRoomKind(null);
				room[cnt].setRoomLoc(null);
				room[cnt].setRoomFacility(null);
				room[cnt].setRoomPeriod(null);
				room[cnt].setRoomCapacity(0);
				room[cnt].setRoomPrice(0);
				remove = 1;
			}
		}
		if (remove == 0)
			System.out.println("숙소정보없음");
	}

	public static void booking() {
		FileReader reader;
		try {
			reader = new FileReader("C:\\a01_javaexp\\workspace\\javaexp\\src\\javaexp\\a00_miniproject\\Booking.txt");
			int ch;
			try {
				while ((ch = reader.read()) != -1) {
					System.out.print((char) ch);
				}
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace(); // 입출력 오류 처리
			}
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace(); // 파일 찾을 수 없을 때 오류 처리
		}
	}

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		for (int cnt = 0; cnt < 1; cnt++) {
			room[cnt] = new RoomInfo();
		}
		boolean run = true;
		do{
			System.out.println("## 에어비앤비 호스트 시작하기 ##");
			System.out.println("1.숙소등록	 2.숙소확인  3.숙소삭제  4.예약확인");
			System.out.print("원하는 번호를 입력하세요(종료는 -1): ");
			int num = sc.nextInt();
			switch (num) {
			case 1:
				if (roomNum >= 1) { // 등록가능항 숙소갯수를 1개로 제한
					System.out.println("방 등록 갯수 초과"); 
				} else {
					host(); //숙소등록
				}
				break;
			case 2:
				check(); //숙소확인
				break;
			case 3:
				remove(); //숙소삭제
				break;
			case 4:
				booking(); //예약확인
				break;
			case -1:
				System.out.println("프로그램을 종료하고 메뉴로 돌아갑니다."); //종료
				break;
			default :
				System.out.println("잘못된 입력입니다.");
			}
		}while(run);
		
	}
}

class RoomInfo {
	private String roomName; // 숙소이름
	private String roomKind; // 숙소유형
	private String roomLoc; // 숙소위치
	private String roomFacility; // 편의시설
	private String roomPeriod; // 숙박기간
	private int roomCapacity; // 숙소 최대인원수
	private int roomPrice; // 숙박요금

	public RoomInfo(String roomName, String roomKind, String roomLoc, String roomFacility, String roomPeriod,
			int roomCapacity, int roomPrice) {
		this.roomName = roomName;
		this.roomKind = roomKind;
		this.roomLoc = roomLoc;
		this.roomFacility = roomFacility;
		this.roomPeriod = roomPeriod;
		this.roomCapacity = roomCapacity;
		this.roomPrice = roomPrice;
	}

	public RoomInfo() {
	}

	public String getRoomName() {
		return roomName;
	}

	public void setRoomName(String roomName) {
		this.roomName = roomName;
	}

	public String getRoomKind() {
		return roomKind;
	}

	public void setRoomKind(String roomKind) {
		this.roomKind = roomKind;
	}

	public String getRoomLoc() {
		return roomLoc;
	}

	public void setRoomLoc(String roomLoc) {
		this.roomLoc = roomLoc;
	}

	public String getRoomFacility() {
		return roomFacility;
	}

	public void setRoomFacility(String roomFacility) {
		this.roomFacility = roomFacility;
	}

	public String getRoomPeriod() {
		return roomPeriod;
	}

	public void setRoomPeriod(String roomPeriod) {
		this.roomPeriod = roomPeriod;
	}

	public int getRoomCapacity() {
		return roomCapacity;
	}

	public void setRoomCapacity(int roomCapacity) {
		this.roomCapacity = roomCapacity;
	}

	public int getRoomPrice() {
		return roomPrice;
	}

	public void setRoomPrice(int roomPrice) {
		this.roomPrice = roomPrice;
	}

}