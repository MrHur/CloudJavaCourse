package quiz;

import java.util.Scanner;

public class AccountEx2 {

	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		Account2[] accounts = new Account2[100];
//		account[0] = new Account("허준혁", "12345", 10000);
//		account[1] = new Account("김영희", "67890", 20000);
//		account[2] = new Account("이철수", "13579", 15000);
//		account[3] = new Account("박미자", "24680", 30000);
		boolean run = true;
		while (run) {
			System.out.println("MIT 뱅크에 오신것을 환영합니다.");
			System.out.println("메뉴를 선택해 주세요.");
			System.out.println("1. 계좌 생성");
			System.out.println("2. 계좌 업무");
			System.out.println("3. 종료");
			System.out.print("선택>");
			int selectMenu = Integer.parseInt(sc.nextLine());

			switch (selectMenu) {
			case 1: // 계좌 생성 기능
				System.out.println("계좌를 생성합니다.");
				System.out.println("예금주 이름을 입력하세요.");
				System.out.print(">");
				String name = sc.nextLine();
				System.out.println("계좌번호을 입력하세요.");
				System.out.print(">");
				String accountNumber = sc.nextLine();
				System.out.println("초기 입금액을 입력하세요.");
				System.out.print(">");
				int balance = Integer.parseInt(sc.nextLine());

				Account2 newAccount = new Account2(name, accountNumber, balance);
				for (int i = 0; i < accounts.length; i++) {
					if (accounts[i] == null) {
						accounts[i] = newAccount;
						break;
					}
				}
				System.out.println("계좌 생성");
				break;
			case 2:
				accounts[0].checkId();
				int selectNum2 = accounts[0].menu2();
				switch (selectNum2) {
				case 1:
					int deposit= Integer.parseInt(sc.nextLine());
					accounts[0].deposit(deposit);
					break;
				case 2:
					int withdraw = Integer.parseInt(sc.nextLine());
					accounts[0].withdraw(withdraw);
					break;
				case 3:
					accounts[0].checkBalance();
					break;
				case 0:
					accounts[0].closeAccount();
				}
				break;

			case 3:
				accounts[0].exit();
				run = false;
				break;

			}
		}
	}

}
