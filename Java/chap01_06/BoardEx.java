package quiz;

public class BoardEx {
	String title;
	String content;
	String writer;
	String date;
	int hitcount;

		public static void main(String[] args) {
		// TODO Auto-generated method stub
		Board board3 = new Board("제목", "내용");
		Board board2= new Board("제목", "내용", "홍길동");
		Board board1 = new Board("제목", "내용", "홍길동", "2025-12-31");
		Board board = new Board("제목", "내용", "홍길동", "2025-12-31", 0);
//		System.out.println("제목 : "+board.title);
//		System.out.println("내용 : "+board.content);
//		System.out.println("이름 : "+board.name);
	}

}
