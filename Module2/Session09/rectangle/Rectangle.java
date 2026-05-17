package Session09.rectangle;

import java.util.Scanner;

public class Rectangle {
	private int width;
	private int height;

	public Rectangle() {
		// TODO Auto-generated constructor stub
	}

	public Rectangle(int width, int height) {
		super();
		this.width = width;
		this.height = height;
	}

	public int getWidth() {
		return width;
	}

	public void setWidth(int width) {
		this.width = width;
	}

	public int getHeight() {
		return height;
	}

	public void setHeight(int height) {
		this.height = height;
	}

	public int getArea() {
		return height * width;
	}

	public int getPerimeter() {
		return 2 * (height + width);
	}
	
	public void input(Scanner sc) {
		System.out.println("Input Width: ");
		width = sc.nextInt();
		
		System.out.println("Input Height: ");
		height = sc.nextInt();
	}
}
