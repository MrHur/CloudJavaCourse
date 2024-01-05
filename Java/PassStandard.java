package quiz;

import java.util.Scanner;

public class PassStandard {

	public static void main(String[] args) {
//		학생의 국영수 점수를 받아 통과 여부를 표시하세요.
//		- 만약 국영수 총합이 210 미만일시 : 탈락
//		- 만약 점수 하나가 60미만일 시 : 탈락
		
//		스캐너 생성.
		Scanner sc = new Scanner(System.in);
//		점수를 입력 받음.
		System.out.print("국어 점수를 입력하세요: ");
		int kor = sc.nextInt();
		System.out.print("영어 점수를 입력하세요: ");
		int eng = sc.nextInt();
		System.out.print("수학 점수를 입력하세요: ");
		int math = sc.nextInt();
//		세 점수의 총합.
		int sum = kor+eng+math;
//				조건을 모두 만족한 경우
		if (sum>210) {
			if(kor>=60 && eng>=60 && math>=60) {
				System.out.println("합격");
//				과락이 생긴 경우.
			}System.out.println("탈락");
//		210점을 넘기지 못 한 경우.
		}else{
			System.out.println("탈락");
		}
//		스캐너 닫음.
		sc.close();
	}

}
