package quiz;

import java.util.Scanner;

public class MoneyArray {

	public static void main(String[] args) {
//		키보드에서 정수로 된 돈의 액수를 입력받아 오만 원권, 만 원권, 천 원권,
//		500원짜리 동전, 100원짜리 동전, 50원짜리 동전, 10원짜리 동전, 1원짜리 동전이
//		각 몇 개로 변환되는지 출력하세요.
		
//		스캐너 생성.
		Scanner sc = new Scanner(System.in);
		
//		금액을 입력 받음.
		System.out.print("금액을 입력하시오 : ");
		int money = sc.nextInt();

//		남은 돈
		int spare = money;
		//환산할 돈의 종류
		int [] unit = {50000, 10000, 5000, 1000, 500, 100, 50, 10, 1};
		int i=0;
		
		for(i = 0; i<unit.length; i++) {
			
//			화폐 단위로 남은 돈의 몫을 카운트 
			int count = spare/unit[i];
			
//			남은 돈
			spare = spare%unit[i];
			System.out.println(unit[i]+"원: " + count);
		}
//		scanner 닫기
		sc.close();
	}
}
