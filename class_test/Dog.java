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
        // 이런식으로 왼쪽은 부모클래스로하고 우측은 자식클래스로 쓸 수도 있다
        // 대신 이렇게하면 Dog 클래스에만 있는 sleep 같은거는 사용 못함
        cat.setName("kitty");
        cat.setAge(3);
        System.out.println(cat.name);
        System.out.println(cat.age);
        //cat.sleep();
	}

}
