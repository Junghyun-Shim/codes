package test_java;
import java.util.Scanner;
public class Q3 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
        Scanner s = new Scanner(System.in);
        
        int height;
        int weight;
        int bmi;
        
        System.out.print("Ű�� �Է��ϼ��� : ");
        height = s.nextInt();
        
        System.out.print("�����Ը� �Է��ϼ��� : ");
        weight = s.nextInt();
        
        
        bmi = (height-100)*9/10;
        
        if (bmi < weight) {
        	System.out.print("��ü���Դϴ�");

        }
        else {
        	System.out.print("�����Դϴ�.");
        }
        
	}

}
