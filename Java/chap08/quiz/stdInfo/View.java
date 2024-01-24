package quiz.stdInfo;

public class View {
	public static int menu() {
		System.out.println("학사 정보 관리 시스템");
		System.out.println("메뉴를 선택하세요.");
		System.out.println("1. 회원 가입");
		System.out.println("2. 로그인");
		System.out.println("3. 프로그램 종료");
		int selNum = Integer.parseInt(Controller.sc.next());
		return selNum;
	}

	public static Member sign_up() {
		System.out.println("회원 가입을 진행합니다.");
		System.out.println("ID를 입력하세요.");
		String id = Controller.sc.next();
		System.out.println("암호를 입력하세요");
		String pw = Controller.sc.next();
		System.out.println("이름을 입력하세요");
		String name = Controller.sc.next();
		System.out.println("1.선생님 | 2.학생");
		int num = Integer.parseInt(Controller.sc.next());
        if (num == 1) {
            System.out.println("담당 과목을 입력하세요.");
            String subject = Controller.sc.next();
            Member member = new Teacher(id, pw, name, subject);
            Controller.addMember(member); // 변경된 부분
        } else if (num == 2) {
            System.out.println("전공을 입력하세요.");
            String major = Controller.sc.next();
            Member member = new Student(id, pw, name, major);
            Controller.addMember(member); // 변경된 부분
		} else {
			System.out.println("잘못 입력하셨습니다.");
			System.exit(0);
		}
		return null;
	}

	public static void sign_in() {
		System.out.println("로그인을 진행합니다.");
		System.out.println("ID를 입력하세요.");
		String id = Controller.sc.next();
		System.out.println("암호를 입력하세요.");
		String pw = Controller.sc.next();

		Member loggedInMember = null;

		for (Member member : Controller.members) {
			if (member.getId().equals(id) && member.getPw().equals(pw)) {
				loggedInMember = member;
				break;
			} else {
				System.out.println("잘못 입력하셨는디요?");
				break;
			}
		}

	    if (loggedInMember != null) {
	        if (loggedInMember instanceof Teacher) {
	            ((Teacher) loggedInMember).work();
	            ((Teacher) loggedInMember).test();
	        } else if (loggedInMember instanceof Student) {
	            ((Student) loggedInMember).work();
	            ((Student) loggedInMember).test();
	        }
	    } else {
			System.out.println("로그인에 실패하였습니다. ID 또는 암호를 확인하세요.");
		}
	    
	}

}
