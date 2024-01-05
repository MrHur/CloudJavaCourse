package quiz;

import java.util.Scanner;

public class MonthCount {

	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		System.out.print("월을 입력해주세요: ");
		int month = sc.nextInt();
		
		int daysInMonth;
		
		switch(month) {
		case 1,3,5,7,8,10,12:
			daysInMonth =31;
			break;
		case 4, 6, 9, 11:
			daysInMonth =30;
			break;
		default :
			daysInMonth =28;
		}
		System.out.println(daysInMonth + "일 까지 입니다.");
	}
}

/*
 * import java.io.BufferedReader; 
 * import java.io.BufferedWriter; 
 * import java.io.IOException; 
 * import java.io.InputStreamReader; 
 * import java.io.OutputStreamWriter;
 * 
 * public class MonthCountBuffered {
 * 
 * public static void main(String[] args) throws IOException { 
 * try (BufferedReader reader = new BufferedReader(new InputStreamReader(System.in)); 
 * BufferedWriter writer = new BufferedWriter(new OutputStreamWriter(System.out))) {
 
 * System.out.print("월을 입력해주세요: "); int month = Integer.parseInt(reader.readLine());
 
 * int daysInMonth;
 
 * switch (month) { 
      case 1, 3, 5, 7, 8, 10, 12: 
      	daysInMonth = 31; 
      	break; 
      case 4, 6, 9, 11: 
      	daysInMonth = 30; 
      	break; 
      default: 
        daysInMonth = 28; 
      }
 
writer.write(daysInMonth + "일 까지 입니다.");
writer.newLine(); 
writer.flush();

} catch (IOException e) { e.printStackTrace(); } } }
*/