import java.util.ArrayList;

public class SelfNumber {

	public static void main(String[] args) {
		//� �ڿ��� n�� ���� �� d(n)�� n�� �� �ڸ��� ���ڵ�� n�ڽ��� ���� ���ڶ�� ��������
		// ������� d(91) = 9 + 1 + 91 = 101
		// �̶� n�� d(n)�� ���׷����Ͷ�� �Ѵ�.
		// ���� ������ 91�� 101�� ���׷������̴�.
		// ���׷����Ͱ� ���� ���ڸ� ���ض�
		ArrayList<Integer> n = new ArrayList<Integer>();
		for (int i = 1; i<5000; i++)
		{
			n.add(i);
		}
		
		
	    for (int i = 1; i < 5000; i++) 
	    {
	    	int thousand = i/1000;
			int hundred = i%1000/100;
			int ten = i%1000%100/10;
			int one = i%1000%100%10;
			int dn;
			dn = thousand + hundred + ten + one + i;
			n.remove((Integer)dn);
	    }
		
	    int sum = 0;
	    for (int i = 0; i < n.size(); i++)
	    {
	    	sum += n.get(i);
	    }
	    
	    System.out.println(sum);
	    
//		int i = 1092;
//		int length = (int)(Math.log10(i)+1);
//		System.out.println(length);
//		int thousand = i/1000;
//		int hundred = i%1000/100;
//		int ten = i%1000%100/10;
//		int one = i%1000%100%10;
//        System.out.println(thousand);
//        System.out.println(hundred);
//        System.out.println(ten);
//        System.out.println(one);
        
        
	    
	    
        
        
	}

}
