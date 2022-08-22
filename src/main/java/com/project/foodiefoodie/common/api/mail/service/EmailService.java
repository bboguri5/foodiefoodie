package com.project.foodiefoodie.common.api.mail.service;

public interface EmailService {
    String sendAuthCodeEmail(String email) throws Exception;
}
