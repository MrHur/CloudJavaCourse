package sec01.exam;

public class Board {
	// 필드
	String title;
	String author;
	String detail;
	String pw;

	// 생성자
	public Board(String title, String author, String detail, String pw) {
		this.title = title;
		this.author = author;
		this.detail = detail;
		this.pw = pw;
	}

	// 메서드
	public void prt() {
		System.out.println("제목: " + this.title);
		System.out.println("작성자: " + this.author);
		System.out.println("내용: " + this.detail);
	}
}