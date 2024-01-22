package quiz;

import java.util.Scanner;

public class maxValue {

	public static void main(String[] args) {
		maxValueEx mve = new maxValueEx();
		mve.Max();
	}

}

class maxValueEx {
	int Max() {
		Scanner sc = new Scanner(System.in);
		int[] arr = new int[13];
		for (int i = 0; i < arr.length; i++) {
			arr[i] = sc.nextInt();
		}

		int max = 0;
		for (int i = 0; i < arr.length; i++) {
			if (arr[i] > max)
				max = arr[i];
		}
		System.out.println("최대값 : " + max);
		return max;
	}
}