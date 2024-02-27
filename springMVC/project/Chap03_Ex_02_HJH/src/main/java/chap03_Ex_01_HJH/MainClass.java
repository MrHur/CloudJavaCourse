package chap03_Ex_01_HJH;

import java.util.Scanner;

import org.springframework.context.support.GenericXmlApplicationContext;


public class MainClass {
    public static void main(String[] args) {
        
		/*
		 * SayHello hi = new SayHello(); 
		 * hi.hello();
		 */
    	GenericXmlApplicationContext ctx = new GenericXmlApplicationContext("classpath:applicationContext.xml");
    	System.out.println("<실행 결과>");
    	System.out.println("Select your Laguage! 1. Korea, 2. English");
    	Scanner sc = new Scanner(System.in);
    	int a = sc.nextInt();
    	if(a == 1) {
        SayHello_kor sayHello_kor = ctx.getBean("sH_kor", SayHello_kor.class);
        sayHello_kor.hello_kor();
    	} else if(a==2) {
        SayHello_eng sayHello_eng = ctx.getBean("sH_eng", SayHello_eng.class);
        sayHello_eng.hello_eng();
    	}
        ctx.close();
    }
}