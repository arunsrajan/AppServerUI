package com.app.server.ui;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.DynaActionForm;

import com.app.server.filter.SessionObj;
import com.app.server.form.LoginForm;

public class LoginAction extends Action{

	public ActionForward execute(ActionMapping mapping,ActionForm form,
			HttpServletRequest request,HttpServletResponse response)
	        throws Exception {
			LoginForm loginForm = (LoginForm)form;
			if(loginForm.getUsername().equals("arun")&&loginForm.getPassword().equals("admin")){
				SessionObj sessionObj=new SessionObj();
				sessionObj.setSessionId(request.getSession().getId());
				request.getSession().setAttribute("SESSIONOBJ", sessionObj);
				return mapping.findForward("success");
			}
			request.getSession().invalidate();
			return mapping.findForward("failure");
		}
	
}
