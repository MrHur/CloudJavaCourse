package quiz;
import java.util.Scanner;
public class View {
	public static Member1[] members = new Member1[100];
	public static Scanner sc = new Scanner(System.in);
	public static int memberCount = 0; // 등록된 회원 수를 저장하는 변수
	public int menu(int num) {
		System.out.println("MIT 사이트에 오신 것을 환영합니다.");
		System.out.println("메뉴를 선택해 주세요.");
		System.out.println("1. 회원가입");
		System.out.println("2. 로그인");
		System.out.println("3. 프로그램 종료");
		System.out.print("선택>");
		return Integer.parseInt(sc.nextLine());
	}

//	public void userfault() {}
	
	public void signUp() {
		System.out.println("회원 가입을 합니다.");

		System.out.println("아이디를 입력하세요");
		String id = sc.nextLine();

		System.out.println("비밀번호를 입력하세요");
		int pw = Integer.parseInt(sc.nextLine());

		System.out.println("이름을 입력하세요");
		String name = sc.nextLine();

		System.out.println("전화번호를 입력하세요");
		String tel = sc.nextLine();

		// Member 객체 생성 및 배열에 등록
		members[memberCount++] = new Member1(id, pw, name, tel);
	}

	public void LogIn() {
		System.out.println("아이디를 입력하세요: ");
		String inputId = sc.nextLine();

		System.out.println("비밀번호를 입력하세요: ");
		int inputPw = Integer.parseInt(sc.nextLine());
		// 저장된 회원 정보와 입력받은 ID, PW 직접 비교
		int MemberIndex = findMember(inputId, inputPw);

		if (MemberIndex != -1) {
		    Member1 member = members[MemberIndex];

		    System.out.println("회원 번호: " + (MemberIndex + 1)); // 배열은 0부터 시작하므로 +1
		    System.out.println("로그인에 성공했습니다.");
		    member.prt(); 
		} else {
		    System.out.println("로그인에 실패했습니다.");
		    System.out.println("아이디 또는 비밀번호를 다시 확인해 주세요.");
		}
	}

	private int findMember(String id, int pw) {
	    for (int i = 0; i < memberCount; i++) {
	        Member1 member = members[i];
	        if (member.id.equals(id) && member.pw==pw) {
	            return i;
	        }
	    }
	    return -1; // 일치하는 회원이 없을 경우 -1 반환
	}

//	public void success() {}

	public void deadline() {
		if (memberCount >= 100) {
			System.out.println("회원가입이 마감되었습니다.");
			System.out.println("나중에 다시 찾아와 주십시오.");
		}
	}

	public void programExit() {
		System.out.println("프로그램을 종료하시겠습니까? (y/n): ");
		String choice = sc.nextLine();

		if (choice.equals("y") || choice.equals("Y")) {
			System.out.println("프로그램을 종료합니다.");
			System.exit(0);
		} else if (choice.equals("n") || choice.equals("N")) {
			System.out.println("프로그램 종료를 취소합니다.");
		} else {
			System.out.println("올바른 입력이 아닙니다. 프로그램 종료를 취소합니다.");
		}
	}
}