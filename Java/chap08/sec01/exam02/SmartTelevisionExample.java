package sec01.exam02;

public class SmartTelevisionExample {
	public static void main(String[] args) {
		SmartTelevision tv = new SmartTelevision();
		
		RemoteControl rc = tv;
		rc.setVolume(100);
		Searchable searchable = tv;
		searchable.search("https://www.naver.com/");
	}
}
