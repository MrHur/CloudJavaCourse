package quiz;

import java.util.Scanner;

public class BankBook {
		Scanner sc = new Scanner(System.in);
		int money_in, money_out, money;
		
	    void deposit(int a) {
	        money += a;
	        System.out.print("입금액 : " + money+" ");
	        showMoney();
	    }

	    void withdraw(int b) {
	        if (money < b) {
	            System.out.println("금액이 부족합니다.");
	        } else {
	            money -= b;
	            System.out.print(b+"원 출금 ");
	            showMoney();
	        }
	    }

	    void showMoney() {
	    	if(money>0) {
	        System.out.println("현재 잔액은 : " + money);
	    	} else {
	    		System.out.println("최종 잔액은 : " + money + "원 입니다.");
	    	}
	    }
	}

