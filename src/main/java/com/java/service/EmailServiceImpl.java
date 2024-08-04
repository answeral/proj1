package com.java.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import com.java.dao.MemberDao;
import com.java.dto.MemberDto;

import jakarta.mail.Message.RecipientType;
import jakarta.mail.MessagingException;
import jakarta.mail.internet.InternetAddress;
import jakarta.mail.internet.MimeMessage;

@Service
public class EmailServiceImpl implements EmailService {

	@Autowired JavaMailSender mailSender;
	@Autowired MemberDao memberDao;
	
	
	@Override //이메일 전송
	public void email_send(MemberDto memberDto) {
		String pwCode = getCreateKey();
		System.out.println("랜덤비밀번호 생성: "+pwCode);
		
		//html 형식으로 갖추어 보내기
		MimeMessage message = mailSender.createMimeMessage();
		try {
			message.setSubject("[HappyPawPet]"+memberDto.getName()+"님의 임시비밀번호를 발급하였습니다.","utf-8");
			String htmlData = "<tr>	\r\n"
					+ "<td style='width:700px;height:196px;padding:0;margin:0;vertical-align:top;'> \r\n"
					+ "<table width='618' height='194' cellpadding='0' cellspacing='0' align='center' style='margin:0 0 0 40px;border:1px #D9D9D9 solid;'>\r\n"
					+ "<tr> \r\n"
					+ "	<td style='width:618px;height:194px;padding:0;margin:0;vertical-align:top;font-size:0;line-height:0;background:#f9f9f9;'> \r\n"
					+ "	<p style='width:620px;margin:30px 0 0 0;padding:0;text-align:center;'>\r\n"
					+ "	<img src='http://localhost:8181/image/HappyPawPet.png' />\r\n"
					+ "	</p> \r\n"
					+ "\r\n"
					+ "	<p style='width:620px;margin:10px 0 0 0;padding:0;text-align:center;color:#888888;font-size:12px;line-height:1;'>아래의 PASSWORD는 임시 PASSWORD이므로 홈페이지 로그인 후 다시 수정해 주십시오.</p> \r\n"
					+ "	<p style='width:620px;margin:28px 0 0 0;padding:0;text-align:center;color:#666666;font-size:12px;line-height:1;'><strong>임시 패스워드 : <span style='color:#f7703c;line-height:1;'>"+pwCode+"</span></strong></p> \r\n"
					+ "	<p style='width:620px;margin:30px 0 0 0;padding:0;text-align:center;color:#888888;font-size:12px;line-height:1.4;'>HappyPawPet은 고객님께 보다 나은 서비스를 제공하기 위해 항상 노력하겠습니다.<br/>앞으로 많은 관심 부탁드립니다.</p> \r\n"
					+ "	</td> \r\n"
					+ "</tr> \r\n"
					+ "</table>		\r\n"
					+ "</td>\r\n"
					+ "</tr>";
			message.setText(htmlData,"utf-8","html");
			//보내는 이메일 주소
			message.setFrom(new InternetAddress("ina091412@gmail.com"));
			//받는 이메일 주소
			message.addRecipient(RecipientType.TO, new InternetAddress(memberDto.getEmail()));
			//이메일 전송
			mailSender.send(message);
			
			//set pwcode저장
			//임시 비밀번호 DB저장
			memberDto.setPw(pwCode);
			memberDao.updatePwcode(memberDto);  //새롭게 저장된 pwCode를 가지고 다시 MemberDao로
		
		} catch (MessagingException e) { e.printStackTrace();} //제목
		
		System.out.println("이메일 발송 완료");
		
	}
		
	//임시 비밀번호 생성
	public String getCreateKey() {
		char[] charSet = {
			'0','1','2','3','4','5','6','7','8','9',	
			'A','B','C','D','E','F','G','H','I','J',	
			'K','L','M','N','O','P','Q','R','S','T',	
			'U','V','W','X','Y','Z',
			'a','b','c','d','e','f','g','h','i','j',	
			'k','l','m','n','o','p','q','r','s','t',	
			'u','v','w','x','y','z'
		};
	
		String pwCode = "";
		int idx = 0;
		for (int i=0;i<10;i++) {
			idx = (int)(Math.random()*52);
			pwCode += ""+charSet[idx];
			
		}
		return pwCode;
		
	}
}
