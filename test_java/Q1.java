package test_java;
import java.util.Scanner;
public class Q1 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
        Scanner s = new Scanner(System.in);
        
        int a;
        int b;
        int c;
        
        System.out.print("������ �Է��Ͻÿ� : ");
        a = s.nextInt();
        System.out.print("������ �Է��Ͻÿ� : ");
        b = s.nextInt();
        System.out.print("������ �Է��Ͻÿ� : ");
        c = s.nextInt();
        
        if (a>=b & a>=c) {
        	System.out.printf("���� ū ���� %d �Դϴ�.",a );
        }
        if (a<=b & b>=c) {
        	System.out.printf("���� ū ���� %d �Դϴ�.",b );
        }
        if (c>=b & a<=c) {
        	System.out.printf("���� ū ���� %d �Դϴ�.",c );
        }
	}


}
