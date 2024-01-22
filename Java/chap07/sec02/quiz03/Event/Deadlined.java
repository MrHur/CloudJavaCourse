package quiz03.Event;

public class Deadlined extends Event {
	private myDate deadline;

	public Deadlined(String title, myDate deadline) {
		super(title);
		this.deadline = deadline;
	}

	@Override
	public String toString() {
		return title + ", ~" + deadline.toString();
	}
}