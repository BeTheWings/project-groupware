package com.mju.groupware.email;

import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import javax.mail.Address;
import javax.mail.Folder;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.NoSuchProviderException;
import javax.mail.Session;
import javax.mail.Store;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;

import org.springframework.stereotype.Component;

import com.mju.groupware.dto.UserEmail;

@Component
public class EmailImpl implements Email {

	private String Host;
	private String UserEmail;
	private String UserPwd;
	private String ToEmail;
	private String Subject;
	private String Content;
	private Store store;
	private List<UserEmail> list;

	public EmailImpl() {
		this.Host = "smtp.gmail.com";
		this.UserEmail = "lovebus5050@gmail.com";
		this.UserPwd = "126479dd!@#$";
	}

	@Override
	public void sendEmail(String email, int Num) {
		this.ToEmail = email;
		// 제목 설정
		this.Subject = "MJU Welfare System인증메일 입니다.";
		// 추후에 DB에 이문구도 저장하여 가져올 예정
		this.Content = "MJU Welfare System의 회원가입 인증번호는 " + Num + " 입니다.";
		Properties Properties = new Properties();
		Properties.put("mail.smtps.auth", true);
		Session session = Session.getDefaultInstance(Properties);
		MimeMessage Msg = new MimeMessage(session);

		try {
			Msg.setSubject(Subject);
			Msg.setText(Content);
			Msg.setFrom(new InternetAddress(UserEmail));
			Msg.addRecipient(javax.mail.Message.RecipientType.TO, new InternetAddress(ToEmail));

			Transport transport = session.getTransport("smtps");
			transport.connect(Host, UserEmail, UserPwd);
			transport.sendMessage(Msg, Msg.getAllRecipients());
			transport.close();

		} catch (MessagingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();

		}

	}

	public boolean AuthNum(int authNum, int num) {
		if (authNum == num) {
			return true;
		} else {
			return false;
		}
	}

	@Override
	public boolean CheckEmailLogin(String id, String pw) {
		boolean CheckEmailLogin = false;
		// Create empty properties
		Properties props = new Properties();
		// POP3 주소
		String host = "outlook.office365.com";
		// session생성
		Session session = Session.getDefaultInstance(props, null);
		// store생성
		this.store = null;

		try {
			store = session.getStore("pop3s");
			store.connect(host, id, pw);
			if (store.isConnected()) {
				CheckEmailLogin = true;
			} else {
				CheckEmailLogin = false;
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return CheckEmailLogin;
	}

	@Override
	public List<UserEmail> printEmailList() {

		list = new ArrayList<UserEmail>();
		// 게시판 번호 설정
		int counter = 1;
		// folder생성
		Folder folder = null;

		try {
			// Get folder
			folder = store.getFolder("INBOX");
			folder.open(Folder.READ_ONLY);
			// 이메일 박스
			Message message[] = folder.getMessages();

			// Get directory(여기서 이메일 내용들 주르륵 보여주는 거임)
			for (int i = 0, n = message.length; i < n; i++) {
				// read를 하면서 userEmail을 reset해준다.
				UserEmail userEmail = new UserEmail();
				userEmail.setCounter(counter);
				int location = 0;
				int location2 = 0;

				Address from = message[i].getFrom()[0];
				String sFrom = from + "\t";
				// 온전한 이메일주소찾오는거

				
				if (sFrom.indexOf("<") != -1) {
					location = sFrom.indexOf("<");
					if (sFrom.indexOf(">") != -1) {
						location2 = sFrom.indexOf(">");
					}
				}
				

				if (location != 0 && location2 != 0 && sFrom.contains("<") && sFrom.contains(">")) {
					sFrom = sFrom.substring(location + 1, location2); // 그냥 location하면 /까지 출력됨
				}
				userEmail.setFrom(sFrom);

				String Title = message[i].getSubject();
				userEmail.setTitle(Title);

				String contentType = message[i].getContentType();
				String content = "";
				if (contentType.contains("multipart")) {
					Multipart multipart = (Multipart) message[i].getContent();
					int numofparts = multipart.getCount();
					for (int k = 0; k < numofparts; k++) {
						MimeBodyPart part = (MimeBodyPart) multipart.getBodyPart(k);
						content = part.getContent().toString();
					}
				} else if (contentType.contains("text/plain") || contentType.contains("text/html")) {
					String ObjectContent = message[i].getContent().toString();
					if (ObjectContent != null) {
						content = ObjectContent.toString();
					}
				}
				userEmail.setContent(content);

				String date = message[i].getSentDate().toString();

				date = date.replaceAll("Mon", "월");
				date = date.replaceAll("Tue", "화");
				date = date.replaceAll("Wed", "수");
				date = date.replaceAll("Thu", "목");
				date = date.replaceAll("Fri", "금");
				date = date.replaceAll("Sat", "토");
				date = date.replaceAll("Sun", "일");

				date = date.replaceAll("Jan", "1/");
				date = date.replaceAll("Feb", "2/");
				date = date.replaceAll("Mar", "3/");
				date = date.replaceAll("Apr", "4/");
				date = date.replaceAll("May", "5/");
				date = date.replaceAll("Jun", "6/");
				date = date.replaceAll("Jul", "7/");
				date = date.replaceAll("Aug", "8/");
				date = date.replaceAll("Sep", "9/");
				date = date.replaceAll("Oct", "10/");
				date = date.replaceAll("Nov", "11/");
				date = date.replaceAll("Dec", "12/");
				// 일반 빈칸을 html이 인식할 수 있는 공백으로 변환
				 date = date.replaceAll(" ", "&nbsp;");
				// KST를 제거한다.
				date = date.replaceAll("KST", "");

				userEmail.setDate(date);
				// 첨부파일이 있을 경우 파일에다가 mail을 붙인다.
				list.add(userEmail);
				counter++;
			}

			// Close connection
			folder.close(false);
			store.close();

		} catch (Exception e) {
			System.out.println(e.toString());
			e.printStackTrace();
		}

		return list;

	}

	@Override
	public List<UserEmail> GetEmailList() {
		return list;
	}
}