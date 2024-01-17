package quiz;

import java.util.Scanner;

public class BankEx {
	public static void main(String[] args) {
		Bank account = new Bank();
		Scanner sc = new Scanner(System.in);
		System.out.println("안녕하세요 G BANK입니다.");
		boolean run = true;
		while (run) {
			System.out.println("*************************");
			System.out.println("그린 뱅크에 오신것을 환영합니다.");
			System.out.println("메뉴를 선택해주세요.");
			System.out.println("1. 예금");
			System.out.println("2. 출금");
			System.out.println("3. 잔액조회");
			System.out.println("4. 종료");
			System.out.print(">");
			int selectNum = sc.nextInt();
			switch (selectNum) {
			case 1:
				System.out.println("예금할 금액을 입력하세요: ");
				int depositAmount = sc.nextInt();
				account.deposit(depositAmount);
				break;

			case 2:
				System.out.println("출금할 금액을 입력하세요: ");
				int withdrawAmount = sc.nextInt();
				account.withdraw(withdrawAmount);
				break;

			case 3:
				account.checkBalance();
				break;

			case 4:
				account.closeAccount();
				sc.close();
//				System.exit(0);
//				return;
				run = false;
				break;

			default:
				System.out.println("잘못 입력하였습니다.");
				System.out.println("1~4 값 중 선택해주세요.");
			}
		}
	}
}
