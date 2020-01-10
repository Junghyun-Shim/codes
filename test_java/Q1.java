package test_java;
import java.util.Scanner;
public class Q1 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
        Scanner s = new Scanner(System.in);
        
        int a;
        int b;
        int c;
        
        System.out.print("정수를 입력하시오 : ");
        a = s.nextInt();
        System.out.print("정수를 입력하시오 : ");
        b = s.nextInt();
        System.out.print("정수를 입력하시오 : ");
        c = s.nextInt();
        
        if (a>=b & a>=c) {
        	System.out.printf("가장 큰 수는 %d 입니다.",a );
        }
        if (a<=b & b>=c) {
        	System.out.printf("가장 큰 수는 %d 입니다.",b );
        }
        if (c>=b & a<=c) {
        	System.out.printf("가장 큰 수는 %d 입니다.",c );
        }
	}


}
