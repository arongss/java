package javaexp.a05_restore;

public class A05_MultiArray {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		/*
		# 다차원 배열
		1. 2차원 배열 이상의 배열을 말한다.
			- 수학의 행렬과 같은 자료 구조
		2. 자바는 1차원 배열을 이용해 2차원 배열 구현한다.
			int[][]scores = new int[2][3];
			scores[0][0]= 1000;
			scores[0][1]= 2000;
			scores[0][2]= 3000;
			scores[1][0]= 4000;
			scores[1][1]= 5000;
			scores[1][2]= 6000;
		3. 이차원 배열의 선언/할당
			int[][] prices = {{1000,2000,3000},{4000,5000,6000}};
			
		 * */
		// 기차의 구조.
		String[][] trains = new String[6][70];
		// 1호차에 1번좌석
		trains[0][0] = "★";
		// 2호차에 3변좌석
		trains[1][2] = "★";
		
		for(int idx=0;idx<trains.length;idx++) {
			System.out.println(idx+1+"호차 좌석번호:");
			// trains[idx].length : 각 호차 소속된 좌석번호
			for(int jdx=0;jdx<trains[idx].length;jdx++) {
				System.out.print(jdx+1+"번 "+trains[idx][jdx]+" ");
			}
			System.out.println();
		}
		// ex) 고등학교 1~3학년, 1~10반을 2차원 배열로 선언하여
		//		각 반에 학생을 기본값을 30명씩 할당하여 처리해보자.
		//		1) 정수형 2차원 배열을 선언하세요..
		//		2) 할당(2중for문을통해)
		int[][] hiSch = new int[3][10];
		for(int idx=0;idx<hiSch.length;idx++) {
			System.out.println(idx+1+"학년 반:");
			// hiSch[idx].length : 학년별 반의 수
			for(int jdx=0;jdx<hiSch[idx].length;jdx++) {
				hiSch[idx][jdx]=30;
				System.out.print(jdx+1+"반-"+hiSch[idx][jdx]+"명, ");
			}
			System.out.println();
		}
		// ex) 3개 부서별로 팀원3명씩 할당된 내용을 2차원 배열(String)로 나타내세요.
		String[][]teams = {
				{"김철수","오영희","이영수"},
				{"홍라희","배연정","민현식"},
				{"오나라","이혜영","김영희"}
		};
		for(int idx=0;idx<teams.length;idx++) {
			System.out.println(idx+1+"번째 부서 명단:");
			for(int jdx=0;jdx<teams[idx].length;jdx++) {
				System.out.print(teams[idx][jdx]+", ");
			}
			System.out.println();
		}
	}

}
