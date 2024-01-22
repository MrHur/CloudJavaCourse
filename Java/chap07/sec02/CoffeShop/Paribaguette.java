package quiz04.CoffeShop;

public class Paribaguette extends Product {
	// 필드
	String Product;
	int cd;
	int rb;
	int mb;
	// 생성자
	Paribaguette(int cd, int rb, int mb) {
		super(cd + rb + mb);
	}
	// 메서드
}
