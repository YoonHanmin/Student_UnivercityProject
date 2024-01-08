package question;

public class Arithmetic {
private int first;
private int second;
private String str;

public int getFirst() {
	return first;
}
public void setFirst(int first) {
	this.first = first;
}
public int getSecond() {
	return second;
}
public void setSecond(int second) {
	this.second = second;
}
public String getStr() {
	return str;
}
public void setStr(String str) {
	this.str=str;
}

public String process(int first,String str,int second) {
	int res=0;
	String result;
	
	switch(str) {
	case "+" : res=first+second; break; 
	case "-" : res=first+second; break; 
	case "*" : res=first+second; break; 
	case "/" : 
		if(second==0){
			result = "0으로 나눌수 없습니다.";break; 
	}else {res=first/second; break; 
	}
		default : result = "사칙연산이 아닙니다.";
	
}
	result = first+"와"+second+"의 계산결과는"+res;
	return result;
}
}