package com.abc.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

@Service
public class EmailService {
    @Autowired
    JavaMailSender javaMailSender;
    public void sentMail(String to, String subject, String body){// to: truyền vào email đến + subject tiêu đề
        SimpleMailMessage message = new SimpleMailMessage();// ddongs gois tham số
        message.setTo(to);
        message.setSubject(subject);
        message.setText(body);
        message.setFrom("tbtclltd0101@gmail.com");
        javaMailSender.send(message);
    }
}
