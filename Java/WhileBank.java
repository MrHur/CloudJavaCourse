package quiz;

import java.util.Scanner;

public class WhileBank {

	public static void main(String[] args) {
//		While문과 scanner를 이용해서 키보드로 입력된 데이터로
//		예금, 출금, 조회, 종료 기능을 제공하는 코드를 작성해 보세요.
//		오른쪽과 같은 결과를 도출하세요. (scanner의 nextline() 사용)

		boolean run = true;
		int balance = 0;
		Scanner sc = new Scanner(System.in);

		while (run) {
			System.out.println("-----------------------------------");
			System.out.println("1.예금 | 2. 출금 | 3.잔고 | 4.종료");
			System.out.println("-----------------------------------");
			System.out.print("선택> ");
			int num1 = sc.nextInt();
			if (num1 == 1) {
				System.out.print("예금액> ");
				int getmoney = sc.nextInt();
				balance += getmoney;
			}
			if (num1 == 2) {
				System.out.print("출금액> ");
				int nomoney = sc.nextInt();
				balance -= nomoney;
			}
			if (num1 == 3) {
				System.out.println("잔고> "+balance);				
			}
			if (num1 == 4) {
				break;
			}
		}
		System.out.println("프로그램 종료");
	}
}
