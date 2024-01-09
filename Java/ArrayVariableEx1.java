package quiz;

import java.util.Scanner;

public class ArrayVariableEx1 {

	public static void main(String[] args) {
//		정수 10개를 입력받은 후 세 번째, 다섯 번째와 마지막으로 입력받은
//		정수를 차례로 출력하시오.
		Scanner sc = new Scanner(System.in);
		int[] num = new int[10];
		int i;
		for (i = 0; i < num.length; i++) {
			num[i] = sc.nextInt();
			if (i == 2 || i == 4 || i == num.length-1) {
				System.out.print(num[i] + " ");
			}
		}
		sc.close();
	}
}
