package Session09.student;

import java.util.Scanner;

public class Student {

	public static final double MIN_GPA = 0;
	public static final double MAX_GPA = 4.0;
	public static int count = 0;
	
	private int id;
	private String fullName;
	private int age;
	private double gpa;

	public Student() {
		Student.count++;
	}

	public Student(int id, String fullName, int age, double gpa) {
		super();
		this.id = id;
		this.fullName = fullName;
		this.age = age;
		this.gpa = gpa;
		this.count++;
	}

	public static int getCount() {
		return count;
	}

	public static void setCount(int count) {
		Student.count = count;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getFullName() {
		return fullName;
	}

	public void setFullName(String fullName) {
		this.fullName = fullName;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public double getGpa() {
		return gpa;
	}


	public void inputInfor(Scanner sc) {
		System.out.println("Input id: ");
		id = Integer.parseInt(sc.nextLine());
		
		System.out.println("Input full name: ");
		fullName = sc.nextLine();
		
		System.out.println("Input age: " );
		age = Integer.parseInt(sc.nextLine());
		
		System.out.println("Input GPA: " );
		gpa = Double.parseDouble(sc.nextLine());
	}

	public void printInfo() {
		System.out.println("Id: " + id);
		System.out.println("Fullname: " + fullName);
		System.out.println("Age: " + age);
		System.out.println("GPA: " + gpa);
	}

	
}
