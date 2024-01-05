package quiz;

import java.util.Scanner;

public class Quiz3_3 {

	public static void main(String[] args) {
		// 두 실수를 입력(Scanner 이용) 받아서 첫 번째 수에 두 번째 수를 나눈 결과
		// 를 출력하되 두번째 수에 0 또는 0.0이 입력되었을 경우에 "무한대"가 출력
		// 되도록 코드를 작성하세요.
		
		Scanner sc = new Scanner(System.in);
		
		// 첫 번째 수 입력받기.		
		System.out.print("첫 번째 수: ");
		double firstNum = sc.nextDouble();
		// 두 번째 수 입력받기.		
		System.out.print("첫 번째 수: ");
		double secondNum = sc.nextDouble();
		
		System.out.println("------------");
		double divide = firstNum/secondNum;
		String result = (secondNum != 0.0)  ?  String.valueOf(divide)  : "무한대";
		System.out.println("결과: " + result);
		
		sc.close();
	}
}
