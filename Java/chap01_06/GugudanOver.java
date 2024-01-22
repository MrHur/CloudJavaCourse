package quiz;

import java.util.Scanner;

public class GugudanOver {

	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		System.out.println("구구단에서 출력하고자 하는 단을 입력해주세요.");
		Gugudan_3 gugu = new Gugudan_3();
		int a = sc.nextInt();
		gugu.gugudan(a);
		
		int b = sc.nextInt();
		gugu.gugudan(a, b);
		
		sc.close();
	}
}

class Gugudan_3 {
	void gugudan(int a) {
		System.out.println(a + "단");
		int result = 0;
		for (int i = 1; i <= 9; i++) {
			result = a * i;
			System.out.println(a + " * " + i + " = " + result);
		}
	}

	void gugudan(int a, int b) {
		if(a>=b) {
			for (int i = b; i <= a; i++) {
				for(int j = 1; j<=9; j++) {
					System.out.println(i + " * " + j +" = " + i*j);
				}
			}
		} else {
			for (int i = a; i <= b; i++) {
				for(int j = 1; j<=9; j++) {
					System.out.println(i + " * " + j +" = " + i*j);					
				}
			}
		}
	}
}
