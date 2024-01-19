package quiz;

public class Adult extends Person {
	void set() {
		this.age = 30;
		this.name = "홍길동";
		this.height = 175;
		this.setWeight(99);
		System.out.println("나이 : " + age);
		System.out.println("이름 : " + name);
		System.out.println("키 : " + height);
		System.out.println("몸무게 : " + getWeight());
	}

	public static void main(String[] args) {
		Adult ad = new Adult();
		
		ad.set();
	}
}
