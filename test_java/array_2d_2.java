package test_java;
import java.util.*;
public class array_2d_2 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		int[][] aa = new int[3][4];
		int i, j;
		int val = 1;
		
		for (i=0; i<3; i++) {
			for (j=0; j<4; j++) {
				aa[i][j] = val++;
			}
		}
		int[] sum = {0,0,0,0};
		for (i=0; i<3; i++) {
			
			for (j=0; j<4; j++) {
				System.out.printf("%3d", aa[i][j]);
				sum[i] += aa[i][j];
			}
			System.out.println();
				
		}
		for (i=0; i<3; i++) {
			System.out.println(sum[i]);
		}

	}

}
