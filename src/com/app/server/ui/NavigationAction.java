package com.app.server.ui;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.Socket;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.IOUtils;
import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.app.server.form.NavigationForm;

public class NavigationAction extends Action {
	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		NavigationForm navigationForm = (NavigationForm) form;
		if (navigationForm.getPage().equalsIgnoreCase("home")) {
			return mapping.findForward("home");
		} else if (navigationForm.getPage().equalsIgnoreCase("deploypanel")) {
			return mapping.findForward("deploypanel");
		} else if (navigationForm.getPage().equalsIgnoreCase("serverstartpanel")) {
			request.setAttribute("servers", listSingam());
			return mapping.findForward("serverstartpanel");
		}
		else if (navigationForm.getPage().equalsIgnoreCase("startserver")) {
			String message=start((String)navigationForm.getServerName());
			request.setAttribute("servers", listSingam());
			request.setAttribute("message", message);
			return mapping.findForward("serverstartpanel");
		}
		else if (navigationForm.getPage().equalsIgnoreCase("stopserver")) {
			String message=stop((String)navigationForm.getServerName());
			request.setAttribute("servers", listSingam());
			request.setAttribute("message", message);
			return mapping.findForward("serverstartpanel");
		}
		return mapping.findForward("failure");
	}
	
	public String listSingam() {
		String consoleInit = null;
		try(Socket consoleSock = new Socket("localhost", 7000);
				InputStream istr=consoleSock.getInputStream();
				OutputStream ostr=consoleSock.getOutputStream();
				InputStream istr1=consoleSock.getInputStream();
				) {
			consoleInit = skipServerInfo(istr);
			writeData(ostr, "LISTSINGAM\n");
			consoleInit = getData(istr1);
			consoleInit=consoleInit.replaceFirst("singam List \r\n------------- \r\n", "");
			consoleInit=consoleInit.replace("@\n------------- @\n", "");
			// consoleInit="Singam Server V1.0";
			// consoleSock.close();
		} catch (Exception ex) {
			System.out.println("Exception in Message" + ex.getMessage());
		}
		return consoleInit; 
	}

	public String start(String serverName) {
		String consoleInit = null;
		try(Socket consoleSock = new Socket("localhost", 7000);
				InputStream istr=consoleSock.getInputStream();
				OutputStream ostr=consoleSock.getOutputStream();
				InputStream istr1=consoleSock.getInputStream();
				) {
			consoleInit = skipServerInfo(istr);
			writeData(ostr, "spawncontainer "+serverName+"\n");
			consoleInit = getData(istr1);
			consoleInit=consoleInit.replace("@\n------------- @\n", "");
			// consoleInit="Singam Server V1.0";
			// consoleSock.close();
		} catch (Exception ex) {
			System.out.println("Exception in Message" + ex.getMessage());
			return serverName+" is not started"; 
		}
		return serverName+" successfully started"; 
	}

	
	public String stop(String serverName) {
		String consoleInit = null;
		try(Socket consoleSock = new Socket("localhost", 7000);
				InputStream istr=consoleSock.getInputStream();
				OutputStream ostr=consoleSock.getOutputStream();
				InputStream istr1=consoleSock.getInputStream();
				) {
			consoleInit = skipServerInfo(istr);
			writeData(ostr, "stopserver "+serverName+"\n");
			consoleInit = getData(istr1);
			consoleInit=consoleInit.replace("@\n------------- @\n", "");
			// consoleInit="Singam Server V1.0";
			// consoleSock.close();
		} catch (Exception ex) {
			System.out.println("Exception in Message" + ex.getMessage());
			return serverName+" is not stopped"; 
		}
		return serverName+" successfully stopped"; 
	}
	
	private String getData(InputStream istr) {
		StringBuffer buffer=null;
		try{
			buffer=new StringBuffer();
			char ch;
			while((ch=(char)istr.read())!=-1){
				buffer.append((char)ch);
				if(buffer.toString().endsWith("@\n------------- @\n"))break;
			}
			//istr.close();
		}
		catch(Exception ex){
			ex.printStackTrace();
		}
		finally{
			return buffer.toString();
		}
	}
	
	private String skipServerInfo(InputStream istr) {
		StringBuffer buffer=null;
		try{
			buffer=new StringBuffer();
			char ch;
			while((ch=(char)istr.read())!='\r'){
				buffer.append((char)ch);
			}
			//istr.close();
		}
		catch(Exception ex){
			ex.printStackTrace();
		}
		finally{
			return buffer.toString();
		}
	}


	private void writeData(OutputStream ostr, String data) {
		try {
			IOUtils.write(data.getBytes(), ostr);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}
}