package quiz;

import java.util.Scanner;

public class Grade {
	public static void main(String[] args) {
		System.out.println("수학, 과학, 영어 순으로 3개의 정수 입력 >>");
		Grade grade = new Grade();
		grade.average();
	}

	Scanner sc = new Scanner(System.in);
//필드
	private int math;
	private int science;
	private int english;

//생성자
	public void Grade() {
	}

//메서드
	public int average() {
		math = sc.nextInt();
		science = sc.nextInt();
		english = sc.nextInt();
		int average = (math + science + english) / 3;
		System.out.println("평균은 " + average);
		sc.close();
		return average;
	}
}