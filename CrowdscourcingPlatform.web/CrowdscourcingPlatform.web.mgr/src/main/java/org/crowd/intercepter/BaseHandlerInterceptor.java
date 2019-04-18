package org.crowd.intercepter;

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
		System.out.println("before");
		return true;
	}

	
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView mv) throws Exception {
		System.out.println("mv 执行");
	}

	
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception e) throws Exception {
		System.out.println("after");
	}

}
