package quiz04.CoffeShop;

public class Paribaguette {
	Product cd;
	Product rb;
	Product mb;
	Paribaguette(int p1, int p2, int p3) {
		cd = new CreamDonut(p1);
		rb = new RedbeanBread(p2);
		mb = new MoccaBread(p3);
	}
	class CreamDonut extends Product {
		CreamDonut(int price) {
			super(price);
		}
	}

	class RedbeanBread extends Product {
		RedbeanBread(int price) {
			super(price);
		}
	}

	class MoccaBread extends Product {
		MoccaBread(int price) {
			super(price);
		}
	}
}
