package quiz;

public class ForVariableEx1 {

	public static void main(String[] args) {
//		1~20의 짝수의 합을 구하시오.
		int sum = 0;
		for(int i=1; i<=20; i++) {
			if(i%2==0) {
				sum +=i;
			}
		}
		System.out.println(sum);
	}
}
