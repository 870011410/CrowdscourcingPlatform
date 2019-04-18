package org.crowd.intercepter;

import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

/**
 * 
     * <p>Title : BaseHandlerInterceptor</p>
     * <p>Description : </p>
     * <p>DevelopTools : Eclipse_x64_v4.9.0</p>
     * <p>DevelopSystem : window 7</p>
     * <p>Company : org.crowd</p>
     * @author : zhengjiawei
     * @date : 2018年12月6日 下午1:26:16
     * @version : 12.0.0
 */
public class BaseHandlerInterceptor implements HandlerInterceptor {
	
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		//禁止在输入框中输入script
		System.err.println("before");
		/*Enumeration enu=request.getParameterNames();  
		while(enu.hasMoreElements()){  
		String paraName=(String)enu.nextElement();
		System.err.println(paraName+": "+request.getParameter(paraName));
		
		//是否包含
		if(request.getParameter(paraName).toLowerCase().indexOf("script")!=-1) {
			//包含
			System.err.println("haha");
			return false;
		}
		}*/
		
		return true;
	}

	
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView mv) throws Exception {
		System.out.println("mv 执行");
	}

	
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception e) throws Exception {
		System.out.println("after");
	}

}
