package com.app.server.form;

import java.io.File;

import org.apache.struts.action.ActionForm;

public class LoginForm extends ActionForm{
	private String username;
	private String password;
	private String file;
	public String getFile() {
		return file;
	}
	public void setFile(String file) {
		this.file = file;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
}
