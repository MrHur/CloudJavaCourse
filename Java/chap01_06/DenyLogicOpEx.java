package sec02.exam;

public class DenyLogicOpEx {

	public static void main(String[] args) {
		boolean play = true;
		System.out.println(play);
		
		play = !play; // false
		System.out.println(play);
		
		play = !play; // true
		System.out.println(play);
	}

}
