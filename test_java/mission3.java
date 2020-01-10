package test_java;

public class mission3 {
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		char a = 'a';
		
		
		System.out.print("====================================== \n");
		System.out.print("  Alpha   10진수    8진수    16진수                   \n");
		System.out.print("====================================== \n");
		for (int i = 97; i <103; i++) {
		System.out.printf("%c     %d      %#o     %#x       \n",(char)i,(int)i,(int)i,(int)i);
		}
	}

}
