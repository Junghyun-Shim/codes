package class_test;

public class Animal {
	String name;
	int age;   
//	���� 2���� ���� �̸� ����� ���� �뵵 ������ �ε�?

	public void setName(String name) {
		this.name = name;

	}
	
	public void setAge(int age) {
		this.age = age;

	}


	public static void main(String[] args) {
		Animal cat = new Animal();
		System.out.println(cat.name);
	}
}



