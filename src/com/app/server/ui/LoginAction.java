package com.app.server.ui;

import java.lang.management.ManagementFactory;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.management.MBeanServer;
import javax.management.MBeanServerFactory;
//import javax.resource.cci.ConnectionSpec;
//import javax.resource.cci.InteractionSpec;
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
	//	System.out.println(conSpec);
//		System.out.println(iSpec_ADD);
//		System.out.println(iSpec_FIND);
			LoginForm loginForm = (LoginForm)form;
			if(loginForm.getUsername().equals("arun")&&loginForm.getPassword().equals("admin")){
				SessionObj sessionObj=new SessionObj();
				sessionObj.setSessionId(request.getSession().getId());
				request.getSession().setAttribute("SESSIONOBJ", sessionObj);
				List<String> singams=new ArrayList<String>();
				/*List<MBeanServer> mbs =  MBeanServerFactory.findMBeanServer(null);
				MBeanServer singham=null;
				
				for(MBeanServer singhamMBeanServer:mbs){				
						if(singhamMBeanServer.getDefaultDomain().startsWith("singam")){
							singams.add(singhamMBeanServer.getDefaultDomain());
						}
				}*/
				MBeanServer mbs = ManagementFactory.getPlatformMBeanServer();
				singams.add(mbs.getDefaultDomain());
				System.out.println(singams);
				request.getSession().setAttribute("singams", singams);
				return mapping.findForward("success");
			}
			request.getSession().invalidate();
			return mapping.findForward("failure");
		}
	
}
