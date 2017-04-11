package pushpa;

import java.util.Scanner;

public class Addition {
	public int sum (int a,int b)
	{
		int c=a+b;
		return c;
	}
	

	public static void main(String[] args) {
		Scanner sc = new Scanner (System.in);
	System.out.println("enter first number");
	int x =sc.nextInt();
	System.out.println("enter second number");
	int y = sc.nextInt();
	addition t = new addition();
	int result= t.sum(x,y);
	System.out.println(result);
}