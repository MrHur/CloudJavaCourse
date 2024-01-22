package quiz;

public class Member1 {
	// 필드
	String id;
	int pw;
	String name;
	String tel;

	// 생성자
	public Member1(String id, int pw, String name, String tel) {
		this.id = id;
		this.pw = pw;
		this.name = name;
		this.tel = tel;
	}

	// 메서드
	public void prt() {
		System.out.println("사용자 이름: " + this.name);
		System.out.println("사용자 폰번호: " + this.tel);
	}
}