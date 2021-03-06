package com.app.server.ui;

import java.io.File;
import java.io.FileOutputStream;
import java.net.URL;
import java.util.ArrayList;
import java.util.concurrent.ConcurrentHashMap;

import javax.management.MBeanServer;
import javax.management.MBeanServerFactory;
import javax.management.ObjectName;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import org.singam.web.multipart.MultiPartFormInfo;

public class UndeployAction extends Action{
	public ActionForward execute(ActionMapping mapping,ActionForm form,
			HttpServletRequest request,HttpServletResponse response)
	        throws Exception {
			ArrayList<MBeanServer> mbs =  MBeanServerFactory.findMBeanServer(null);
			MBeanServer singham=null;
			String mbsname=request.getParameter("mbsname");
			for(MBeanServer singhamMBeanServer:mbs){
					if(singhamMBeanServer.getDefaultDomain().equalsIgnoreCase(mbsname)){
						singham=singhamMBeanServer;
						break;
					}
			}

			String deploydir=(String)singham.getAttribute(new ObjectName("com.app.server:type=serverinfo"), "Deploydirectory");
			URL packg=new URL(request.getParameter("filename"));
			ObjectName deployerName=(ObjectName)singham.invoke(new ObjectName("org.singam.server:type=service,service=DeploymentScanner"), "findDeployer", new Object[]{new File(packg.getFile())}, new String[]{File.class.getName()});
			singham.invoke(deployerName, "undeploy", new Object[]{packg}, new String[]{URL.class.getName()});
			return mapping.findForward("success");
		}
}