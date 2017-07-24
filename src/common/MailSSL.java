package common;

import java.util.*;
import javax.mail.*;
import javax.mail.internet.*;
import com.sun.mail.util.MailSSLSocketFactory;

public class MailSSL  {
	private String content;
	
	private String subject;
	private ArrayList<InternetAddress> to;
	private Properties p;
	public MailSSL(ArrayList<InternetAddress> to,String subject,String content)
	{
		super();
		this.content = content;
		this.to = to;
		this.subject = subject;
	}
	
	public static void main(String args[])throws Exception
	{
		ArrayList<InternetAddress> to = new ArrayList<InternetAddress>();

		to.add(new InternetAddress("c.junsheng@hotmail.com"));

		MailSSL sender = new MailSSL(to,"subject","content");
		sender.run();
		//new Main(to);

	}
	
	public void run() {
		try {

			// �O�����ͻ����YӍ
			String host = "smtp.gmail.com";
			String from = "bt1602gp@gmail.com";
			String user= "bt1602gp";
			String pwd= "admin@gmail";
			String port = "587";
			
			Properties props = System.getProperties();

			
			// �O��SMTP server

			props.put("mail.smtp.host", host);
			props.put("mail.smtp.auth", "true");
			//props.put("mail.smtp.port", port);
			//props.put("mail.smtp.starttls.enable", true);
			//ʹ��ssl��tls�B��
			MailSSLSocketFactory sf = new MailSSLSocketFactory();
			sf.setTrustAllHosts(true); 
			props.put("mail.imap.ssl.trust", "*");
			props.put("mail.imap.ssl.socketFactory", sf);
			//�J�C
			Authenticator auth = new SMTPAuthenticator(user,pwd);
			// ����Properties����һ��Session
			Session mailSession = Session.getInstance(props, auth);
			

			// ��Session����һ��Message

			/*Message mailMessage = new MimeMessage(mailSession);
			// Set from email address
			mailMessage.setFrom(new InternetAddress(from));
			// Set to mail address
			mailMessage.setRecipient(Message.RecipientType.TO,
					new InternetAddress(to));
			// �O�����}
			mailMessage.setSubject("Hello JavaMail");
			// �O��Mail����
			mailMessage.setText("Wellcome to  JavaMail...����!!");*/
			
			
			MimeMessage message = new MimeMessage(mailSession);
			message.setFrom(new InternetAddress("c.junsheng@hotmail.com"));
			// System.out.println(p.getProperty("fromName","utf-8"));
			  /*new InternetAddress(
					  to)*/
			  for(int i = 0 ; i < to.size();i++)
				  message.addRecipient(Message.RecipientType.TO, to.get(i));
			  // ������}
			  message.setSubject(this.subject);
			  
			  message.setSentDate(new Date());
			  // ��multipart���ӂ��e����body
			  Multipart multipart = new MimeMultipart();

			  //�O�����ݱ���
			  BodyPart contentPart = new MimeBodyPart();
			 //Multi
			  contentPart.setContent(content,"text/plain;charset=big5");//�oBodyPart�����O�Ã��ݺ͸�ʽ/���a��ʽ
			  //�����փ���
			  //contentPart.setText(content);
			  multipart.addBodyPart(contentPart);

			  // ���Ӹ���
			  // BodyPart messageBodyPart = new MimeBodyPart();
			  // DataSource source = new FileDataSource(affix);
			  // ���Ӹ���������
			  // messageBodyPart.setDataHandler(new DataHandler(source));
			  // �������}
			  // ʹ��base64���a,׌�����^�̃��ݲ���׃�y�a
			  // sun.misc.BASE64Encoder enc = new sun.misc.BASE64Encoder();
			  // messageBodyPart.setFileName(MimeUtility.encodeText(filename,"BIG5","B"));
			  // multipart.addBodyPart(messageBodyPart);

			  // ��multipart�ŵ�message��
			  message.setContent(multipart);
			  // �����]��
			  message.saveChanges();
			
			
			Transport transport = mailSession.getTransport("smtp");
			// ����
			transport.connect(host, user, pwd);
			transport.sendMessage(message, message.getAllRecipients());
			transport.close();
			//Transport.send(mailMessage);

			//System.out.println("\n Mail was sent successfully.");

		} catch (Exception e) {

			e.printStackTrace();

		}

	}
	private class SMTPAuthenticator extends javax.mail.Authenticator {
		private String SMTP_AUTH_PWD;
		private String SMTP_AUTH_USER;
		public SMTPAuthenticator(String SMTP_AUTH_USER,String SMTP_AUTH_PWD)
		{
			super();
			this.SMTP_AUTH_USER = SMTP_AUTH_USER;
			this.SMTP_AUTH_PWD = SMTP_AUTH_PWD;
		}
        public PasswordAuthentication getPasswordAuthentication() {
           String username = SMTP_AUTH_USER;
           String password = SMTP_AUTH_PWD;
           System.out.println(SMTP_AUTH_USER+";"+SMTP_AUTH_PWD);
           return new PasswordAuthentication(username, password);
        }
    }
}