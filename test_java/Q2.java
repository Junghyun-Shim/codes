package test_java;
import java.util.Scanner;
public class Q2 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
        Scanner s = new Scanner(System.in);
        
        char a;
        
        System.out.print("알파벳 문자 하나를 입력하세요 : ");
        a = s.next().charAt(0);
        
        if ((int)a >= 65 & (int)a <= 90) {
        	System.out.print('1');
        }
        else if((int)a >= 97 & (int)a <= 122) {
        	System.out.print('0');
        }
        
        
        
	}

}
