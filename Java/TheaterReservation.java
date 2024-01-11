package quiz;

import java.util.Scanner;

public class TheaterReservation {

	public static void main(String[] args) {
//		영화관 좌석 예매(좌석 개수 : 7개)
//		1. 사용자로부터 좌석번호(index)를 입력받아 예매하는 시스템이다.
//		2. 예매가 완료되면 해당 좌석 값을 1로 변경한다.
//		3. 이미 예매가 완료된 좌석은 재구매 할 수 없다.
//		4. 한 좌선당 예매 가격은 12000원이다.
//		5. 프로그램 종료 후, 해당 영화관의 총매출액을 출력한다.
		Scanner sc = new Scanner(System.in);
		int[] ticket = {0,0,0,0,0,0,0};
		int seat = 0;

		while (true) {
			System.out.println("=MIT영화관=");
			System.out.println("1.좌석 선택");
			System.out.println("2.종료");
			int selectNum = sc.nextInt();

			if (selectNum == 1) {
				System.out.println("[0~6] 좌석을 선택해주세요.");
				int reservation = sc.nextInt();
				if(ticket[reservation]==1) {
					System.out.println("해당 좌석은 이미 예약되었습니다.");
				} else if(ticket[reservation]==0){
					ticket[reservation]=1;
					seat++;
				}			
				System.out.println("좌석현황:");
				for(int i =0; i<ticket.length;i++) {
					System.out.print(ticket[i]);
				}
				System.out.println("");

			}else if(selectNum == 2) {
				System.out.println("프로그램을 종료합니다.");
				System.out.println("매출액: " + 12000 * seat);
				break;
			}
		}
	sc.close();
	}
}
