package class_test;

public class Dog extends Animal {
	public Dog() {
	}
	
	
	public void sleep() {
		System.out.println(this.name+this.age+"zzz");
	}

	public static void main(String[] args) {
		// TODO Auto-generated method stub
        Dog dog = new Dog();
        dog.setName("poppy");
        dog.setAge(12);
        System.out.println(dog.name);
        System.out.println(dog.age);
        dog.sleep();
        
        Animal cat = new Dog();
        // �̷������� ������ �θ�Ŭ�������ϰ� ������ �ڽ�Ŭ������ �� ���� �ִ�
        // ��� �̷����ϸ� Dog Ŭ�������� �ִ� sleep �����Ŵ� ��� ����
        cat.setName("kitty");
        cat.setAge(3);
        System.out.println(cat.name);
        System.out.println(cat.age);
        //cat.sleep();
	}

}
