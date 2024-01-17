package quiz;

public class Bank {
	// 필드
	private int balance; // 잔액

	// 입금
	public void deposit(int amount) {
		if (amount < 1000000) {
			balance += amount;
			System.out.println(balance + "원을 입금하였습니다.");
			getBalance();
		} else {
			System.out.println("계좌잔고는 백만원을 초과 할 수 없습니다.");
			getBalance();
		}
	}

	// 출금
	public void withdraw(int amount) {
		if (amount <= balance) {
			balance -= amount;
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
		System.out.println("계좌를 종료합니다.");
		// 추가적인 종료 작업 수행 가능
	}
}
