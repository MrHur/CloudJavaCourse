package sec01.exam01;

public class ForForEx {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
 out:	for(int i = 1; i <=9 ; i++) {
			System.out.println("구구단 " + i + "단 입니다.");
			for(int j = 1; j <= 9; j++) {
				System.out.println(i +" * " + j + " = "+ i*j);
				break out;
			}
		}
	}

}
