package quiz;

public class AddTwoArr {

    public static void main(String[] args) {
        int[] arr1 = { 78, 54, 89, 57, 84 };
        int[] arr2 = { 95, 74, 91, 84 };

        // 두 배열을 더한 결과를 저장하는 새로운 배열을 생성.
        int[] newArr = arrAdd(arr1, arr2);

        // 새로운 배열의 내용을 출력.
        prt(newArr);
    }

    // 두 배열을 더하는 메서드입니다.
    public static int[] arrAdd(int[] a, int[] b) {
        // 결과 배열의 길이는 입력 배열 중 더 긴 배열의 길이로 설정.
        int[] result = new int[Math.max(a.length, b.length)];
        // int[] result = new int[5];
        
        // 배열의 각 요소를 더하여 결과 배열에 저장.
        for (int i = 0; i < result.length; i++) {
            // 배열 a,b의 현재 요소 값을 가져오고, 배열의 길이를 벗어나면 0으로 대체.
            int aValue = (i < a.length) ? a[i] : 0;
            int bValue = (i < b.length) ? b[i] : 0;

            result[i] = aValue + bValue;
        }
        return result;
    }

    // 배열 출력.
    public static void prt(int[] a) {
        for (int i = 0; i < a.length; i++)
            System.out.print(a[i] + ", ");
    }
}
