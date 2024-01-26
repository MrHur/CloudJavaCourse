package sec01.exam02;

public class ByteToStringExample {
	public static void main(String[] args) {
		byte[] bytes = { 72, 101, 108, 108, 111, 32, 74, 97, 118, 97  };
		
		String str1 = new String(bytes);
		System.out.println(str1);
		
		String str2 = new String(bytes, 6, 4);
		System.out.println(str2);
	}
}

// 바이트 배열의 실제 내용은 숫자지만
// 입력 되는 내용은 Hello\r\n 의 아스키 코드 내용으로 돼 있다.
// 72는 H e는 101 l 은 108. 

// \r 캐리지 리턴 줄의 맨 앞으로 이동
// \n 개행
// \r\n 을 같이 쓰게 되면 enter 이다.