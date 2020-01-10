package test_java;
import java.util.Scanner;
public class Q3 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
        Scanner s = new Scanner(System.in);
        
        int height;
        int weight;
        int bmi;
        
        System.out.print("키를 입력하세요 : ");
        height = s.nextInt();
        
        System.out.print("몸무게를 입력하세요 : ");
        weight = s.nextInt();
        
        
        bmi = (height-100)*9/10;
        
        if (bmi < weight) {
        	System.out.print("과체중입니다");

        }
        else {
        	System.out.print("정상입니다.");
        }
        
	}

}
