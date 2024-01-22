package quiz;

public class Circle {

    // 필드
    static final double PI = 3.141592;
    int radius;

    // 생성자
    Circle(int radius) {
        this.radius = radius;
    }

    // 메서드
    public double circleArea() {
        double result = PI * this.radius * this.radius;
        System.out.print("반지름"+this.radius);
        System.out.println(" 원의 넓이: " + (int)result);
        return result;
    }
}