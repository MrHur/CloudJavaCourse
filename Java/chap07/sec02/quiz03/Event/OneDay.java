package quiz03.Event;

public class OneDay extends Event {
	private myDate date;

	public OneDay(String title, myDate date) {
		super(title);
		this.date = date;
	}

	@Override
	public String toString() {
		return title + ", " + date.toString();
	}
}