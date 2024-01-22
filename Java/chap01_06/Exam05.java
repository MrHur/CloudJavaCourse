package quiz;

import java.util.Scanner;

public class Exam05 {

	public static void main(String[] args) {
		// 양수 5개를 입력 받아 배열에 저장하고, 제일 큰 수를 출력하세요.
		Scanner sc = new Scanner(System.in);
		int[] num = new int[5];
		for(int i = 0; i<num.length; i++) {
			System.out.print("num [" + i + "]의 값을 입력해주세요. : ");			
			num[i] = sc.nextInt();
			}
		int max = num[0];
		for (int i = 0; i < num.length; i++) {
			if (num[i] > max) {
				max = num[i];
			}
		}	
		System.out.println("Max : " + max);
		sc.close();
	}
}
