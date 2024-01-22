package quiz;

public class CharChange {

	public static void main(String[] args) {
		char[] arr = { 'T', 'h', 'i', 's', ' ', 'i', 's', ' ', 'a', ' ', 'p', 'e', 'n', 'c', 'i', 'l', '.' };

		prt(arr);
		replace(arr);
		prt(arr);
	}

	public static void replace(char a[]) {
		for (int i = 0; i < a.length; i++) {
			if (a[i] == (' ')) {
				a[i] = (',');
			} else {
				a[i] = a[i];
			}
		}
	}

	public static void prt(char a[]) {
		for (int i = 0; i < a.length; i++) {
			System.out.print(a[i]);
		}
		System.out.println();
	}
}