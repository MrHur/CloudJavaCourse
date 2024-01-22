package quiz;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.util.StringTokenizer;

public class MaxValue2 {

    public static void main(String[] args) throws IOException {
//    	Maxvalue 객체를 mve라는 이름으로 생성.
        MaxValueEx2 mve = new MaxValueEx2();
//        최대값을 찾는 메서드를 호출.
        mve.max();
	}
}

class MaxValueEx2 {
	int max() throws IOException {
        try (BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
             BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(System.out))) {

//        	배열의 값을 입력받음.
            int[] arr = new int[13];
//            연속 입력되는 배열을 토큰으로 만들어 읽음.
            StringTokenizer st = new StringTokenizer(br.readLine());
            
            for (int i = 0; i < arr.length; i++) {
//            	토큰을 읽은 후 int 타입으로 형변환.
            	arr[i] = Integer.parseInt(st.nextToken());
            }

//            최대값을 구하는 로직
            int max = 0;
            for (int i = 0; i < arr.length; i++) {
                if (arr[i] > max)
                    max = arr[i];
            }
//			버퍼에 최대값 입력.
            bw.write("최대값 : " + max);
//          입력된 값을 출력.
            bw.flush();
//          최대값 리턴.
            return max;
        }
    }
}