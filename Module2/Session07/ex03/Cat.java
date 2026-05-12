package ex03;

public class Cat extends Animal {
	private String color;

	public Cat() {
		// TODO Auto-generated constructor stub
	}

	public Cat(String name, int age, String color) {
		super(name, age);
		this.color = color;
	}

	public String getColor() {
		return color;
	}

	public void setColor(String color) {
		this.color = color;
	}

	protected void meow() {
	}
}
