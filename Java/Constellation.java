package quiz;

import java.util.Scanner;

public class Constellation {

	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		System.out.print("월을 입력해주세요: ");
		int month = sc.nextInt();
		System.out.print("일을 입력해주세요: ");
		int day = sc.nextInt();

		if ((month==1&&day>=20)||(month==2&&day<=18)) {
			System.out.println("물병자리");	
		} else if ((month==2&&day>=19)||(month==3&&day<=20)) {
			System.out.println("물고기자리");
		} else if ((month==3&&day>=20)||(month==4&&day<=19)) {
			System.out.println("양자리");
		} else if ((month==4&&day>=21)||(month==5&&day<=20)) {
			System.out.println("황소자리");
		} else if ((month==5&&day>=22)||(month==6&&day<=21)) {
			System.out.println("쌍둥이자리");
		} else if ((month==6&&day>=23)||(month==7&&day<=22)) {
			System.out.println("게자리");
		} else if ((month==7&&day>=23)||(month==8&&day<=22)) {
			System.out.println("사자자리");
		} else if ((month==8&&day>=24)||(month==9&&day<=23)) {
			System.out.println("처녀자리");
		} else if ((month==9&&day>=23)||(month==10&&day<=22)) {
			System.out.println("천칭자리");
		} else if ((month==10&&day>=23)||(month==11&&day<=22)) {
			System.out.println("전갈자리");
		} else if ((month==11&&day>=25)||(month==12&&day<=24)) {
			System.out.println("궁수자리");
		} else {
			System.out.println("염소자리");	
		}
		
		sc.close();
	}
}

