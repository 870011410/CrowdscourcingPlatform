package org.crowd.controller;

import com.alibaba.fastjson.JSONObject;
import org.crowd.model.User;
import org.crowd.rsa.Md5;
import org.crowd.rsa.Rsa;
import org.crowd.service.LoginService;
import org.crowd.service.UserService;
import org.crowd.utils.RanImage;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import redis.clients.jedis.Jedis;

/**
 * <p>
 * Title : LoginController
 * </p>
 *
* <p>
 * Description :
 * </p>
 *
 * <p>
 * DevelopTools : Eclipse_x64_v4.9.0
 * </p>
 *
 * <p>
 * DevelopSystem : Windows10
 * </p>
 *
 * <p>
 * Company : org.wf
 * </p>
 *
 * @author : WuFan
 * @version : 12.0.0
 * @date : 2018年12月9日 下午10:22:17
 */
@Controller
public class LoginController {

    @Autowired
    private LoginService loginService;

    @Autowired
    private UserService userService;

    private JSONObject outJson = new JSONObject();

    private static int num=0;
    // 登录
    @RequestMapping("/do-login.action")
    @ResponseBody
    public JSONObject doLogin(String acc, String pwd, String code, HttpServletRequest req) {
        if (acc.length() <= 0 || pwd.length() <= 0 || code.length() <= 0) {
            // 用json
            outJson.put("type", "illegal");
            return outJson;
        }

        System.err.println(num+++"$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$");
        System.err.println(RanImage.code.toLowerCase()+"@@@@@@@@@@@@@@@@@@@@@@@@");
        System.err.println(code.toLowerCase()+"!!!!!!!!!!!!!!!!!!!!");
        String imageCode=(String)req.getSession().getAttribute("code");

        // 判断验证码
        if (imageCode.toLowerCase().equals(code.toLowerCase()) == false) {
            // 用json
            outJson.put("type", "codeWrong");
            return outJson;
        }

        //解密密码再加密成md5
        //解密密码
        try {
            byte[] decrypt = Rsa.decryptByPrivateKey(pwd, RsaController.privateKey);
            pwd = new String(decrypt);
            //加密成md5
            pwd = Md5.encryption(pwd + pwd.substring(0, 1));
        } catch (Exception e1) {
            // TODO Auto-generated catch block
            outJson.put("type", "fail");
            return outJson;
        }
        User user = new User();

        try {

            user = loginService.LoginServer(acc, pwd);


        } catch (Exception e) {
            // 用json
            outJson.put("type", "fail");
            return outJson;
        }

        // 存到session
        HttpSession session = req.getSession();
        session.setAttribute("user", user);


        // 用json
        outJson.put("type", "success");
        outJson.put("user", user);

        return outJson;
    }

    // 验证码
    @RequestMapping("/do-ranImage.action")
    public void imageCode(HttpServletRequest request, HttpServletResponse response) throws Exception {
        ImageIO.write(RanImage.getVerification(request), "png", response.getOutputStream()); // 将图片验证码输出
    }

    // 注册
    @RequestMapping("/do-reg.action")
    @ResponseBody
    public JSONObject doReg(String acc, String pwd, String repwd, String name, String phone, String email) {

        // 违法操作
        if (acc.length() <= 0 || pwd.length() <= 0 || repwd.length() <= 0 || name.length() <= 0 || phone.length() <= 0
                || email.length() <= 0) {
            // 用json
            outJson.put("type", "illegal");
            return outJson;
        }
        //解密重复密码和密码
        byte[] d;
        try {
            //解密密码
            d = Rsa.decryptByPrivateKey(pwd, RsaController.privateKey);
            pwd = new String(d);
            //解密重复密码
            d = Rsa.decryptByPrivateKey(repwd, RsaController.privateKey);
            repwd = new String(d);
        } catch (Exception e2) {
            // TODO Auto-generated catch block
            outJson.put("type", "fail");
            return outJson;
        }
        // 重复密码错误
        if (pwd.equals(repwd) == false) {
            // 用json
            outJson.put("type", "repwdWrong");
            return outJson;
        }

        // 账号重复
        if (userService.checkUserAcc(acc) > 0) {
            // 用json
            outJson.put("type", "accRepeat");
            return outJson;
        }

        // 昵称重复
        if (userService.checkRegName(name) > 0) {
            // 用json
            outJson.put("type", "nameRepeat");
            return outJson;
        }
        //密码再加密成md5
        try {
            pwd = Md5.encryption(pwd + pwd.substring(0, 1));
        } catch (Exception e1) {
            // TODO Auto-generated catch block
            outJson.put("type", "fail");
            return outJson;
        }
        // 注册
        try {
            userService.reg(acc, pwd, name, phone, email);
        } catch (Exception e) {
            // 用json
            outJson.put("type", "fail");
            return outJson;
        }

        // 用json
        outJson.put("type", "success");
        return outJson;
    }

    // 成为服务商
    @RequestMapping("/do-beProvider.action")
    @ResponseBody
    public JSONObject doBeProvider(Integer userId, Integer providerId, String userName, HttpServletRequest req) {

        try {
            userService.beProvider(userId, providerId, userName);
        } catch (Exception e) {
            // 用json
            outJson.put("type", "fail");
            return outJson;
        }

        User user = new User();
        user = userService.afterUpdate(userId);
        // 存到session
        HttpSession session = req.getSession();
        session.setAttribute("user", user);
        // 用json
        outJson.put("type", "success");
        outJson.put("user", user);
        return outJson;
    }

    public JSONObject getOutJson() {
        return outJson;
    }

    public void setOutJson(JSONObject outJson) {
        this.outJson = outJson;
    }
}
