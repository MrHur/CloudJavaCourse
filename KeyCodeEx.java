package sec04.exam;

public class KeyCodeEx {

	public static void main(String[] args) throws Exception {
		int keyCode;

		keyCode = System.in.read();  //a 입력
		System.out.println("keyCode: " + keyCode);
		
		keyCode = System.in.read();	 //enter 입력(CR)
		System.out.println("keyCode: " + keyCode);
		
		keyCode = System.in.read();	 //enter 입력(LF)
		System.out.println("keyCode: " + keyCode);
	}

}
