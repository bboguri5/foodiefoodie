package com.project.foodiefoodie.common.api.mail.service;

import lombok.extern.log4j.Log4j2;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailException;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import javax.mail.Message.RecipientType;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.util.Random;

@Service
@Log4j2
public class EmailServiceImpl implements EmailService {

    @Autowired
    JavaMailSender emailSender;

    public static final String authCode = createKey();



    private MimeMessage createMessage(String email)throws Exception {
        log.info("sender : {}", email);
        log.info("authCode : {}", authCode);


        MimeMessage  message = emailSender.createMimeMessage();

        message.addRecipients(RecipientType.TO, email); // 보내는 대상
        message.setSubject("foodie foodie 비밀번호 찾기용 이메일 인증"); // 제목
        String msgg="";
        msgg+= "<div style='margin:100px;' align='center'>";
        msgg+= "<img src='https://i.imgur.com/YpWDRkZ.png' alt='로고 이미지' style='width='250px'; height='250px';'>";
//        msgg+= "<h1> FoodieFoodie </h1>";
        msgg+= "<br>";
        msgg+= "<h1>아래 코드를 인증코드 입력란에 입력해주세요.<p>";
        msgg+= "<br>";
        msgg+= "<div style='font-family:verdana';>";
        msgg+= "<h3 style='color:blue;'>비밀번호 찾기용 인증 코드</h3>";
        msgg+= "<div style='font-size:130%'>";
        msgg+= "CODE : <strong>";
        msgg+= authCode +"</strong></div><br/> ";
        msgg+= "</div>";
        message.setText(msgg, "utf-8", "html"); // 내용
        message.setFrom(new InternetAddress("kdf556@naver.com","FoodieFoodie")); // 보내는 사람

        return message;
    }

    
    // 인증코드 생성 메서드
    public static String createKey() {
        StringBuffer key = new StringBuffer();
        Random rnd = new Random();

        for (int i = 0; i < 8; i++) { // 인증코드 8자리
            int index = rnd.nextInt(3); // 0~2 까지 랜덤

            switch (index) {
                case 0:
                    key.append((char) ((int) (rnd.nextInt(26)) + 97));
                    //  a~z  (ex. 1+97=98 => (char)98 = 'b')
                    break;
                case 1:
                    key.append((char) ((int) (rnd.nextInt(26)) + 65));
                    //  A~Z
                    break;
                case 2:
                    key.append((rnd.nextInt(10)));
                    // 0~9
                    break;
            }
        }

        return key.toString();
    }



    // 직접적으로 이메일을 보내는 로직인듯
    @Override
    public String sendAuthCodeEmail(String email) throws Exception {
        // TODO Auto-generated method stub
        MimeMessage message = createMessage(email);

        try { // 예외처리
            emailSender.send(message);

        } catch(MailException es){
            es.printStackTrace();
            throw new IllegalArgumentException();
        }
        return authCode;
    }
}
