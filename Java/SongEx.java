package quiz;

public class SongEx {

	// 필드
	private String title;
	private String artist;
	private int year;
	private String country;

	// 생성자
	public SongEx() {
		this("title","artist",0000,"country");
	}

	public SongEx(String title, String artist, int year, String country) {
		this.title = title;
		this.artist = artist;
		this.country = country;
		this.year = year;
	}

	// 메서드
	void show() {
		System.out.println(year + "년 " + country + "국적의 " + artist + "가 부른 " + title);
	}

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		SongEx song1 = new SongEx();
		SongEx song = new SongEx("Dancing Queen", "ABBA", 1978, "스웨덴");
		song1.show();
		song.show();
	}
}
