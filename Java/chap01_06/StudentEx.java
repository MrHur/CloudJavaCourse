package quiz;

public class StudentEx {

	// 필드
	private String name;
	private int ban;
	private int no;
	private int kor;
	private int eng;
	private int math;
	int sum = 0;

	// 생성자
	public StudentEx(String name, int ban, int no, int kor, int eng, int math) {
		this.name = name;
		this.ban = ban;
		this.no = no;
		this.kor = kor;
		this.eng = eng;
		this.math = math;
	}

    // 메서드
    /**
     * 총점을 계산하고 반환하는 메서드
     *
     * @return 계산된 총점
     */
	public int getTotal() {
		sum = this.kor + this.eng + this.math;
		System.out.println("총점 : " + sum);
		return sum;
	}
	
    /**
     * 평균을 계산하고 반환하는 메서드
     *
     * @return 계산된 평균
     */
	public float getAverage() {
		float avg = Math.round(sum/3.0f*100)/100f; 
		// 정확한 나눗셈을 위해 3.0f로 나누기 
		// 10을 곱해 ex 73.3333 -> 733으로 만듦 
		//원하는 값을 얻기 위해 다시 10으로 나눔
		System.out.println("평균 : " + avg);
		return avg;
	}

    /**
     * 학생 정보를 출력하는 메서드
     */
	public void info() {
		System.out.println();
		System.out.println("이름 : " + name);
		System.out.println("반 : " + ban);
		System.out.println("번호 : " + no);
		System.out.println("국어점수 : " + kor);
		System.out.println("영어점수 : " + eng);
		System.out.println("수학점수 : " + math);
		getTotal();
		getAverage();
		System.out.println();
		System.out.println("----------------");
	}

	public static void main(String[] args) {
		 // StudentEx 객체를 저장할 배열 생성
	    StudentEx[] students = new StudentEx[5];

	    // 각 학생 정보를 생성자를 통해 초기화하여 배열에 저장
	    students[0] = new StudentEx("이길동", 1, 27, 90, 25, 54);
	    students[1] = new StudentEx("홍길동", 2, 37, 82, 43, 75);
	    students[2] = new StudentEx("고길동", 3, 17, 92, 63, 74);
	    students[3] = new StudentEx("박길동", 4, 47, 77, 100, 43);
	    students[4] = new StudentEx("김길동", 5, 57, 64, 83, 99);

	    // 배열을 순회하면서 각 학생의 정보 출력
	    for (int i = 0; i < students.length; i++) {
	        students[i].info();
	    }
	}
}
