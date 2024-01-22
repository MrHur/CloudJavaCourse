package quiz;

import java.util.Scanner;

public class GugudanTwoNum {

	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		System.out.println("원하는 단의 숫자를 입력해주세요.");
		int a = sc.nextInt();
		int b = sc.nextInt();
		Gugudan_2 gugu = new Gugudan_2();

		if (a >= b) {
			for (int i = b; i <= a; i++) {
				gugu.gugudan(i);
			}
		} else {
			for (int i = a; i <= b; i++) {
				gugu.gugudan(i);
			}

		}
	}
}

class Gugudan_2 {
	void gugudan(int dan) {
		System.out.println(dan + "단");
		int result = 0;
		for (int i = 1; i <= 9; i++) {
			result = dan * i;
			System.out.println(dan + " * " + i + " = " + result);
		}
	}
}
