package quiz04.CoffeShop;

public class CoffeeShop extends Product  {
	//필드
	String Product;
	int a;
	int c;
	int ca;
	//생성자
	CoffeeShop(int a, int c, int ca) {
        super(a + c + ca);
	}
	//메서드
}