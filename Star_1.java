package quiz;

import java.util.Scanner;

public class Star_1 {

	public static void main(String[] args) {
		// 숫자를 입력 받아서 별을 출력하세요.
		// 스캐너 객체 생성.
		Scanner sc = new Scanner(System.in);
		// 숫자를 입력 받음.
		System.out.print("숫자를 입력해 주세요 : ");
		int num = sc.nextInt();
		//중첩문이 돎. 		
		for(int i=1; i<=num; i++) {
			// 별의 갯수는 최대 i의 갯수만큼 찍힘.			
			for(int j=1; j<=i; j++) {
				System.out.print("*");
			}
			// j의 반복문을 빠져나오면 개행.			
			System.out.println();
		}	
		// 스캐너 닫음.		
		sc.close();
	}
}
