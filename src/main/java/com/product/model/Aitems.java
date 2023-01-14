package com.product.model;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.util.Base64;
import java.util.List;

import javax.crypto.Mac;
import javax.crypto.spec.SecretKeySpec;

import org.json.JSONArray;
import org.json.JSONObject;

public class Aitems {
	public List<Object> aitems(String type,int targetId){	
		String accessKey="3B2E92563ABDBD935C5D";
		String secretKey="C01B1002A1789BC457BFBA027F8D146104784249";
		String method="GET";
		String timestamp=Long.toString(System.currentTimeMillis());
		//String type="personalRecommend";//personalRecommend, relatedItem, pop
		//String targetId="1";
		String requestUrl="/api/v1/services/vqs9ovhlgrz/infers/lookup?type="+type+"&targetId="+targetId;
		String apiUrl="https://aitems.apigw.ntruss.com/api/v1/services/vqs9ovhlgrz/infers/lookup?type="+type+"&targetId="+targetId;
		
		
		try {
			URL url= new URL(apiUrl);
			//System.out.println("-----"+makeSignature(apiUrl,timestamp,method,accessKey,secretKey));
			HttpURLConnection con=(HttpURLConnection)url.openConnection();
			con.setUseCaches(false);
			con.setDoOutput(true);
			con.setDoInput(true);
			con.setRequestProperty("content-type", "application/json");
			con.setRequestProperty("x-ncp-apigw-timestamp", timestamp);
			con.setRequestProperty("x-ncp-iam-access-key",accessKey);
			con.setRequestProperty("x-ncp-apigw-signature-v2",makeSignature(requestUrl,timestamp,method,accessKey,secretKey));
			con.setRequestMethod(method);
			con.setDoOutput(true);
			int responseCode=con.getResponseCode();
			//System.out.println("resCode: "+responseCode);
			
			StringBuffer response=new StringBuffer();
			BufferedReader br;
			if(responseCode==200) {
				br=new BufferedReader(new InputStreamReader(con.getInputStream(),"UTF-8"));
			}else {
				System.out.println("Error발생: "+responseCode);
				br=new BufferedReader(new InputStreamReader(con.getErrorStream(),"UTF-8"));
			}
			String line="";
			if(br!=null) {
				while((line=br.readLine())!=null) {
					response.append(line);
				}
				br.close();
			}
			//System.out.println("response==="+response.toString());
			JSONObject json=new JSONObject(response.toString());
			JSONArray summary=json.getJSONArray("values");
			//System.out.println(summary);
			List<Object> list=summary.toList();
			return list;
		}catch(Exception e) {
			e.printStackTrace();
			return null;
		}//try----
		
	}//main()-------
	
	public static String makeSignature(String requestUrl, String timestamp, String method, String accessKey, String secretKey)
		throws NoSuchAlgorithmException,InvalidKeyException{
		String space=" ";
		String newLine="\n";
		String message= new StringBuilder()
				.append(method)
				.append(space)
				.append(requestUrl)
				.append(newLine)
				.append(timestamp)
				.append(newLine)
				.append(accessKey)
				.toString();
		SecretKeySpec signingKey;
		String encodeBase64String;
			try {
				signingKey=new SecretKeySpec(secretKey.getBytes("UTF-8"),"HmacSHA256");
				Mac mac=Mac.getInstance("HmacSHA256");
				mac.init(signingKey);
				byte[] rawHmac=mac.doFinal(message.getBytes("UTF-8"));
				encodeBase64String=Base64.getEncoder().encodeToString(rawHmac);
			}catch(UnsupportedEncodingException e) {
				encodeBase64String =e.toString();
			}
			//System.out.println(encodeBase64String);
		return encodeBase64String;
	}
}
