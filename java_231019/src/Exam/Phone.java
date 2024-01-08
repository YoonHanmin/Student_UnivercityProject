package Exam;

import java.util.Scanner;


public class Phone {
	
	private String name;
	private String tel;
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public Phone(String name, String tel) {
		this.name = name;
		this.tel = tel;
}
}
