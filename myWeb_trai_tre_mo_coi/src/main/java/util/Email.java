package util;

import java.util.Date;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class Email {
	// password: ovugupmwvafrikpc
	// email: happyhousepbl@gmail.com
	// mk email: happyhouse01
	
	static final String from = "happyhousepbl@gmail.com";
	static final String password = "ovugupmwvafrikpc";
	
	public static boolean SendEmailIntroduction(String to, String titleMail, String name, String child) {
		// properties
		Properties props = new Properties();
		props.put("mail.smtp.host", "smtp.gmail.com"); // SMTP HOST
		props.put("mail.smtp.port", "587"); // TLS 587 SSL 465
		props.put("mail.smtp.auth", "true"); // khi sử dụng host để gửi mail phải đăng nhập
		props.put("mail.smtp.starttls.enable", "true");
		
		// create Authenticator
		Authenticator auth = new Authenticator() {
			@Override
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(from, password);
			}
		};
		Session session = Session.getInstance(props, auth);
	
		MimeMessage msg = new MimeMessage(session);
		
		try {
			msg.addHeader("Content-type", "text/HTML; charset=UTF-8");
			
			msg.setFrom(from);
			
			msg.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to, false));
			
			msg.setSubject(titleMail + System.currentTimeMillis());
			
			msg.setSentDate(new Date());
			
			String content = "<!DOCTYPE html>\r\n"
					+ "<html>\r\n"
					+ "<head>\r\n"
					+ "<meta charset=\"UTF-8\">\r\n"
					+ "<h1>Xác nhận giới thiệu trẻ thành công</h1>\r\n"
					+ "</head>\r\n"
					+ "<body>\r\n"
					+ "<p>Kính gửi <strong>" + name + "</strong>,</p>\r\n"
					+ "<p>Thân chào bạn. Happy House biết ơn chân thành đến bạn đã giới thiệu <strong>" + child +"</strong> đến trại trẻ mồ côi của chúng tôi. Chúng tôi rất vinh dự được cung cấp một môi trường an toàn và chu đáo cho trẻ.</p>\r\n"
					+ "<p>Tôi xin thông báo rằng đơn giới thiệu đã được chấp nhận và <strong>" + child + "</strong> đã được đăng ký vào trại. Chúng tôi sẽ đảm bảo rằng trẻ sẽ được hỗ trợ, giáo dục và chăm sóc cần thiết trong thời gian lưu trú tại đây.</p>\r\n"
					+ "<p>Sự tử tế và lòng nhân ái của bạn đã tạo ra một tác động đáng kể đến cuộc đời của trẻ và sẽ được nhớ mãi trong nhiều năm tới. Chúng tôi rất trân trọng sự tin tưởng và hỗ trợ của bạn đối với sứ mệnh của chúng tôi trong việc cung cấp cuộc sống tốt đẹp hơn cho các em mồ côi.</p>\r\n"
					+ "<p>Một lần nữa, chúng tôi xin chân thành cảm ơn sự đóng góp vô giá của bạn. Nếu bạn có bất kỳ câu hỏi hoặc vấn đề nào, hoặc nếu có điều gì chúng tôi có thể hỗ trợ, xin hãy cho chúng tôi biết.</p>\r\n"
					+ "<p>Trân trọng,</p>\r\n"
					+ "<p>Happy House</p>\r\n"
					+ "</body>\r\n"
					+ "</html>";
			
			msg.setContent(content, "text/HTML; charset=UTF-8");
			
			Transport.send(msg);
			System.out.println("Gửi email thành công");
			return true;
		} catch (MessagingException e) {
			System.out.println("Lỗi trong quá trình gửi mail");
			e.printStackTrace();
			return false;
		}
	}
	
	public static boolean SendEmailAdoption(String to, String titleMail, String name, String child) {
		// properties
		Properties props = new Properties();
		props.put("mail.smtp.host", "smtp.gmail.com"); // SMTP HOST
		props.put("mail.smtp.port", "587"); // TLS 587 SSL 465
		props.put("mail.smtp.auth", "true"); // khi sử dụng host để gửi mail phải đăng nhập
		props.put("mail.smtp.starttls.enable", "true");
		
		// create Authenticator
		Authenticator auth = new Authenticator() {
			@Override
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(from, password);
			}
		};
		Session session = Session.getInstance(props, auth);
	
		MimeMessage msg = new MimeMessage(session);
		
		try {
			msg.addHeader("Content-type", "text/HTML; charset=UTF-8");
			
			msg.setFrom(from);
			
			msg.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to, false));
			
			msg.setSubject(titleMail + System.currentTimeMillis());
			
			msg.setSentDate(new Date());
			
			String content = "<!DOCTYPE html>\r\n"
					+ "<html>\r\n"
					+ "  <head>\r\n"
					+ "    <meta charset=\"UTF-8\">\r\n"
					+ "    <h1>Xác nhận đơn nhận nuôi trẻ mồ côi</h1>\r\n"
					+ "  </head>\r\n"
					+ "  <body>\r\n"
					+ "    <p>Chào <strong>"+ name + "</strong>,</p>\r\n"
					+ "    <p>Chúng tôi xin gửi email này để xác nhận rằng đơn nhận nuôi trẻ mồ côi của bạn đã được chấp thuận bởi Trại Trẻ của chúng tôi. Chúng tôi rất vui mừng vì đã tìm được cho bé một gia đình mới.</p>\r\n"
					+ "    <p>Đội ngũ của chúng tôi sẽ chuẩn bị sẵn sàng để bạn có thể đón <strong>" + child + "</strong> tại trại khi bạn đã sẵn sàng. Chúng tôi sẽ gửi cho bạn một số giấy tờ và thông tin cần thiết để chuẩn bị cho việc nhận nuôi.</p>\r\n"
					+ "    <p>Chúng tôi hiểu rằng đây là một quyết định quan trọng và có thể gây ra nhiều cảm xúc khác nhau. Chúng tôi sẽ hỗ trợ bạn trong suốt quá trình này và cung cấp cho bé một môi trường yêu thương, chăm sóc và an toàn để phát triển.</p>\r\n"
					+ "    <p>Xin vui lòng liên hệ với chúng tôi nếu bạn có bất kỳ câu hỏi hoặc vấn đề nào. Một lần nữa, chúng tôi xin chân thành cảm ơn bạn đã đến với Happy House và sẵn sàng đón bé vào gia đình của bạn.</p>\r\n"
					+ "    <p>Trân trọng,</p>\r\n"
					+ "    <p>Happy House</p>\r\n"
					+ "  </body>\r\n"
					+ "</html>";
			
			msg.setContent(content, "text/HTML; charset=UTF-8");
			
			Transport.send(msg);
			System.out.println("Gửi email thành công");
			return true;
		} catch (MessagingException e) {
			System.out.println("Lỗi trong quá trình gửi mail");
			e.printStackTrace();
			return false;
		}
	}
	
	public static boolean SendEmailStaff(String to, String titleMail, String head, String mess) {
		// properties
		Properties props = new Properties();
		props.put("mail.smtp.host", "smtp.gmail.com"); // SMTP HOST
		props.put("mail.smtp.port", "587"); // TLS 587 SSL 465
		props.put("mail.smtp.auth", "true"); // khi sử dụng host để gửi mail phải đăng nhập
		props.put("mail.smtp.starttls.enable", "true");
		
		// create Authenticator
		Authenticator auth = new Authenticator() {
			@Override
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(from, password);
			}
		};
		Session session = Session.getInstance(props, auth);
	
		MimeMessage msg = new MimeMessage(session);
		
		try {
			msg.addHeader("Content-type", "text/HTML; charset=UTF-8");
			
			msg.setFrom(from);
			
			msg.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to, false));
			
			msg.setSubject(titleMail + System.currentTimeMillis());
			
			msg.setSentDate(new Date());
			
			String content = "<!DOCTYPE html>\r\n"
					+ "<html>\r\n"
					+ "<head>\r\n"
					+ "<meta charset=\"UTF-8\">\r\n"
					+ "<h1> " + head + "</h1>\r\n"
					+ "</head>\r\n"
					+ "<body>\r\n"
					+ "<p>" + mess + "</p>\r\n"
					+ "<p>Trân trọng,</p>\r\n"
					+ "<p>Happy House</p>\r\n"
					+ "</body>\r\n"
					+ "</html>";
			
			msg.setContent(content, "text/HTML; charset=UTF-8");
			
			Transport.send(msg);
			System.out.println("Gửi email thành công");
			return true;
		} catch (MessagingException e) {
			System.out.println("Lỗi trong quá trình gửi mail");
			e.printStackTrace();
			return false;
		}
	}
	
	public static void main(String[] args) {
		Email.SendEmailStaff("102210047@sv1.dut.udn.vn", "Thông báo đến toàn bộ nhân viên", "Thông báo về lịch trình nghỉ lễ", "Lịch trình nghỉ lễ 30/4 - 1/5 kéo dài 7 ngày");
	}
}
