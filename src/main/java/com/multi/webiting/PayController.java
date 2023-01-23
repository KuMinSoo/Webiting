package com.multi.webiting;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.product.model.OrderedVO;
import com.siot.IamportRestClient.IamportClient;
import com.siot.IamportRestClient.exception.IamportResponseException;
import com.siot.IamportRestClient.response.IamportResponse;
import com.siot.IamportRestClient.response.Payment;
import com.user.model.UserVO;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class PayController {
	
	
	private IamportClient api;
	
	public PayController() {
		this.api = new IamportClient("6817372585767420",
		"jwACfmGjHijBReeDgmpXlU00BcwqqjxXGzXG52ce6Ys2f3dkLgbf7gNH7kINTWku8VvTh9mpkFDejAan");
	}
	
	@ResponseBody
	@RequestMapping(value="/verifyIamport/{imp_uid}",produces = "application/json")
	public Payment paymentByImpUid(@PathVariable(value= "imp_uid") String imp_uid) 
	throws IamportResponseException, IOException{
		
		IamportResponse<Payment> result= api.paymentByImpUid(imp_uid);
		log.info(result.getResponse().getAmount());
		return result.getResponse();
	}
	
	
	@RequestMapping("/kakaoPay")
	@ResponseBody
	public String kakaoPay() {
		try {
			URL url=new URL("https://kapi.kakao.com/v1/payment/ready");
			HttpURLConnection con=(HttpURLConnection) url.openConnection();
			con.setRequestMethod("POST");
			con.setRequestProperty("Authorization", "KakaoAK 4ef1165347ea1d8cd5b7109d7790e1bb");
			con.setRequestProperty("Content-Type", "application/x-www-form-urlencoded; charset=utf-8");
			con.setDoOutput(true);
			con.setDoInput(true);
			String param="cid=TC0ONETIME&partner_order_id=partner_order_id&partner_user_id=partner_user_id&item_name=efssef&vat_amount=200&quantity=1&total_amount=2200&tax_free_amount=0&approval_url=http://localhost:9090/index&fail_url=http://localhost:9090/index&cancel_url=http://localhost:9090/index";
			OutputStream output=con.getOutputStream();
			DataOutputStream outputStream=new DataOutputStream(output);
			outputStream.writeBytes(param);
			outputStream.flush();
			outputStream.close();
			
			int result=con.getResponseCode();
			System.out.println("result=="+result);
			InputStream input;
			BufferedReader buf=null;
			if(result==200) {
				input=con.getInputStream();
				InputStreamReader reader=new InputStreamReader(input);
				buf=new BufferedReader(reader);
			
			}else {
				input=con.getErrorStream();
				InputStreamReader reader=new InputStreamReader(input);
				buf=new BufferedReader(reader);;
			}
		   StringBuffer res=new StringBuffer();
		   String str="";
		   while((str=buf.readLine())!=null) {
			   res.append(str);
		   }
			System.out.println(res.toString());
			return res.toString();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "{\"result\":\"NO\"}";
		
		
	}
	
	

	 
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
