package quiz;

import java.util.Scanner;

public class Gugudan {

	public static void main(String[] args) {
		// Scanner로 두 개 숫자를 입력 받은 후 첫 번째 입력 값은 단을
		// 두 번째 입력 값의 배수로 구구단의 데이터를 출력하세요.

		Scanner sc = new Scanner(System.in);
		System.out.println("출력하고자 하는 단을 입력하세요.");
		int dan = sc.nextInt();
		System.out.println("출력하고자 하는 데이터를 입력하세요.");
		int gugu = sc.nextInt();

		for (int i = 1; i <= gugu; i++) {
			if (i == gugu) {
				for (int j = 1; j <= 9; j++) {
					if (j % dan == 0) {
						System.out.println(i + "x" + j + "=" + i * j);
					}
				}
			}
		} sc.close();
	} 
}
