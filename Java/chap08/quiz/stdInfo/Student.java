package quiz.stdInfo;

public class Student extends Member {
	// 필드
	String major;
	// 생성자
	public Student(String id, String pw, String name, String major) {
		super(name, id, pw, "Student");
		this.major = major;
	}
	@Override
	public void work() {
		System.out.println("공부를 합니다.");
	}
	@Override
	public void test() {
		System.out.println("시험을 봅니다.");
	}
}
