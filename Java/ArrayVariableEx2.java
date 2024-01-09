package quiz;

import java.util.Scanner;

public class ArrayVariableEx2 {

	public static void main(String[] args) {
//		100개의 정수를 저장할 수 있는 배열을 선언하고 정수를 차례로 입력받다가
//		0이 입력되면 0을 제외하고 그때까지 입력된 정수를 가장 나중에 입력된
//		정수부터 차례대로 출력하시오.
		Scanner sc = new Scanner(System.in);
		int[] num = new int[100];
		int i;
		for (i = 0; i < num.length; i++) {
			num[i] = sc.nextInt();
			if (num[i] == 0) {
				for(int j=i-1; 0<=j; j-- )
				System.out.print(num[j] + " ");
			}
		}
		sc.close();
	}
}
