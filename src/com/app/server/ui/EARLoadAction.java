package com.app.server.ui;

import java.io.PrintWriter;
import java.lang.management.ManagementFactory;
import java.util.ArrayList;
import java.util.UUID;
import java.util.concurrent.CopyOnWriteArrayList;

import javax.management.MBeanServer;
import javax.management.MBeanServerFactory;
import javax.management.ObjectName;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.app.server.filter.SessionObj;
import com.app.server.form.LoginForm;

public class EARLoadAction extends Action{
	public ActionForward execute(ActionMapping mapping,ActionForm form,
			HttpServletRequest request,HttpServletResponse response)
	        throws Exception {
			LoginForm loginForm = (LoginForm)form;
			ArrayList<MBeanServer> mbs =  MBeanServerFactory.findMBeanServer(null);
			MBeanServer singham=null;
			String mbsname=request.getParameter("mbsname");
			for(MBeanServer singhamMBeanServer:mbs){
					if(singhamMBeanServer.getDefaultDomain().equalsIgnoreCase(mbsname)){
						singham=singhamMBeanServer;
						break;
					}
			}
			HttpSession session= request.getSession();
			session.setAttribute("filter", ".ear");
			CopyOnWriteArrayList<String> ears=(CopyOnWriteArrayList<String>)singham.getAttribute(new ObjectName("org.singam.server:type=deployer,service=EARDeployer"), "EarsDeployed");
			StringBuffer buffer=new StringBuffer();
			buffer.append("<div id='tablediv'><table id='table' align='center'><thead><tr><th>"
					+ "delete</th><th>ears</th></tr></thead><tfoot>	<tr>		"
					+ "<th>delete</th>		<th>ears</th></tfoot><tbody>");
			for(String ear:ears){
				buffer.append("<tr><td align='center'><img src='delete.gif' class='mousechange' onclick='undeploy(\""+ear+"\")'/></td>");
				buffer.append("<td align='center'>"+ear+"</td></tr>");
			}
			String uuid=UUID.randomUUID().toString();
			buffer.append("</tbody></table></div>"
					+ "<div align=\"center\"><input type=\"file\" id=\"browse"+uuid+"\" name=\"file\" accept=\""+session.getAttribute("filter")+"\"/><input type=\"button\" id=\""+uuid+"\" value=\"Upload\"></input></div>"
					+ "<script type='text/javascript'>"
					+ "$(\"button\").unbind();"
					+ "$('#"+uuid+"').button().click(uploadclick);"
					+ "$('#tablediv').find('tbody > tr:even').addClass('alternate');"
					+ "$('#table').table({height: 300, columns: {resizable: false, initialWidths: function() { var width = jQuery('#my-table').width(); var ps = [40, 15, 30, 15]; return ps.map(function(value, i){ return Math.round(width * value / 100); });}}});"
					+ "new ResizeSensor($('#tablediv').find('table:first').parent().get(0), function() { var wrap = $('#tablediv').find('table:first').parent(); $('#tablediv').find('table:first').table('instance').resize(wrap.width(), null); });</script>");
			response.setContentType("text/html");
			PrintWriter out = response.getWriter();
			out.println(buffer.toString());
			out.flush();
			//request.getSession().setAttribute("ears", ears);
			//request.getSession().setAttribute("package", "ear");
			return mapping.findForward("success");
		}
}
