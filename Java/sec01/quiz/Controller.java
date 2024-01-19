package sec01.exam;

import imsi.LoginSys;

public class Controller {
	public Controller() {
		init();
	}

	public static void init() {
		boolean run = true;

		while (run) {
			int selectNum = View.menu();

			switch (selectNum) {
			case 1: // 게시 보기
				View.list();
				int choice = View.viewContent();
//				choice 가 1보다 크고 배열의 길이보다 짧으면서                  // choice-1 한 값은 index 넘버의 배열이 존재할 경우에.
				if (choice >= 1 && choice <= BoardSys.boards.length && BoardSys.boards[choice - 1] != null) {
					// 조건을 만족하는 게시글을 = 선택된 게시글.
					Board selectedBoard = BoardSys.boards[choice - 1];
					for (int i = 0; i < BoardSys.boards.length; i++) {
						if (BoardSys.boards[i] != null) {
							BoardSys.boards[i].prt();
							System.out.println("1.수정 | 2.삭제 | 3.돌아가기");
							int sel = Integer.parseInt(BoardSys.sc.next());
							switch (sel) {
							case 1:
								System.out.println("수정");
								View.editBoard(selectedBoard);
								break;
							case 2:
								// 선택된 게시글을 삭제하는 view파일의 delete 메서드 실행.
								View.deleteBoard(selectedBoard);
								break;
							case 3:
								continue;
							}
						}
					}
				}
				break;

			case 2: // 글 작성
				Board board = View.createBoard();

				int chk = -1;

				for (int i = 0; i < BoardSys.boards.length; i++) {
					if (BoardSys.boards[i] == null) {
						BoardSys.boards[i] = board;
						chk = i;

						break;
					}
				}

				break;
			case 3: // 종료
				run = false;
				break;
			}
		}
	}
}
