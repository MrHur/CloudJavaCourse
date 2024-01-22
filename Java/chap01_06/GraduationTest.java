package quiz;

import java.util.Scanner;

public class GraduationTest {

	public static void main(String[] args) {
//		졸업 하려면 최소 140학점을 이수해야 합니다. 이수한 학점 중 전공은
//		70학점 이상이어야 하며, 교양과 일반은 각각 30학점 이상이거나 두 과목
//		합계가 80점 이상이어야 한다. 세개의 학점을 입력받아서 졸업 여부를 출력하시오.

//		major general elective
//		3 과목의 합 140 이상

		Scanner sc = new Scanner(System.in);

		System.out.print("전공 이수 학점: ");
		int major = sc.nextInt();

		System.out.print("교양 이수 학점: ");
		int elective = sc.nextInt();

		System.out.print("일반 이수 학점: ");
		int general = sc.nextInt();

		int sum = major + general + elective;

		if ((sum >= 140) && (major >= 70) && ((general >= 30 && elective >= 30) || (general + elective >= 80))) {
			System.out.println("졸업 가능");
		} else {
			System.out.println("졸업 불가");
		}
		sc.close();
	}
}
