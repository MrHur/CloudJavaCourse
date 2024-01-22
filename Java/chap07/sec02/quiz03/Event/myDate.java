package quiz03.Event;

public class myDate {
	// 필드
	private int year, month, day;

	// 생성자
	public myDate(int year, int month, int day) {
		this.year = year;
		this.month = month;
		this.day = day;
	}

	// 메서드
	@Override
	public String toString() {
		return year + "/" + month + "/" + day;
	}
}
