package quiz.stdInfo;

public abstract class Member implements Task {
	// 필드
	private String name;
	private String id;
	private String pw;
	private String position;

	// 생성자
    public Member(String name, String id, String pw, String position) {
        this.name = name;
        this.id = id;
        this.pw = pw;
        this.position = position;
	}
	// 메서드
    public String getId() {
        return id;
    }

    public String getPw() {
        return pw;
    }
}
