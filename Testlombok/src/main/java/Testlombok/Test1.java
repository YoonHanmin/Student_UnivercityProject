package Testlombok;

import lombok.Getter;
import lombok.Setter;


public class Test1 {
	@Getter
	@Setter
	private int userID;
	private int userPassword;
	
	public static void main(String[] args) {
		Test1 t = new Test1();
		t.setUserID(1);
	}
}
