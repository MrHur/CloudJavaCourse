package sec01.exam01;

import java.util.Scanner;

public class ArrayLengthExample {

	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		int[] scores = new int[3];

		System.out.print("국어 점수를 입력하세요: ");
		scores[0] = sc.nextInt();
		System.out.print("영어 점수를 입력하세요: ");
		scores[1] = sc.nextInt();
		System.out.print("수학 점수를 입력하세요: ");
		scores[2] = sc.nextInt();

		int sum = 0;
		for (int i = 0; i < scores.length; i++) {
			sum += scores[i];

		}
		System.out.println("총합 : " + sum);

		double avg = (double) sum / scores.length;
		
		System.out.println("평균 : " + avg);
	}

}
