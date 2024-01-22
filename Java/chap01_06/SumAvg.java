package quiz;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
//import java.util.Scanner;
import java.util.StringTokenizer;

public class SumAvg {

	public static void main(String[] args) throws IOException {
		SumAvgEx sae = new SumAvgEx();
		sae.num();
	}

	static class SumAvgEx {
		void num() throws IOException {
			{
				BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
				BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(System.out));
				System.out.println("정수 5개를 입력하세요.");
//				StringTokenizer st = new StringTokenizer(br.readLine());
//				Scanner sc = new Scanner(System.in);

				int sum = 0;
				int avg = 0;
				int[] arr = new int[5];
				for (int i = 0; i < arr.length; i++) {
					arr[i] = Integer.parseInt(br.readLine());
					sum += arr[i];
				}
				avg = sum / 5;
				bw.write("입력된 배열의 합은 : " + sum);
				bw.newLine();
				bw.write("입력된 배열의 평균은 : " + avg);
				bw.newLine();
//				sc.close();

				bw.flush();
				br.close();
				bw.close();
			}
		}
	}
}
