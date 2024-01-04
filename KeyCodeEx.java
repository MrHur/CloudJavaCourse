package sec04.exam;

public class KeyCodeEx {

	public static void main(String[] args) throws Exception {
		int keyCode;

		/*
		 * keyCode = System.in.read(); //a 입력 System.out.println("keyCode: " + keyCode);
		 * 
		 * keyCode = System.in.read(); //enter 입력(CR) System.out.println("keyCode: " +
		 * keyCode);
		 * 
		 * keyCode = System.in.read(); //enter 입력(LF) System.out.println("keyCode: " +
		 * keyCode);
		 */
		while(true) {
			keyCode = System.in.read();
			System.out.println("keyCode: " + keyCode);
			if(keyCode == 113) {
				break;     //keyCode가 113과 동일한 경우 실행 113은 q
			}			
			System.out.println("종료");
		}
	}

}
