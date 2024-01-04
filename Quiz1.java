package quiz;

import java.util.Scanner;

public class Quiz1 {

	public static void main(String[] args) {
		// 스캐너 객체 생성
		Scanner sc = new Scanner(System.in);
		
		System.out.println("첫 번째 숫자를 입력하세요 : ");
		int firstNumber = sc.nextInt();  // 첫 번째 숫자 입력 받기.		
		
		System.out.println("두 번째 숫자를 입력하세요 : ");
		int secondNumber = sc.nextInt(); // 두 번째 숫자 입력 받기.		
		
		int sum = firstNumber + secondNumber; // 두 수의 합을 변수 sum에 저장
		
		System.out.println("두 수의 합 : " + sum); // 결과값 출력
		// scanner 닫기
		sc.close();
	}	
}
