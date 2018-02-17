package localservice.services;

import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;

@Service
public class MailService {

	private Properties mailServerProperties;
	private Session mailSession;
	private MimeMessage generatedMailMessage;
	
	public void init() {
		mailServerProperties = System.getProperties();
		mailServerProperties.put("mail.smtp.port", "587");
		mailServerProperties.put("mail.smtp.auth", "true");
		mailServerProperties.put("mail.smtp.starttls.enable", "true");
	}
	
	public void sendEmail(String to, String cc, String subject, String body) throws AddressException, MessagingException {
		this.sendEmail(to, cc, subject, body, null);
	}
	
	public void sendEmail(String to, String cc, String subject, String body, String replyTo) throws AddressException, MessagingException {
		this.init();
		mailSession = Session.getDefaultInstance(mailServerProperties, null);
		generatedMailMessage = new MimeMessage(mailSession);
		generatedMailMessage.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
		if(StringUtils.isNoneBlank(cc)) {
			generatedMailMessage.addRecipient(Message.RecipientType.CC, new InternetAddress(cc));
		}		
		if(StringUtils.isNoneBlank(replyTo)) {
			generatedMailMessage.setReplyTo(new InternetAddress[] {(new InternetAddress(replyTo))});
		}		
		generatedMailMessage.setSubject(subject);
		generatedMailMessage.setContent(body, "text/html");
		Transport transport = mailSession.getTransport("smtp");
		transport.connect("smtp.gmail.com", "casaelum.webmailer@gmail.com", "casa123!@#");
		transport.sendMessage(generatedMailMessage, generatedMailMessage.getAllRecipients());
		transport.close();
	}
}
