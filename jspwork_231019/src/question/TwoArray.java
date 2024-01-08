package question;

public class TwoArray {
private int num;

public String process() {
	int[][] arr = new int[num][num];
	StringBuffer stb = new StringBuffer();
	for (int i = 0; i < arr.length; i++) {
		for (int j = 0; j < arr[i].length; j++) {
			arr[i][j] = (int)(Math.random()*10)+1;
			
				stb.append(arr[i][j]+" ");
			
			
		}
		stb.append("<br>");
		
	}
	return stb.toString();
	
	
}



public int getNum() {
	return num;
}

public void setNum(int num) {
	this.num = num;
}

public static void main(String[] args) {
	TwoArray arr = new TwoArray();
	arr.setNum(4);
	System.out.println(arr.process());
	
}
	
	
}
