import java.io.InputStream;
import java.io.InputStreamReader;

public class StreamTest {

	public static void main(String[] args) throws Exception {
		InputStream in = System.in;
		
		// 1byte ������ ��Ʈ�� �б�
//		int a = in.read();
//		
//		System.out.println(a);
		
		// 3byte ������ ��Ʈ�� �б�
//		byte a[] = new byte[3];
//		in.read(a);
//		
//		System.out.println(a[0]);
//		System.out.println(a[1]);
//		System.out.println(a[2]);

		InputStreamReader reader = new InputStreamReader(in);
		char[] a = new char[3];
		reader.read(a);
		
		System.out.println(a);
	}

}
