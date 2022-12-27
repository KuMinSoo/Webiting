package com.user.service;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.URI;
import java.net.URL;

import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONObject;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.util.UriComponentsBuilder;

@Service
public class KakaoService {
	
	// 카카오 로그인 access_token 리턴
	public String getAccessToken(String code) throws Exception {

	    String accessToken = "";

	    // restTemplate을 사용하여 API 호출
	    RestTemplate restTemplate = new RestTemplate();
	    //String reqUrl = "/oauth/token";
	    URI uri = URI.create("https://kauth.kakao.com/oauth/token");

	    HttpHeaders headers = new HttpHeaders();

	    MultiValueMap<String, Object> parameters = new LinkedMultiValueMap<String, Object>();
	    parameters.set("grant_type", "authorization_code");
	    parameters.set("client_id", "d5db72c4c66d2bc59fcd57535bb579d1");
	    parameters.set("redirect_uri", "http://localhost:9090/login/oauth_kakao");
	    parameters.set("code", code);

	    HttpEntity<MultiValueMap<String, Object>> restRequest = new HttpEntity<>(parameters, headers);
	    ResponseEntity<JSONObject> apiResponse = restTemplate.postForEntity(uri, restRequest, JSONObject.class);
	    JSONObject responseBody = apiResponse.getBody();

	    accessToken = (String) responseBody.get("access_token");

	    return accessToken;
	}
	
	  
	public String getKakaoEmail(String accessToken) throws Exception {

	    String kakaoEmail = "";

	    // restTemplate을 사용하여 API 호출
	    RestTemplate restTemplate = new RestTemplate();
	    //String reqUrl = "/v2/user/me";
	    URI uri = URI.create("https://kauth.kakao.com/v2/user/me" );

	    HttpHeaders headers = new HttpHeaders();
	    headers.set("Authorization", "bearer " + accessToken);
	    headers.set("KakaoAK", "d5db72c4c66d2bc59fcd57535bb579d1");

	    MultiValueMap<String, Object> parameters = new LinkedMultiValueMap<String, Object>();
	    parameters.add("property_keys", "[\"email\"]");

	    HttpEntity<MultiValueMap<String, Object>> restRequest = new HttpEntity<>(parameters, headers);
	    ResponseEntity<JSONObject> apiResponse = restTemplate.postForEntity(uri, restRequest, JSONObject.class);
	    JSONObject responseBody = apiResponse.getBody();
	    //
	    //JSONObject kakaoAccountJsonObject = (JSONObject)responseBody.get("kakao_account");
	    //kakaoEmail = kakaoAccountJsonObject.get("email").toString();
	    kakaoEmail = (String) responseBody.get("id");
        //
	    //kakaoEmail = (String) responseBody.get("email");

	    return kakaoEmail;
	}
	
	
	private final String GRANT_TYPE= "authorization_code";
    private final String CLIENT_ID = "d5db72c4c66d2bc59fcd57535bb579d1";
    private final String REDIRECT_URI= "http://localhost:9090/login/oauth_kakao";
    private final String TOKEN_URL = "https://kauth.kakao.com/oauth/token";

    public String getAccessTokenJsonData(String code){
        RestTemplate restTemplate = new RestTemplate();

        // 헤더 설정
        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_FORM_URLENCODED);
        HttpEntity<?> request = new HttpEntity<>(headers);

        // URI 빌더 사용
        UriComponentsBuilder uriComponentsBuilder = UriComponentsBuilder.fromHttpUrl(TOKEN_URL)
                .queryParam("grant_type", GRANT_TYPE)
                .queryParam("client_id", CLIENT_ID)
                .queryParam("redirect_uri", REDIRECT_URI)
                .queryParam("code", code);

        // 요청 URI과 헤더를 같이 전송
        ResponseEntity<String> responseEntity = restTemplate.exchange(
                uriComponentsBuilder.toUriString(),
                HttpMethod.POST,
                request,
                String.class
        );

        if (responseEntity.getStatusCode() == HttpStatus.OK) {
            return responseEntity.getBody();
        }
        return "error";
    }
	
	
	
	private final String HTTP_REQUEST = "https://kapi.kakao.com/v2/user/me";

    public String getUserInfo(String accessToken){
        try {
            String jsonData = "";

            // URI를 URL객체로 저장
            URL url = new URL(HTTP_REQUEST + "?access_token=" + accessToken);

            // 버퍼 데이터(응답 메세지)를 한 줄씩 읽어서 jsonData에 저장
            BufferedReader bf;
            bf = new BufferedReader(new InputStreamReader(url.openStream(), "UTF-8"));
            String line;
            while((line = bf.readLine()) != null){
                jsonData+=line;
            }
            System.out.println(jsonData);
            return jsonData;

        } catch(Exception e) {
            return "success";
        }
    }
    
    
    
}////////////////////////////////////////////////////
