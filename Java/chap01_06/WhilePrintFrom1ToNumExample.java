package sec02.exam;

import java.util.Scanner;

public class WhilePrintFrom1ToNumExample {

	public static void main(String[] args) {
		// 조건 1. while 문 조건식에 반드시 true 를 입력할 것.
		// 조건 2. Scanner 을 통해 값을 입력 받아서, 입력 받은 값까지의 합을 구할 것.
		Scanner sc = new Scanner(System.in);
		System.out.print("입력받은 수까지의 합을 출력합니다, 수를 입력해주세요 : ");
		int num = sc.nextInt();
		int sum = 0;
		int i = 1;
		while (true) {
			if (i < num+1) {
				sum += i;
				i++;
			} else {
				break;
			}
			System.out.println("1~" + (i - 1) + " 합 : " + sum);
		}
	}
}
