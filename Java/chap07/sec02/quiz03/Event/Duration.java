package quiz03.Event;

public class Duration extends Event {
	private myDate begin;
	private myDate end;

	public Duration(String title, myDate begin, myDate end) {
		super(title);
		this.begin = begin;
		this.end = end;
	}

	@Override
	public String toString() {
		return title + ", 시작 날짜: " + begin.toString() + ", 마감 날짜: " + end.toString();
	}
}