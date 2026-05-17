package Session09.student;

import java.util.Scanner;

public class Main {
public static void main(String[] args) {
	Scanner sc = new Scanner(System.in);
	
	Student[] students = new Student[3];
	
	for (int i = 0; i < students.length; i++) {
		students[i]= new Student();
		students[i].inputInfor(sc);
	}
	System.out.println("=====================");
	for (int i = 0; i < students.length; i++) {
		students[i].printInfo();
	}
	System.out.println("=================");
	System.out.println("Sum of Student is: "+Student.count);
}
}
