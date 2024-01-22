package quiz;

import java.util.Scanner;

public class BMIcaculator {

	public static void main(String[] args) {
//		Scanner 클래스를 이용하여 학생의 키(float)와 몸무게(float) 를 받아서
//		BMI (float) 를 계산해서 아래 표에 맞게 출력!
//		스캐너 생성
		Scanner sc = new Scanner(System.in);
		System.out.print("키를 입력해주세요: ");
		float tall = sc.nextFloat();
		System.out.print("몸무게를 입력해주세요: ");
		float weight = sc.nextFloat();
//		BMI 계산방법 : 몸무게 / 키^2 (키는 m, 몸무게는 kg)
		float BMI = weight/((tall/100)*(tall/100));
//		BMI 수치에 따른 비만도 판정.
//		System.out.println(BMI);
		if (BMI <=18.5) {
			System.out.println("저체중 입니다.");
		} else if (BMI>18.5 && BMI<=25) {
			System.out.println("정상 입니다.");
		} else if (BMI>25 && BMI<=30) {
			System.out.println("과체중 입니다.");
		} else if (BMI>30 && BMI<=40) {
			System.out.println("비만 입니다.");
		} else {
			System.out.println("고도비만 입니다.");
		}
//		스캐너 닫기
		sc.close();
	}
}
