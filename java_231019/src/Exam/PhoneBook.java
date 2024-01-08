package Exam;

import java.util.Scanner;

public class PhoneBook {
	private Phone phone;
	private Scanner scanner;
	private Phone[] pArray;
	
	
	


void read() {
	System.out.println("인원수>>");
	int n = scanner.nextInt();
	pArray = new Phone[n];
	
	for (int i = 0; i < pArray.length; i++) {
		System.out.println("이름과 전화번호 빈칸없이 입력>>");
		String name = scanner.next();
		String tel = scanner.next();
		pArray[i] = new Phone(name,tel);
	}
	System.out.println("저장되었습니다.");
}

	String search(String name) {
		for (int i = 0; i < pArray.length; i++) {
			if(pArray[i].getName().equals(name)) {
				return pArray[i].getTel();
			}
		}
		return null;
	}
	
	void run() {
		read();
		while(true) {
			System.out.println("검색할 이름>>");
			String name=scanner.next();
			if(name.equals("그만")) {
				break;
			}
			String tel = search(name);
			if (tel==null) {
				System.out.println(name+"이 없습니다.");
			} else {
				System.out.println(name+"의 번호는"+tel+"입니다.");

			}
		}
		scanner.close();
	}
	
	
	
	
	
public static void main(String[] args) {
	new PhoneBook().run();
}
}

