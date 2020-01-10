package test_java;
import java.util.Scanner;
public class Q4 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
        int score;
		Scanner scan = new Scanner(System.in);
		score = scan.nextInt();
		char grd;
		int score2 = (int)score/10;
		
		switch (score2) {
		case 10: case 9: grd = 'A'; break;
		case 8: grd = 'B'; break;
		case 7: grd = 'C'; break;
		case 6: grd = 'D'; break;
		default: grd = 'F';
		
		System.out.printf("당신의 등급은 %c\n",grd);
		
		}
	}

}


