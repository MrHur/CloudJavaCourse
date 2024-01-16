package quiz;

public class Card {
	public static void main(String[] args) {
		Card card1 = new Card(3, false);
		Card card2 = new Card(2, true);

		System.out.println(card1.info());
		System.out.println(card2.info());
	}

//필드
	private int value;
	private boolean isKing;

//생성자
	public Card(int value, boolean isKing) {
		this.value = value;
		this.isKing = isKing;
	}

//메서드
	public String info() {
		if (isKing) {
			return value + "k";
		} else {
			return String.valueOf(value);
		}
	}
}
