package ex03;

public class Dog extends Animal {
	private String breed;

	public Dog() {
		// TODO Auto-generated constructor stub
	}

	public Dog(String name, int age, String breed) {
		super(name, age);
		this.breed = breed;
	}

	public void bark() {
	}
}
