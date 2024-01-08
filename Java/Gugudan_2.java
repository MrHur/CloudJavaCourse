package quiz;

import java.util.Scanner;

public class Gugudan_2 {

	public static void main(String[] args) {
//		1. do while문 사용하여 구구단 2단을 출력

		int i = 2;
		int j = 1;

		do {
			int result = i * j;
			System.out.println(i + " x " + j + "=" + i * j);
			j++;
		} while (j <= 9);
//		2번 문제가 있으므로 개행.
		System.out.println();

//		2. while문 사용 Scanner로 입력 받은 숫자의 단만 출력.
		int m = 1;

		Scanner sc = new Scanner(System.in);
		System.out.print("출력을 원하시는 단의 숫자를 입력해주세요. ");
		int num = sc.nextInt();
		do {
			int result2 = num * m;
			System.out.println(num + " x " + m + "=" + result2);
			m++;
		} while (m <= 9);
		sc.close();
	}
}
