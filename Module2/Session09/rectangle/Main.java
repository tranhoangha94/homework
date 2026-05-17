package Session09.rectangle;

import java.util.Scanner;

public class Main {
public static void main(String[] args) {
	Scanner sc = new Scanner(System.in);
	Rectangle rec = new Rectangle();
	
	rec.input(sc);
	
	System.out.println("The Area of Rectangle is: "+rec.getArea());
	System.out.println("The Perimeter of Rectangle is: "+rec.getPerimeter());
}
}
