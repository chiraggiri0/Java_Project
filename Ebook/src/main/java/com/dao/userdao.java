package com.dao;

import com.entity.user;

public interface userdao {
	
	public boolean userRegister(user us);
	
	public user login(String email ,String password);
	
	public boolean checkpassword(int id,String passwrod);
	
	public boolean userupdateproflie(user us);
	
	public boolean checkuser(String email);
	
}
