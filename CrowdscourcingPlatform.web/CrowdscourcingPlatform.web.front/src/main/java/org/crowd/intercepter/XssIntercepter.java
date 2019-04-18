package org.crowd.intercepter;

import java.io.IOException;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.filter.OncePerRequestFilter;

public class XssIntercepter extends OncePerRequestFilter {

	@Override
	protected void doFilterInternal(HttpServletRequest request, HttpServletResponse response, FilterChain filterChain)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		// 将request通过自定义的装饰类进行装饰
		System.err.println("过滤1");
		XssRequestIntercepter xssRequest = new XssRequestIntercepter((HttpServletRequest) request);     
		filterChain.doFilter(xssRequest, response);
        
	}

}
