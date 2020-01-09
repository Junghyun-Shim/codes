package class_test;

public class HouseDog extends Dog{
	
	public HouseDog(String name) {
		this.setName(name);
	}

	public void sleep() {
		System.out.println(this.name+"override");
	}
	
    public void sleep(int hour) {
        System.out.println(this.name+" zzz in house for " + hour + " hours");
    } 
    //위에있는 메소드는 메소드 오버로딩
    
	public static void main(String[] args) {
		// TODO Auto-generated method stub
        HouseDog dog = new HouseDog("happy");
        System.out.println(dog.name);
	}

}


