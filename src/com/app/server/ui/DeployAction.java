package com.app.server.ui;

import java.io.File;
import java.io.FileOutputStream;
import java.io.PrintWriter;
import java.net.URL;
import java.util.ArrayList;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.CopyOnWriteArrayList;

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

import com.app.server.form.LoginForm;

public class DeployAction extends Action{
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
			ConcurrentHashMap param= (ConcurrentHashMap) request.getParameterMap();
			MultiPartFormInfo formInfo=(MultiPartFormInfo) param.get("file");
			System.out.println(param.get("file"));
			String deploydir=(String)singham.getAttribute(new ObjectName("com.app.server:type=serverinfo"), "Deploydirectory");
			if(formInfo.isFile()){
				FileOutputStream ostream=new FileOutputStream(deploydir+"/"+formInfo.getFileName());
				ostream.write(formInfo.getContent());
				ostream.close();
				URL packg=new URL("file:///"+deploydir+"/"+formInfo.getFileName());
				ObjectName deployerName=(ObjectName)singham.invoke(new ObjectName("com.app.server:type=service,service=DeploymentScanner"), "findDeployer", new Object[]{new File(deploydir+"/"+formInfo.getFileName())}, new String[]{File.class.getName()});
				singham.invoke(deployerName, "deploy", new Object[]{packg}, new String[]{URL.class.getName()});
				/*if(formInfo.getFileName().toLowerCase().endsWith(".ear")){
					singham.invoke(new ObjectName("com.app.server:type=deployer,service=EARDeployer"), "deploy", new Object[]{}, new String[]{URL.class.getName()});
				}
				else if(formInfo.getFileName().toLowerCase().endsWith(".war")){
					singham.invoke(new ObjectName("com.app.server:type=deployer,service=WARDeployer"), "deploy", new Object[]{new URL("file:///"+deploydir+"/"+formInfo.getFileName())}, new String[]{URL.class.getName()});
				}
				else if(formInfo.getFileName().toLowerCase().endsWith(".rar")){
					singham.invoke(new ObjectName("com.app.server:type=deployer,service=RARDeployer"), "deploy", new Object[]{new URL("file:///"+deploydir+"/"+formInfo.getFileName())}, new String[]{URL.class.getName()});
				}
				else if(formInfo.getFileName().toLowerCase().endsWith(".sar")){
					singham.invoke(new ObjectName("com.app.server:type=deployer,service=SARDeployer"), "deploy", new Object[]{new URL("file:///"+deploydir+"/"+formInfo.getFileName())}, new String[]{URL.class.getName()});
				}
				else if(formInfo.getFileName().toLowerCase().endsWith(".jar")){
					singham.invoke(new ObjectName("com.app.server:type=deployer,service=EJBDeployer"), "deploy", new Object[]{new URL("file:///"+deploydir+"/"+formInfo.getFileName())}, new String[]{URL.class.getName()});
				}
				else if(formInfo.getFileName().toLowerCase().endsWith(".ezb")){
					singham.invoke(new ObjectName("com.app.server:type=deployer,service=EZBeansDeployer"), "deploy", new Object[]{new URL("file:///"+deploydir+"/"+formInfo.getFileName())}, new String[]{URL.class.getName()});
				}*/

			}
			//request.getSession().setAttribute("ears", ears);
			//request.getSession().setAttribute("package", "ear");
			return mapping.findForward("success");
		}
}