package session10.animal;

public class Mammal extends Animal {
	protected boolean hasFur;

	public Mammal(String name, int age, boolean hasFur) {
		super(name, age);
		this.hasFur = hasFur;
	}

	@Override
	public void showInfo() {
		super.showInfo();
		System.out.println("Has fur: " + hasFur);
	}
}