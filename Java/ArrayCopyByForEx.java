package sec02.exam;

public class ArrayCopyByForEx {

	public static void main(String[] args) {
		int[] oldIntArray = { 1, 2, 3 };
		int[] newIntArray = new int[5];
		String[] oldStringArray = {"java", "html", "css"};
		String[] newStringArray = new String[5];
		
		for(int i=0; i<oldStringArray.length; i++) {  // 배열 복사
			newStringArray[i] = oldStringArray[i];
		}
		
		for(int i=0; i<newStringArray.length; i++) {  // 배열 호출
			System.out.print(newStringArray[i] + ", ");
		}
	}
}