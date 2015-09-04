package com.app.server.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class LogFilter implements Filter{

	@Override
	public void destroy() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void doFilter(ServletRequest req, ServletResponse resp,
			FilterChain chain) throws IOException, ServletException {
		
		
		HttpServletRequest httpreq=(HttpServletRequest)req;
		HttpServletResponse httpresp=(HttpServletResponse)resp;
		
		SessionObj sessObj=(SessionObj)httpreq.getSession().getAttribute("SESSIONOBJ");
		if(!httpreq.getRequestURI().endsWith("index.jsp")&&httpreq.getRequestURI().endsWith(".jsp")){
			System.out.println(httpreq.getRequestDispatcher("/index.jsp"));
			httpreq.getRequestDispatcher("/index.jsp").forward(req, resp);
		}
		else if(!httpreq.getRequestURI().endsWith("login.do")&&sessObj==null||sessObj!=null&&!sessObj.getSessionId().equals(httpreq.getSession().getId())){
			System.out.println(httpreq.getRequestDispatcher("/index.jsp"));
			httpreq.getRequestDispatcher("/index.jsp").forward(req, resp);
		}
		chain.doFilter(req, resp);
	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {
		// TODO Auto-generated method stub
		
	}

}
