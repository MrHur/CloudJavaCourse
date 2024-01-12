package quiz;

public class TelevisionEx {
	int channel;
	int volume;
	boolean onOff;

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Television tv = new Television();
		tv.channel = 7;
		tv.volume = 9;
		tv.onOff = true;
		Television tv2 = new Television();
		tv2.channel = 9;
		tv2.volume = 12;
		tv2.onOff = true;

		System.out.println("나의 텔레비전 채널은 " + tv.channel + " 볼륨은 " +tv.volume + 
				" 현재 상태는 " + tv.onOff);
		System.out.println("너의 텔레비전 채널은 " + tv2.channel +  " 볼륨은 " +tv2.volume + 
				" 현재 상태는 " + tv2.onOff);
	}
}
