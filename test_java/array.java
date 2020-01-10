package test_java;

public class array {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		int aa[] = new int[100];
		
		
		for (int i = 0; i <100; i++) {
			aa[i] = i+1;
		}
		
		int sum = 0;
		for (int i = 0; i <100; i++) {
			sum += aa[i];
		}
		
		System.out.print(sum);
	}

}


