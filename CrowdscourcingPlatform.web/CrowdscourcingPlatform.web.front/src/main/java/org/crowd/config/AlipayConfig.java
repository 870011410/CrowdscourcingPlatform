package org.crowd.config;

import java.io.FileWriter;
import java.io.IOException;

/* *
 *类名：AlipayConfig
 *功能：基础配置类
 *详细：设置帐户有关信息及返回路径
 *修改日期：2017-04-05
 *说明：
 *以下代码只是为了方便商户测试而提供的样例代码，商户可以根据自己网站的需要，按照技术文档编写,并非一定要使用该代码。
 *该代码仅供学习和研究支付宝接口使用，只是提供一个参考。
 */

public class AlipayConfig {


//↓↓↓↓↓↓↓↓↓↓请在这里配置您的基本信息↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓

	// 应用ID,您的APPID，收款账号既是您的APPID对应支付宝账号
	public static String app_id = "2016092200573573";

	// 商户私钥，您的PKCS8格式RSA2私钥
	public static String merchant_private_key = "MIIEvgIBADANBgkqhkiG9w0BAQEFAASCBKgwggSkAgEAAoIBAQC7s71mIA/tS7iKrw/e8SlB9cbfe+uRK+LeuJbMG09/juava1rjmf63bQ+fUNH9NVlR4N/A0pTIeLZWKg7QHDoKQt6nBmoZxwbletaKDBVysSZzHesZ91tzASSZLJILToJOzZfGBnfXbLjoTDxVY1gr6QY58FRlSi6KaiAkVt8q/X7bqujjHpxP+ok1D1ytaX+6MiD5MO4vaOxWpJ04COSHDff29sN2TYI5I/rpwgIBcNS+Dlh/08/EzcerXZCAPQ35eGP2mFgSRg+hGFOerRXIobRVtT+sZEWEwV6sHVvxfgIk/z3gLSMv3uudexhWgfYX+TeiXnOr5nxr/ajPpuCZAgMBAAECggEBAJVX/Wo0OHflt38gqtAHsXv5wbIvNs7azDfJRrI/SJGFcaZBFJ/i9veansNz2qBMwjSTZ3RUGG0pHmqQLBkJXGStr9nVELZR1PrhMbHEy4vlx2HwfA688NYgIq589/ZnEOcCTbARlWih6L1ratXFpXHKhlmzDnNJAp6+sbQ4KnhYub3t1zehAOfqjzfTztBfdehge6yEda5iqYA680i1v/CKSa9cMPcNqXkW63G0KzrapD3jMHQZMxAblaVGJoV2GvuA8xjd9EOyU7ylPo94wcq1hERL4X7jlIkI5F2jVYSq48Uz0iHUVMlDk5NrUmxG5zjLx6aDtchSXD1AJcHnT8ECgYEA+ayQKx4PMww/5iFD6XJrUvaBawviatJtGHlcpVBQtDO8CGIdkhca2iBdQ1rl4pcUSLPIrM3I++QaPCE4KmjeA0Z+WWovdFmxVbKwwKvVUPHz9nY1rGu8I1/GXxQb2PIo7Hhtw32maEeAwjTduNX6j44ZId4MAQO2i1/lU776jOcCgYEAwHU2wkyFgtQhHKnkZZ7XLrCSIlfSeB3JhAqpgyjLZDeeoXQkXYCCsr8lldEozeIz3Jeg9LZ47AamAYUjsPj9AdCcVf0MNm2IHxxkTGLSV7aX/ObhqGidWuAabo4mLgsxEQoB7Zesjz6ns6AT4P8bxHzmSdXco3UCmEklv/bD9n8CgYAYPqWRSk33iwz5b+mEVdQOLlnK51CJRv3JDp/sfawYk52CwuRUN2IoJFRqIf2Iz1rs5GhsP19w9mmFxUQK+jv03XePfzw0dDFAPSXkz8rbHWOvXzM/Fwch+D7vJKi/nGRU8izWevEZ1zetpCyTslOudQIDw+gugQnM5vcB9t2lqQKBgAZjHXkfTwMDhUHNRZ41wlBzXbY0EfEYk/qE3BFVRkLCMcqL7zUHMc861sV9FoyWqD/27EmS0LqMke/U+lVCPitUQAv+hOw9gFn/+Dgsw2xTzAGBrBWJu0crztTCdPPsPSmimmPHN9vdKXWlp2M9NC+2MXJb3aGzHW3uZ4lSaDiDAoGBAMZJs69sI7SswxomlK9XgaUCEhoj64dgWtAENfY8Z3EQMqCQErrp55+BVCApFtR/tsJ0DEp3c4x5zkEbFZAFpb+70UFvY9VJ9SSChs0kyzcpuwtazGEfqqR6iZM+IQ0GapwJHgO4ImEeeuYPnH8elq7JSjvrH2U3kduD0iloxOBG";

	// 支付宝公钥,查看地址：https://openhome.alipay.com/platform/keyManage.htm 对应APPID下的支付宝公钥。
	public static String alipay_public_key = "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA4WfSmtNOFqo493gFWWDWwEK56iDiZL9fOwYvfz6bcmGUYgiCzD2yaIBrgvTTAChEPGPerok3GCu46xBWRWGSzmRn9fzw6nA45NRAAneizO5a7CdaCKbsQo/zeFvZ62i1jfaGfBEgAdHoa0pH14RTJDKHh4ioM66ROkEiWqlQ1PAoXCBnIM6DREiS/uQq+8bca5rkS3DWaZT7LN3awqc567eDXfyIYfzaVOiA4ZuY/3wL9uEncvkX2Sj05gB1xyP60b3Ni1nNzNAJrpQsA6oVr+/gP5dKX1AWiyRZeCyHzZgucSuP4plyvzB3X3Gbcq763YmkIdQHD6mHg1LGtFigMwIDAQAB";

	// 服务器异步通知页面路径 需http://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问
	public static String notify_url = "";

	// 页面跳转同步通知页面路径 需http://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问
	public static String return_url = "http://127.0.0.1:8080/CrowdscourcingPlatform.web.front/return_url";

	// 签名方式
	public static String sign_type = "RSA2";

	// 字符编码格式
	public static String charset = "utf-8";

	// 支付宝网关
	public static String gatewayUrl = "https://openapi.alipaydev.com/gateway.do";

	// 支付宝网关
	public static String log_path = "E:\\";

//↑↑↑↑↑↑↑↑↑↑请在这里配置您的基本信息↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑

	/**
	 * 写日志，方便测试（看网站需求，也可以改成把记录存入数据库）
	 * 
	 * @param sWord 要写入日志里的文本内容
	 */
	public static void logResult(String sWord) {


		FileWriter writer = null;
		try {
			writer = new FileWriter(log_path + "alipay_log_" + System.currentTimeMillis() + ".txt");
			writer.write(sWord);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (writer != null) {
				try {
					writer.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
	}
}
