package quiz;

import java.util.Scanner;

public class ForVariableEx2 {

	public static void main(String[] args) {
		// 사용자에게 숫자를 받아 그 숫자까지의 팩토리얼을 구하시오.
		// 단, 1~n을 곱하지 않고 n ~ 1 을 곱하는 방식으로 합니다.		
		Scanner sc = new Scanner(System.in);
		System.out.print("N을 입력해 주세요.");	
		int num = sc.nextInt();
		int factorial = 1;
		for(int i=num; 0<i && i<=num; i--) {
			factorial *= i; 
		}
		System.out.println(factorial);
		sc.close();
	}
}
