package test_java;

public class GuGu2 {
	int dan;
	public GuGu2(int dan) {
		this.dan = dan;
		for (int i=1; i<10; i++) {
			System.out.println(i*dan);
		}
		
	}

	public static void main(String[] args) {
		// TODO Auto-generated method stub
        GuGu2 a = new GuGu2(9);
	}

}
