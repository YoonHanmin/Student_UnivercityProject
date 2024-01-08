package question;

public class DivAndRemains {
private int num;	
private int ten;
private int one;

public int getNum() {
	return num;
}
public void setNum(int num) {
	this.num=num;
}


public int getTen() {
	return ten;
}
public void setTen(int num) {
	ten = num/10;
}
public int getOne() {
	return one;
}
public void setOne(int num) {
	one = num%10;
}

public boolean process() {
	if(ten==one) {
		return true;
	}else return false;
}



}
