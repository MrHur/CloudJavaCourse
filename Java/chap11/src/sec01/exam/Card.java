package sec01.exam;

public class Card {
	String kind;
	int number;

	Card() {
		this("spade", 1);
	}

	Card(String kind, int number) {
		this.kind = kind;
		this.number = number;
	}
	@Override
	public String toString() {
		return "kind : " + kind + ", number : " + number;
	}
}
