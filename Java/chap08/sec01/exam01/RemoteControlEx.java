package sec01.exam;

public class RemoteControlEx {
	public static void main(String[] args) {
		RemoteControl rc;
		rc = new Television();
		rc.setVolume(10);
		rc = new Audio();
		rc.setVolume(500);
	}
}
