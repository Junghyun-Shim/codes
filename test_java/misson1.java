


package test_java;
import java.util.Scanner;

public class misson1 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		int a;
		int b;
		int change_10000;
		int change_5000;
		int change_1000;
		int change_500;
		int change_100;
		
		
		Scanner s = new Scanner(System.in);
		System.out.print("������ ������ ������ �Է��ϼ���(100�� ���� ������) : ");
		a=s.nextInt();
		System.out.print("������ �ݾ��� �Է��ϼ���(100�� ���� ������) :  ");
		b=s.nextInt();
		
		
		change_10000 = (int)(b-a)/10000;
		change_5000 = (int)((b-a)%10000)/5000;
		change_1000 = (int)(((b-a)%10000)%5000)/1000;
		change_500  = (int)((((b-a)%10000)%5000)%1000)/500;
		change_100 = (int)(((((b-a)%10000)%5000)%1000)%500)/100;
		System.out.print("���� : ");
		System.out.println(change_10000);
		System.out.print("��õ�� : ");
		System.out.println(change_5000);
		System.out.print("õ�� : ");
		System.out.println(change_1000);
		System.out.print("����� : ");
		System.out.println(change_500);
		System.out.print("���� : ");
		System.out.println(change_100);
	

	}

}
