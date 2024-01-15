package quiz;

import java.util.Scanner;

public class BankBookEx {

	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		BankBook bb = new BankBook();
	
		System.out.println("현재 잔액은 : 0");
		for(int i=0; i<2; i++) {
			int a,b;
		System.out.print("입금액: ");
		a = sc.nextInt();
		bb.deposit(a);
		System.out.print("출금액: ");
		b = sc.nextInt();
		bb.withdraw(b);
		}
	}
}
