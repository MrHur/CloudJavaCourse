package sec02.exam;

public class ArrayCopyEx {

	public static void main(String[] args) {
		String[] oldStrArray = {"java", "array", "copy"};
		String[] newStrArray = new String[5];

		System.arraycopy(oldStrArray, 1, newStrArray, 0, 2);
		
		for(int i=0; i<2; i++) {
			System.out.print(newStrArray[i] + ", ");
		}
	}

}
