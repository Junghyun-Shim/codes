package class_test;

public class Animal {
	String name;
	int age;   
//	위에 2개는 변수 미리 만들어 놓는 용도 같은거 인듯?

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



