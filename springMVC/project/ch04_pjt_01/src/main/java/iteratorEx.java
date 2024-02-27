import java.util.ArrayList;
import java.util.HashSet;
import java.util.Iterator;
import java.util.ListIterator;
import java.util.Set;

public class iteratorEx {

	public static void main(String[] args) {
		// ArrayList 경우
		
		System.out.println("ArrayList");
		//컬렉션 생성
		ArrayList<String> cars = new ArrayList<>();
		cars.add("벤츠");
		cars.add("람보르기니");
		cars.add("롤스로이스");
		cars.add("페라리");
		
		//iterator 획득
		Iterator<String> iterator = cars.iterator();
		
		// while문을 사용한 경우
		while(iterator.hasNext())
		{
			String str = iterator.next();
			System.out.println(str);
		}
		
		/*
		 * for([배열 자료형][변수명]:[배열명] or [컬렉션 객체명]) {}
		 */
		System.out.println("ArrayList");
		// 향상된 for 문을 사용한 경우
		for (String str : cars)
		{
			System.out.println(str);
		}
		
		// Set을 사용할 경우
		System.out.println("Set");
		Set<String> cars2 = new HashSet<>();
		cars2.add("벤츠");
		cars2.add("람보르기니");
		cars2.add("롤스로이스");
		cars2.add("페라리");
		
		// while문을 사용한 경우
		Iterator<String> iterator2 = cars2.iterator();
		
		while(iterator2.hasNext())
		{
			System.out.println("cars : " + iterator2.next());
			
		}
		
		// 확장된 for문을 사용한 경우
		for (String car : cars2) 
		{
			System.out.println("cars : " + car);
		}
		
		// iterator를 이용해 값을 수정하는 예제
		System.out.println("iterator를 이용해 값을 수정");
		//컬렉션 생성
		ArrayList<String> list = new ArrayList<>();
		list.add("A");
		list.add("B");
		list.add("C");
		list.add("D");
		list.add("E");
		list.add("F");
		System.out.println("while문 지나기 전 리스트에 들어있던 값 : " +list);
		
		//리스트에 들어있는 값에 각각 '+' 붙이기
		ListIterator<String> listIterator = list.listIterator();
		while(listIterator.hasNext())
		{
			Object element = listIterator.next();
			listIterator.set(element + "+");
			
		}
		System.out.println("while문 지난 후 수정된 결과 : " + list);
		
		//리스트에 들어있는 값을 역순으로 표시
		System.out.print("역순 출력 결과 : ");
		while(listIterator.hasPrevious())
		{
			Object element = listIterator.previous();
			System.out.print(element + " ");
		}
		System.out.println();
	}

}
