package quiz;

import java.util.Scanner;

public class GradeCounterEng {

	public static void main(String[] args) {
//		Scanner 클래스를 이용하여 학생의 키(float)와 몸무게(float) 를 받아서
//		BMI (float) 를 계산해서 아래 표에 맞게 출력!
//		스캐너 생성.
		Scanner sc = new Scanner(System.in);
//		점수를 입력 받음.
		System.out.println("점수를 입력해주세요: ");
		int score = sc.nextInt();
//		1의 자리수 판별
		int one = score%10;
//		점수가 100점인 경우.
		if (score == 100) {
			System.out.println("A+");
		} else {
//			점수가 90점 이상인 경우.
		if (90<=score && score<=99) {
			System.out.print("A");
//			1의 자리의 점수에 따라 +/0/- 의 세부 등급 부여.
			if (7<=one&&one<=9) {
				System.out.print("+");
			} else if (4<=one&&one<=6) {
				System.out.print("0");
			} else {
				System.out.print("-");
			}
//			점수가 80점 이상이면서 89점 이하인 경우.
		} else if (80<=score && score<=89) {
			System.out.print("B");
			if (7<=one&&one<=9) {
				System.out.print("+");
			} else if (4<=one&&one<=6) {
				System.out.print("0");
			} else {
				System.out.print("-");
			}
//			점수가 70점 이상이면서 79점 이하인 경우.
		} else if (70<=score && score<=79) {
			System.out.print("C");
			if (7<=one&&one<=9) {
				System.out.print("+");
			} else if (4<=one&&one<=6) {
				System.out.print("0");
			} else {
				System.out.print("-");
			}
//			점수가 60점 이상이면서 69점 이하인 경우.
		} else if (60<=score && score<=69) {
			System.out.print("D");
			if (7<=one&&one<=9) {
				System.out.print("+");
			} else if (4<=one&&one<=6) {
				System.out.print("0");
			} else {
				System.out.print("-");
			}			
//			점수가 60점 이하인 경우.
		} else {
			System.out.print("F");
		}
	  } 	
//		스캐너 닫기.
		sc.close();
	}
}
