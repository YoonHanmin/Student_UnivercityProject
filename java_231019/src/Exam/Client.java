package Exam;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.Socket;
import java.util.Scanner;

public class Client {
	public static void main(String[] args) {
		Socket socket = null;
		BufferedReader in =null; 
		BufferedWriter out = null;
		Scanner scanner = new Scanner(System.in);
	try {
		// localhost 주소의 9999포트로 socket 객체 생성 = 9999포트에 대기중인 서버소켓에 연결
		socket = new Socket("localhost",9999); 
		// 서버로부터 입력을 받기위한 Stream in 생성
		in = new BufferedReader(new InputStreamReader(socket.getInputStream()));
		// 서버에게 전달하기위한 Stream out 생성
		out = new BufferedWriter(new OutputStreamWriter(socket.getOutputStream()));
		while(true) {
			System.out.print("계산식(빈칸으로 띄어 입력,예: 24 + 42 )>>");
			String outputMessage = scanner.nextLine();
			if(outputMessage.equals("bye")) {  
				out.write(outputMessage+"\n"); //'bye'메시지 전송후 종료
				out.flush();
				break;
			}
			// 서버에 메시지 전송
			out.write(outputMessage+"\n");
			out.flush();
			// 서버로부터 받은 메시지를 읽어들임.
			String inputMessage = in.readLine();
			System.out.println(inputMessage);
			
		}

	}catch(Exception e) {
		e.printStackTrace();
	}finally {
		try {
			//자원반납
			scanner.close();
			socket.close();
		} catch (Exception e2) {
			// TODO: handle exception
		}
}
}
}
