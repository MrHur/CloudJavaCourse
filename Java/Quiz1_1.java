package quiz;

import java.util.Scanner;

public class Quiz1_1 {

	public static void main(String[] args) {
		// 스캐너 객체 생성
		Scanner sc = new Scanner(System.in);
		
		System.out.print("첫 번째 숫자를 입력하세요 : ");
		String firstNumber = sc.nextLine();  // 첫 번째 숫자 입력 받기.		
		int f1Number = Integer.parseInt(firstNumber);
		System.out.print("두 번째 숫자를 입력하세요 : ");
		String secondNumber = sc.nextLine(); // 두 번째 숫자 입력 받기.		
		int f2Number = Integer.parseInt(secondNumber);
		int sum = f1Number + f2Number; // 두 수의 합을 변수 sum에 저장
		
		System.out.println("두 수의 합 : " + sum); // 결과값 출력
		// scanner 닫기
		sc.close();
	}	
}
