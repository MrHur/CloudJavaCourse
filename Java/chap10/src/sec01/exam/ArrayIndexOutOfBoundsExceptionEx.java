package sec01.exam;

public class ArrayIndexOutOfBoundsExceptionEx {
	public static void main(String[] args) {
//		String[] args = new String[10];
		String data1 = args[0];
		String data2 = args[1];
		
		System.out.println("args[0]: " + data1);
		System.out.println("args[1]: " + data2);
	}
}

