package test_java;

import java.util.ArrayList;

public class array {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		int aa[] = new int[100];
		
		
		for (int i = 0; i <100; i++) {
			aa[i] = i+1;
		}
		System.out.println(aa[1]);
		
		int sum = 0;
		for (int i = 0; i <100; i++) {
			sum += aa[i];
		}
		
		System.out.println(sum);
		
		ArrayList pitches = new ArrayList();
		pitches.add(234);
		pitches.add("sda");
		System.out.println(pitches);
		System.out.println(pitches.get(1));
		System.out.println(pitches.size());
		System.out.println(pitches.remove("129"));
		System.out.println(pitches.remove(0));
		System.out.println(pitches);
	}

}


