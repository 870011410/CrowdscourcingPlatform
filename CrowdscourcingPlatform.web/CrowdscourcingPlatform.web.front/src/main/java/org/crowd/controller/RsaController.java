package org.crowd.controller;

import java.security.Key;
import java.util.Map;

import org.crowd.rsa.Md5;
import org.crowd.rsa.Rsa;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONObject;

@Controller
public class RsaController {
	public static String publicKey;
	public static String privateKey;
	static {
		
			publicKey="MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCsRvvSSmewpLTv72O2+QTWVkVG8mQcEoRq1G2QT/SU9QLZEIiaxadJVzXnhFg+7sywuj2aG/dPIQF6zk3cNCdKyw5pjIYU6j0kiQlAf21KGTCCJtwpzmRGhweQVCq3Dp4wx7PP9donVDUcrRKpBAJ4dZjuPwvYqwrsQE2wBnVwnwIDAQAB";
			privateKey ="MIICdgIBADANBgkqhkiG9w0BAQEFAASCAmAwggJcAgEAAoGBAKxG+9JKZ7CktO/vY7b5BNZWRUbyZBwShGrUbZBP9JT1AtkQiJrFp0lXNeeEWD7uzLC6PZob908hAXrOTdw0J0rLDmmMhhTqPSSJCUB/bUoZMIIm3CnOZEaHB5BUKrcOnjDHs8/12idUNRytEqkEAnh1mO4/C9irCuxATbAGdXCfAgMBAAECgYBcXAXffLJQWk0CoSWlT6WPP1sOqR6QikDhgRdoGeV3Ak/PjXSe/T4tLIsinqosuxuT15T1DO8uRfSkIPxPBMrXBXuVpUZ6mTxRCQJ32fRdWq/ZCqaKt4+ruvJNIjKOQ/Ga5WQ2GRlEr8LZ564QjXLiE9+RBbOLWb6u4QhXrLdaWQJBAOGJiPwdsiTAhbIbW6fSNOtla50S3N4My0umDOpeNAXpUjYBoY9pbl8meRvJ4HHYq4WjDPcfQUhi1WSdsWIy8+MCQQDDi90ciOIT4wEBANimO6kf2na/phkrdX+R7QsKuyU/+v4nnZ+U2cL7moHFNLN5RUBDymO5OF4E57Fvw0//rAUVAkEAwwsR8BYuTSJBfLm0Ffnv0fKvkfMSFuWxmgZL/RLioooYkqPud/uRe6/l5GY9N7dM/hD30W6yIkt2h8Dn+iheSQJAYHMrE3j8sbxk8V6+fXet2pVBvxOpFIN28b4OlTNrkxw0ocugO6YRA1LZMTDmWSlsIkPAXkpMLXUuUqbuXXg2ZQJASAI1Pmq6UGKKYRDXzGYO5lJDl9Gse9hj4TOh1EyV42qJxAuxsw/k706BiLw4kXv9oQ3j55VmTmBBlOrnOiH/Qg==";
	}
	@RequestMapping("rsaPublic.action")
	@ResponseBody
	public JSONObject selectNeedType() {

		JSONObject data = new JSONObject();
		
		
		data.put("pub", publicKey);
		return data;
	}
		
	@RequestMapping("rsaMessage.action")
	@ResponseBody
	public JSONObject rsaMessage(String pwd) {
		
		JSONObject data = new JSONObject();
		 System.err.println(pwd);
		 //解密
		 try {
			 //解密
			byte[] decryptByPrivateKey = Rsa.decryptByPrivateKey(pwd,privateKey);
			pwd = new String(decryptByPrivateKey);
			System.err.println(pwd);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		 
		 //加密md5
		pwd=Md5.encryption(pwd+pwd.substring(0,1));		
		System.err.println(pwd);
		data.put("pub", "is");
		return data;
	}
}
