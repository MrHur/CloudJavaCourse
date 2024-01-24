package quiz.stdInfo;

import java.util.Scanner;

public class Controller {

	static Scanner sc = new Scanner(System.in);
	static Member[] members = new Member[10];
	static int memberCount = 0;  // 추가된 회원 수를 추적하는 변수
	boolean run = true;

	// 생성자에서 초기화 작업 수행
	public Controller() {
		init();
		run();
	}

	public void init() {
	}

	public void run() {
		while (run) {

			switch (View.menu()) {
			case 1:
				View.sign_up();
				break;
			case 2:
				View.sign_in();
				break;
			case 3:
				System.out.println("프로그램을 종료하시겠습니까?");
				System.out.println("Y/N");
				String YN = sc.next();
				if ("Y".equalsIgnoreCase(YN)) {
					run = false;
					System.out.println("프로그램을 종료합니다.");
					break;
				} else if ("N".equalsIgnoreCase(YN)) {
					System.out.println("메뉴로 돌아갑니다.");
					break;
				}
			default:
				System.out.println("잘못된 선택입니다.");
			}
		}
		sc.close();
	}
//맴버 추가 메서드
	public static void addMember(Member member) {
		if (memberCount < members.length) {
			members[memberCount] = member;
			memberCount++;
			System.out.println("회원이 추가되었습니다.");
		} else {
			System.out.println("더 이상 회원을 추가할 수 없습니다.");
		}
	}
}