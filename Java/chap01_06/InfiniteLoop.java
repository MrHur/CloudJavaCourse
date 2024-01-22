package quiz;

import java.util.Scanner;

public class InfiniteLoop {

	public static void main(String[] args) {
//		생일을 받아서 별자리를 보여주는 프로그램을 작성합니다.
//		무한루프이며 생월이 0일시에는 루프를 종료합니다.
//		또한 예외처리를 통해 잘못된 생월, 생일(13월 82일)같은 잘못된 값이
//		입력되지 않게 방지합니다.

//		스캐너 객체 생성
		Scanner sc = new Scanner(System.in);
//		무한 루프
		while (true) {
//		월 / 일을 입력 받음.
			System.out.print("월을 입력해주세요(0은 종료): ");
			int month = sc.nextInt();
			System.out.print("생일을 입력해주세요(0은 종료): ");
			int day = sc.nextInt();
//			조건 4. 월별 유효 일자가 다르므로 해당 월과 일을 비교하여, 유효값을 벗어 났을 때 무한루프를 빠져나와 다시 입력받음.
			if ((month == 2 && day > 28) || ((month == 4 || month == 6 || month == 9 || month == 11) && (day > 30))) {
				System.out.println("잘못 입력되었습니다. 다시 입력");
			} else {
//			조건 1. 잘못 된 월 / 일을 입력 받으면 다시 입력 받음.
				if (((month >= 13) || (month < 1)) || ((1 > day) || (day > 31))) {
//				조건 2. 0을 입력 받게되면 종료.
					if ((month == 0) || (day == 0)) {
						break;
					}
					System.out.println("잘못입력하셨습니다. 다시 입력");
				} else {
//				조건 3. 별자리 출력.
					switch (month) {
					case 1:
						if (day >= 20) {
							System.out.println("물병좌리");
						} else {
							System.out.println("염소자리");
						}
						break;
					case 2:
						if (day >= 19) {
							System.out.println("물괴기자리");
						} else {
							System.out.println("물병자리");
						}
						break;
					case 3:
						if (day >= 21) {
							System.out.println("양자리");
						} else {
							System.out.println("물괴기자릐");
						}
						break;
					case 4:
						if (day >= 20) {
							System.out.println("황소자리");
						} else {
							System.out.println("양자리");
						}
						break;
					case 5:
						if (day >= 21) {
							System.out.println("쌍동이자리");
						} else {
							System.out.println("황소자리");
						}
						break;
					case 6:
						if (day >= 22) {
							System.out.println("게자리");
						} else {
							System.out.println("쌍둥이자리");
						}
						break;
					case 7:
						if (day >= 23) {
							System.out.println("사자자리");
						} else {
							System.out.println("게자리");
						}
						break;
					case 8:
						if (day >= 23) {
							System.out.println("처녀자리");
						} else {
							System.out.println("사자자리");
						}
						break;
					case 9:
						if (day >= 24) {
							System.out.println("천칭자리");
						} else {
							System.out.println("처녀자리");
						}
						break;
					case 10:
						if (day >= 23) {
							System.out.println("전갈자리");
						} else {
							System.out.println("천칭자리");
						}
						break;
					case 11:
						if (day >= 23) {
							System.out.println("궁수자리");
						} else {
							System.out.println("전갈자리");
						}
						break;
					default:
						if (day >= 25) {
							System.out.println("염소자리");
						} else {
							System.out.println("궁수자리");
						}
						break;
					}
				}
			}
		}
//				스캐너 아웃
		sc.close();
	}
}
