package quiz;

import java.util.Scanner;

public class Account2 {
	Scanner sc = new Scanner(System.in);
	// 필드
	private String account; // 예금주
	private String accountNumber; // 계좌번호
	private int balance; // 잔고

	// 생성자

	public Account2(String account, String accountNumber, int firstMoney) {
		this.account = account;
		this.accountNumber = accountNumber;
		this.balance = firstMoney;
	}

	// 메서드
	// 아이디 확인
	public void checkId() {
		System.out.println("사용하고자 하는 계좌 번호를 입력하세요.");
		 String inputAccountNumber = sc.nextLine();
		if (this.accountNumber.equals(inputAccountNumber)) {
			System.out.println(this.account+"님 환영합니다.");
		} else {
			System.out.println("해당 계좌가 없습니다.");
			return;
		}
	}

	// 계좌 메뉴
	public int menu1() {
		System.out.println("MIT 뱅크에 오신것을 환영합니다.");
		System.out.println("메뉴를 선택해 주세요.");
		System.out.println("1. 계좌 생성");
		System.out.println("2. 계좌 업무");
		System.out.println("3. 종료");
		System.out.print("선택>");
		int selectNum1 = Integer.parseInt(sc.nextLine());
//		createId();
		return selectNum1;
	}

	// 계좌 업무
	public int menu2() {
		System.out.println("MIT 뱅크에 오신것을 환영합니다.");
		System.out.println("업무를 선택해 주세요.");
		System.out.println("1. 입금");
		System.out.println("2. 출금");
		System.out.println("3. 잔액 조회");
		System.out.println("0. 메인메뉴 돌아가기");
		System.out.print(">");
		int selectNum2 = Integer.parseInt(sc.nextLine());
		return selectNum2;
	}

	// 프로그램 종료
	public static boolean exit() {
		System.out.println("프로그램을 종료합니다.");
		return false;
	}
	public String createId() {
		System.out.println("계좌를 생성합니다.");
		System.out.println("예금주 이름을 입력하세요.");
		System.out.print(">");
		this.account = sc.nextLine();
		return account;
	}
	// 입금
	public void deposit(int d) {		
			balance += d;
			System.out.println(balance + "원을 입금하였습니다.");
			getBalance();
	}

	// 출금
	public void withdraw(int w) {
		if (w <= balance) {
			balance -= w;
			System.out.println(balance + "원을 출금하였습니다.");
			getBalance();
		} else {
			System.out.println("잔액이 부족합니다.");
			getBalance();
		}
	}

	// 잔액 조회
	public int getBalance() {
		System.out.println("총 금액은: " + balance + "입니다.");
		return balance;
	}

	public int checkBalance() {
		System.out.println("잔액은: " + balance + "원 입니다.");
		return balance;
	}

	// 종료
	public void closeAccount() {
		System.out.println("메인 메뉴로 돌아갑니다.");
		// 추가적인 종료 작업 수행 가능
	}
}
