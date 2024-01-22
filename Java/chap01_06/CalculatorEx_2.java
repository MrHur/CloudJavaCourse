package sec04.exam;

public class CalculatorEx_2 {

	public static void main(String[] args) {
			Calculator_2 myCalcu = new Calculator_2();
			
			//정사각형의 넓이 구하기
			double result1 = myCalcu.areaRectangle(10);

			//직사각형의 넓이 구하기
			double result2 = myCalcu.areaRectangle(10, 20);
			
			//결과 출력
			System.out.println("정사각형의 넓이" + result1);
			System.out.println("직사각형의 넓이" + result2);
		}
	}

