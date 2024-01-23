package sec01.exam;

public interface RemoteControl {
	// 상수 반드시 초기화 진행해줘야 함
	int MAX_VOLUME = 10;
	int MIN_VOLUME = 0;

	// 추상 메소드
	void turnOn();
	void turnOff();
	void setVolume(int volume);
}