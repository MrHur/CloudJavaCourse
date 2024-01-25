package sec01.exam;

public class CardMain {

	public static void main(String[] args) {
		Card card1 = new Card();
		Card card2 = new Card("Heart", 10);

		System.out.println(card1.toString());
		System.out.println(card2.toString());
	}

}
