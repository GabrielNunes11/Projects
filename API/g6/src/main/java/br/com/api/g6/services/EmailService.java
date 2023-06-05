package br.com.api.g6.services;

import java.util.Properties;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import br.com.api.g6.dto.ProdutoDTO;
import br.com.api.g6.dto.UsuarioDTO;
import br.com.api.g6.security.repositories.UserRepository;
import jakarta.mail.MessagingException;
import jakarta.mail.internet.MimeMessage;

@Service
public class EmailService {

	@Autowired
	JavaMailSender emailSender;

	@Autowired
	UserRepository userRepository;

	@Bean
	public JavaMailSender javaMailSender() {
		JavaMailSenderImpl emailSender = new JavaMailSenderImpl();
		Properties properties = new Properties();

		emailSender.setHost("smtp.gmail.com");
		emailSender.setPort(587);
		emailSender.setUsername("g6serratec@gmail.com");
		emailSender.setPassword("jxpsznwjatmfrjbu");
		properties.put("mail.smtp.auth", true);
		properties.put("mail.smtp.starttls.enable", true);
		emailSender.setJavaMailProperties(properties);

		return emailSender;

	}

	public void envioEmailCadastroUsuario(UsuarioDTO usuarioDTO) throws MessagingException {
		this.emailSender = javaMailSender();
		MimeMessage messageUsuario = emailSender.createMimeMessage();
		MimeMessageHelper helperUsuario = new MimeMessageHelper(messageUsuario, true);

		try {
			helperUsuario.setFrom("g6serratec@gmail.com");
			helperUsuario.setTo("gabriel.l.silva17@aluno.senai.br");
			helperUsuario.setSubject("Novo Usuário");

			StringBuilder stringBuilder = new StringBuilder();
			stringBuilder.append("<html>\r\n");
			stringBuilder.append("   <body>\r\n");
			stringBuilder.append("		<div align=\"center\">\r\n");
			stringBuilder.append("			<h1>Parabéns o usuário foi registrado com sucesso!\r\n</h1>");
			stringBuilder.append("		</div>\r\n");
			stringBuilder.append("		<br/>\r\n");
			stringBuilder.append("		<div>\r\n");
			stringBuilder.append("		  <p>O usuário " + usuarioDTO.getNome()
					+ " foi adicionado com sucesso ao nosso banco de dados! \r\n</p>");
			stringBuilder.append("		</div>\r\n");
			stringBuilder.append("	 </body>\r\n");
			stringBuilder.append("</html>\r\n");

			helperUsuario.setText(stringBuilder.toString(), true);
			emailSender.send(messageUsuario);
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	public void envioEmailCadastroProduto(ProdutoDTO produtoDTO) throws MessagingException {
		this.emailSender = javaMailSender();
		MimeMessage messageProduto = emailSender.createMimeMessage();
		MimeMessageHelper helperProduto = new MimeMessageHelper(messageProduto, true);

		try {
			helperProduto.setFrom("g6serratec@gmail.com");
			helperProduto.setTo("gabriel.l.silva17@aluno.senai.br");
			helperProduto.setSubject("Novo Usuário");

			StringBuilder stringBuilder = new StringBuilder();
			stringBuilder.append("<html>\r\n");
			stringBuilder.append("   <body>\r\n");
			stringBuilder.append("		<div align=\"center\">\r\n");
			stringBuilder.append("			<h1>Parabéns o produto foi registrado com sucesso!\r\n</h1>");
			stringBuilder.append("		</div>\r\n");
			stringBuilder.append("		<br/>\r\n");
			stringBuilder.append("		<div>\r\n");
			stringBuilder.append("		  <p>O produto " + produtoDTO.getNome()
					+ " foi adicionado com sucesso ao nosso banco de dados! \r\n</p>");
			stringBuilder.append("		</div>\r\n");
			stringBuilder.append("	 </body>\r\n");
			stringBuilder.append("</html>\r\n");

			helperProduto.setText(stringBuilder.toString(), true);
			emailSender.send(messageProduto);
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
