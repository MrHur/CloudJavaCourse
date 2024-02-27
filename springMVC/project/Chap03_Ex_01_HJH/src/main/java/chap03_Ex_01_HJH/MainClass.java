package chap03_Ex_01_HJH;

import org.springframework.context.support.GenericXmlApplicationContext;


public class MainClass {
    public static void main(String[] args) {
        
		/*
		 * SayHello hi = new SayHello(); 
		 * hi.hello();
		 */

        GenericXmlApplicationContext ctx = new GenericXmlApplicationContext("classpath:applicationContext.xml");
        SayHello sayHello = ctx.getBean("sH", SayHello.class);
        sayHello.hello();
        ctx.close();
    }
}