package sec01.exam03;

public interface RemoteControl {
	// 필드
	int MAX_VOLUME = 10;
	int MIN_VOLUME = 0;

	// 메서드
	void turnOn();

	void turnOff();

	void setVolume(int volume);
}
