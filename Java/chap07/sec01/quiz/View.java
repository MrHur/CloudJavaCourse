package sec01.exam;

public class View {
	public static int menu() {
		System.out.println("환영합니다 ^^");
		System.out.println("1.게시 보기 2.글 작성 3. 종료");
		System.out.println("번호를 입력해주세요");
		System.out.println(">");
		int selectNum = BoardSys.sc.nextInt();
		return selectNum;
	}

	public static void list() {
		System.out.println("***리스트 목록을 확인하세요***");
		for (int i = 0; i < BoardSys.boards.length; i++) {
			if (BoardSys.boards[i] != null) {
//			System.out.println(BoardSys.boards[i]); 
				System.out.println(i + 1 + "번째 게시글: " + BoardSys.boards[i].title);
			}
		}
	}

	public static int viewContent() {
		System.out.println("보고싶은 게시글의 번호를 선택하세요.");
		System.out.println("(0번 입력시 메인 메뉴로 돌아갑니다.)");
		int choice = BoardSys.sc.nextInt();
		return choice;
	}

	public static Board createBoard() {
		System.out.println("게시물을 작성합니다.");
		System.out.println("작성자를 입력하세요>");
		String author = BoardSys.sc.next();
		BoardSys.sc.nextLine();
		System.out.println("제목을 입력하세요>");
		String title = BoardSys.sc.nextLine();
		System.out.println("글 내용을 입력하세요.");
		String detail = BoardSys.sc.nextLine();
		System.out.println("삭제나 수정시 사용할 비밀번호를 입력하세요.");
		String pw = BoardSys.sc.next();
		BoardSys.sc.nextLine();
		System.out.println("글 등록 성공");

		Board board = new Board(title, author, detail, pw);
		return board;
	}

	public static void editBoard(Board board) {
		System.out.println("게시글을 수정합니다.");
		System.out.println("비밀번호를 입력해주세요.");
		String pw = BoardSys.sc.next();
		System.out.println();
		if (pw.equals(board.pw)) {
			System.out.println("게시글을 수정합니다.");
			for (int i = 0; i < BoardSys.boards.length; i++) {
				if (BoardSys.boards[i] == board) {
					BoardSys.boards[i].detail = BoardSys.sc.next();
					break;
				}
			}
		} else {
			System.out.println("비밀번호가 일치하지 않는디요?");
			return;
		}
	}

	public static void deleteBoard(Board board) {
		System.out.println("비밀번호를 입력해주세요.");
		String pw = BoardSys.sc.next();
		if (pw.equals(board.pw)) {
			System.out.println("게시글을 삭제합니다.");

			// 선택된 게시글을 삭제하고 null로 초기화
			for (int i = 0; i < BoardSys.boards.length; i++) {
				if (BoardSys.boards[i] == board) {
					BoardSys.boards[i] = null;
					break;
				}
			}
			System.out.println("게시글이 성공적으로 삭제되었습니다.");
		} else {
			System.out.println("비밀번호가 일치하지 않는디요?");
			return;
		}
	}
}
