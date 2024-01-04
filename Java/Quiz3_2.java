package quiz;

import java.util.Scanner;

public class Quiz3_2 {

	public static void main(String[] args) {
		// 윗변의 길이, 아랫변의 길이, 높이를 입력(Scanner 이용)
		// 받아서 사다리꼴의 넓이(실수)를 구하여 출력하시오.
		
		// 사다리꼴 넓이 구하는 공식 : 
		//(lengthTop + lengthBottom) * height/2.0
		
		// 스캐너 객체 생성.
		Scanner sc = new Scanner(System.in);
		System.out.print("윗변: ");		
		int lengthTop = sc.nextInt();
		System.out.print("아랫변: ");
		int lengthBottom = sc.nextInt();
		System.out.print("높이: ");
		int height = sc.nextInt();
		System.out.println("-------------");
		//사다리꼴의 넓이 구하는 공식.		
		double trapezoidArea = (lengthTop + lengthBottom) * height/2.0;
		System.out.print("사다리꼴의 넓이: " + trapezoidArea);
		//스캐너 닫기
		sc.close();
	}

}
