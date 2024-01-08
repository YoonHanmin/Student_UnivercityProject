package Exam;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.ServerSocket;
import java.net.Socket;
import java.util.StringTokenizer;

public class Server {
	public static void main(String[] args) {
		// listener : 서버 소켓 , socket : 클라리언트 소켓
		ServerSocket listener = null;
		Socket socket = null;
		BufferedReader in = null;
		BufferedWriter out = null;
		StringTokenizer st = null;
		int a,b,res=0; // 계산할 인수 a,b,연산자 op, 결과값 res 선언
		String op;
		try {
			listener = new ServerSocket(9999); // 9999포트에 서버소켓 객체 생성
			System.out.println("연결을 기다리고 있습니다.....");
			socket = listener.accept(); // accept()를 통해 클라이언트 연결 대기
			//클라이언트가 해당 포트로 소켓 객체 생성하면 accept는 socket 생성하여 반환하므로 
			// socket가 null이 아닐경우 클라이언트 socket연결
			if(socket!=null) { System.out.println("연결되었습니다.");}
			// 클라이언트로부터 입력을 받기위한 Stream in 생성
			in = new BufferedReader(new InputStreamReader(socket.getInputStream()));
			// 클라이언트에게 출력하기위한 Stream out 생성
			out = new BufferedWriter(new OutputStreamWriter(socket.getOutputStream()));
			while(true) {
				String inputMessage = in.readLine();
				if(inputMessage.equals("bye")) { // 클라이언트로부터 받은 메시지가 'bye'일시 종료
					System.out.println("클라이언트에서 연결을 종료하였음.");
					break;
				}
				System.out.println(inputMessage);
				st = new StringTokenizer(inputMessage," ");
				// 클라이언트로부터 받은 inputMessage를 공백단위의 토큰을 생성 
				// 입력받은 결과를 계산하기위한 로직
				a = Integer.parseInt(st.nextToken());
				op = st.nextToken();
				b = Integer.parseInt(st.nextToken());
				switch(op) {
				case "+":res = a+b; break;
				case "-":res = a-b; break;
				case "*":res = a*b; break;
				case "/":res = a/b; break;}
				String outputMessage = ""+res;
				out.write("계산결과 :"+outputMessage+"\n");
				out.flush();
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally { // 접속 종료시 자원 반납 
			try {
				
				socket.close();
				listener.close();
			} catch (Exception e2) {
				System.out.println("클라이언트와 채팅중 오류가 발생했습니다.");
			}
		
		
	}
	}
}
