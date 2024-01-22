package quiz04.CoffeShop;

public class CoffeeShop {
	Product a;
	Product c;
	Product ca;
	
	CoffeeShop(int p1, int p2, int p3) {
		a = new Americano(p1);
		c = new Caferatte(p2);
		ca = new Capucchino(p3);
	}
	
	class Americano extends Product {
		Americano(int price) {
			super(price);
		}
	}

	class Caferatte extends Product {
		Caferatte(int price) {
			super(price);
		}
	}

	class Capucchino extends Product {
		Capucchino(int price) {
			super(price);
		}
	}
}

