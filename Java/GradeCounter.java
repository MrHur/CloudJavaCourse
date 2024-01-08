package quiz;

import java.util.Scanner;

public class GradeCounter {

	public static void main(String[] args) {
//		학생의 점수를 받아 수우미양가를 보여주는 프로그램을 만드세요.
//		조건. 점수가 -1이면 프로그램을 종료합니다.
		Scanner sc = new Scanner(System.in);
		while (true) {
			System.out.println("점수를 입력해 주세요 :");
			int score = sc.nextInt();

			if (score == -1) {
				System.out.println("프로그램을 종료합니다.");
				break;
			}

			if (90 <= score && score <= 100) {
				System.out.println("수");
			} else if (80 <= score && score <= 89) {
				System.out.println("우");
			} else if (70 <= score && score <= 79) {
				System.out.println("미");
			} else if (60 <= score && score <= 69) {
				System.out.println("양");
			} else if (0 <= score && score <= 59) {
				System.out.println("가");
			}
		}
		sc.close();
	}
}
