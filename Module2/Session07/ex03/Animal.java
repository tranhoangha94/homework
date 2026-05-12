package ex03;

public class Animal {
	protected String name;
	protected int age;

	public Animal() {
		// TODO Auto-generated constructor stub
	}

	public Animal(String name, int age) {
		super();
		this.name = name;
		this.age = age;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	
	protected void makeSound() {
		
	}
}
