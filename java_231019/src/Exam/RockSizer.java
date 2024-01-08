package Exam;

import java.util.Scanner;
import java.util.StringTokenizer;

public class RockSizer {
public static void main(String[] args) {
	
	Scanner scan = new Scanner(System.in);
	String str = scan.nextLine();
	StringTokenizer st = new StringTokenizer(str," ");
	System.out.println(st.countTokens());
	System.out.println(st.nextToken());
	System.out.println(st.nextToken());
		
		
		
		
	}
	
}

