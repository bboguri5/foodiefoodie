package com.project.foodiefoodie.common.api.payment.service;

import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.project.foodiefoodie.common.api.KakaoMyApp;
import com.project.foodiefoodie.member.domain.Member;
import com.project.foodiefoodie.util.LoginUtils;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpSession;
import java.io.*;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLConnection;
import java.util.HashMap;
import java.util.Map;

@Service
@Log4j2
public class KakaoService {


    // 결제 준비 로직
    public Map<String, String> readyForPayment(HttpSession session) throws IOException {

        // 1. 정해진 요청 url
        String reqUri = "https://kapi.kakao.com/v1/payment/ready";


        // 2. 찐 url 객체로 포장
        URL url = new URL(reqUri);


        // 3. connection 객체 필요
        HttpURLConnection connection = (HttpURLConnection) url.openConnection();


        // 4. 요청 정보 설정
        connection.setRequestMethod("POST");

        // 4-1. 요청 헤더 설정
        connection.setRequestProperty("Authorization", "KakaoAK " + KakaoMyApp.KAKAO_ADMIN_KEY);
        connection.setRequestProperty("Content-type", "application/x-www-form-urlencoded;charset=utf-8");

        connection.setDoOutput(true); // 응답 결과를 받아보자


        sendReadyForPaymentRequest(connection, session);


        // 5. 응답 데이터 받기
        try (BufferedReader br = new BufferedReader(new InputStreamReader(connection.getInputStream()))) {


            String responseData = br.readLine();


            log.info("responseData - {}", responseData);


            // 날아온 json 데이터를 자바 서버 내에서 써먹을 수 있게 파싱
            JsonParser parser = new JsonParser();

            // 자바 서버 내에서 쓸 수 있는 객체 형태로 변환됨.
            JsonElement element = parser.parse(responseData);


            // 6. 데이터 추출
            JsonObject object = element.getAsJsonObject();
            String tid = object.get("tid").getAsString(); // 결제 고유 번호
            String mobileAppRedirectUrl = object.get("next_redirect_app_url").getAsString(); // 모바일 앱인 경우
            String mobileWebRedirectUrl = object.get("next_redirect_mobile_url").getAsString(); // 모바일 웹인 경우
            String pcRedirectUrl = object.get("next_redirect_pc_url").getAsString(); // 핵심) pc 웹인 경우
            String androidAppScheme = object.get("android_app_scheme").getAsString(); // 안드로이드 앱 스키마
            String iosAppScheme = object.get("ios_app_scheme").getAsString(); // ios 앱 스키마
            String createdAt = object.get("created_at").getAsString(); // 결제 준비 요청 시간


            Map<String, String> map = new HashMap<>();

            // 일단 당장 필요한 것만 담아서 리턴하자.
            map.put("tid", tid);
            map.put("pcRedirectUrl", pcRedirectUrl);


            return map;

        } catch (Exception e) {
            e.printStackTrace();
        }


        return null;
    }


    private static void sendReadyForPaymentRequest(HttpURLConnection connection, HttpSession session) {

        Member member = (Member) session.getAttribute(LoginUtils.LOGIN_FLAG);

        // 4-2. 요청 파라미터 추가
        try (BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(connection.getOutputStream()))) {

            StringBuilder queryParam = new StringBuilder();
            // 테스트용이라 가맹점 코드는 [ TC0ONETIME ] 활용. 실제로 사용하기 위해선 제휴를 맺어야 함.
            queryParam
                    .append("cid=TC0ONETIME")
                    .append("&partner_order_id=999") // 가맹점 주문번호. 테스트용 임의 주문번호 999 부여
                    .append("&partner_user_id=" + member.getEmail())
                    .append("&item_name=" + "트러플 오일 파스타") // 복수의 품명은 어케..?
                    .append("&quantity=1") // 수량 일단 1개 임의 지정
                    .append("&total_amount=25000") // 포장금액 2만 5천원 임의 지정
                    .append("&tax_free_amount=" + 0) // 면세액이 얼만지 적는 항목 같음..
                    .append("&approval_url=" + "http:localhost:8186/success-order") // 결제 성공시 redirect_url 지정
                    .append("&cancel_url=" + "http:localhost:8186/cancel-order") // 결제 취소시 redirect_url 지정
                    .append("&fail_url=" + "http:localhost:8186/fail-order"); // 결제 실패시 redirect_url 지정


            bw.write(queryParam.toString());


            bw.flush();


            int responseCode = connection.getResponseCode();
            log.info("responseCode - {}", responseCode);


        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
