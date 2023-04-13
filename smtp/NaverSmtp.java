package smtp;

import java.util.Map;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

//
public class NaverSmtp {
   private final Properties serverInfo;
   private final Authenticator auth;
   
   public NaverSmtp() {
      //네이버의 smtp 서버 접속 정보
      serverInfo = new Properties();
      serverInfo.put("mail.smtp.host", "smtp.naver.com");
      serverInfo.put("mail.smtp.port", "465");
      serverInfo.put("mail.smtp.auth", "true");
      serverInfo.put("mail.smtp.starttls.enable", "true");
      serverInfo.put("mail.smtp.starttls.required", "true");
      serverInfo.put("mail.smtp.ssl.enable", "true");
      serverInfo.put("mail.smtp.ssl.trust", "smtp.naver.com");
      serverInfo.put("mail.smtp.ssl.protocols", "TLSv1.2");
      serverInfo.put("mail.smtp.psocketFactory.class", "javax.net.ssl.SSLSocketFactory");
      //사용자 인증 정보
      auth=new Authenticator() {

         @Override
         protected PasswordAuthentication getPasswordAuthentication() {
            return new PasswordAuthentication("khr0366","kkk2167089@@@");
         }
               
      };

   }
   //주어진 메일 내용을 네이버 SMTP 서버를 통해 전송
   public void emailSending(Map<String,String> mailInfo) throws MessagingException{
	   //세션생성
	   Session session = Session.getInstance(serverInfo,auth);
	   session.setDebug(true);
	   //메세지 작성
	   MimeMessage msg=new MimeMessage(session);
	   //보낸사람
	   msg.setFrom(new InternetAddress(mailInfo.get("from")));
	   //받는사람
	   msg.addRecipient(Message.RecipientType.TO, new InternetAddress(mailInfo.get("to")));
	   //제목
	   msg.setSubject(mailInfo.get("subject"));
	   //내용
	   msg.setSubject(mailInfo.get("content"),mailInfo.get("format"));
	   //전송
	   Transport.send(msg);
	   System.out.println("message sent");
   }
}