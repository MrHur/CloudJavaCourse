package quiz.stdInfo;

public class Teacher extends Member {
	// 필드
	String course;
	// 생성자
    public Teacher(String id, String pw, String name, String course) {
        super(name, id, pw, "Teacher");
		this.course = course;
	}
	// 메서드
	@Override
	public void work() {
		System.out.println("강의를 합니다.");
	}
	@Override
	public void test() {
		System.out.println("채점을 합니다.");
	}
}
