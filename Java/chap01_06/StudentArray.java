package quiz;

import java.util.Scanner;

public class StudentArray {

	public static void main(String[] args) {
//		학생수(array)와 학생들의 점수를 입력 받아서,
//		최고 점수 및 평균 점수를 구하는 프로그램
//		스캐너 객체 생성.
		Scanner sc = new Scanner(System.in);
//      총점을 구할 때 사용할 sum 을 0으로 초기화.
		int sum = 0;

//		기본 입력 양식.
		System.out.println("--------------------------------------------------");
		System.out.println("1.학생수 | 2.점수입력 | 3.점수리스트 | 4.분석 | 5.종료");
		System.out.println("--------------------------------------------------");
//		무한 루프.
		while (true) {
//			선택 받기.
			System.out.print("선택> ");
			int select = sc.nextInt();
//			1번을 입력 받았을 경우.
			if (select == 1) {
				System.out.print("학생수> ");
//				학생의 값을 입력 받아 배열을 생성.
				int[] student = new int[sc.nextInt()];
//				학생의 길이 만큼 점수를 입력 받을 배열을 생성.
				int[] scores = new int[student.length];
				System.out.print("선택> ");
				select = sc.nextInt();
//				2번을 입력 받았을 경우.
//				빈 배열에 점수를 입력받음.
				if (select == 2) {
					for (int i = 0; i < student.length; i++) {
						System.out.print("scores[" + i + "] : ");
						scores[i] = sc.nextInt();
					}
					System.out.print("선택> ");
					select = sc.nextInt();
//					3번을 입력 받았을 경우.
//					점수 배열을 한 줄씩 출력.
					if (select == 3) {
						for (int i = 0; i < student.length; i++) {
							System.out.println("scores[" + i + "]:" + scores[i]);
						}
					}
					System.out.print("선택> ");
					select = sc.nextInt();
//					4번을 입력받았을 경우.
//					최고 점수와 평균 점수를 구함.
					if (select == 4) {
						for (int i = 0; i < student.length; i++) {
							sum += scores[i];
							if (scores[i] >= scores[1])
								scores[1] = scores[i];

						}
						System.out.println("최고 점수: " + scores[1]);
						System.out.println("평균 점수: " + sum / student.length);
					}
				}
			}
//			 5번을 입력받았을 경우.
//			 프로그램 종료.
			System.out.print("선택> ");
			select = sc.nextInt();
			if (select == 5) {
				System.out.println("프로그램 종료");
				break;
			}
		}
//			스캐너 아웃.
		sc.close();
	}
}
