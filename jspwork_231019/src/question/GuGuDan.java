package question;

public class GuGuDan {
private int num;

public int getNum() {
	return num;
}

public void setNum(int num) {
	this.num = num;
}

public String process() {
	for (int i = 1; i < 10; i++) {
		int a = getNum()*i;
		String str = "5 * "+i+"="+a;
		return str;
	}return null;
		
	}
}


