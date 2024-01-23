package sec03.exam;

public class SmartPhone extends Phone {
	// 생성자
	public SmartPhone(String owner) {
		super(owner);
	}
	// 메서드
	public void internetSearch() {
		System.out.println("인터넷 검색을 합니다.");
	}
}
