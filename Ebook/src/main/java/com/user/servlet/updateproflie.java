package com.user.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.userdaoimpl;
import com.database.DBconnect;
import com.entity.user;

@WebServlet("/updateproflie")
@MultipartConfig
public class updateproflie extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	try {
		int id=Integer.parseInt(req.getParameter("id").trim());
		String name=req.getParameter("name");
		String email=req.getParameter("email");
		String phone=req.getParameter("phone");
		String password=req.getParameter("password");
		
		user u=new user();
		u.setId(id);
		u.setName(name);
		u.setEmail(email);
		u.setPhone(phone);
        u.setPassword(password);
		
		userdaoimpl dao=new userdaoimpl(DBconnect.getconn());
		HttpSession session=req.getSession();
		boolean f=dao.checkpassword(id, password);
		
		if (f) {
			boolean f2=dao.userupdateproflie(u);
		
		if (f2) {
			   session.setAttribute("succMSg", "proflie Update successfully");
						resp.sendRedirect("index.jsp");
					
		} else {
			   session.setAttribute("failedMSg", "Something Wrong In Server");
				resp.sendRedirect("editproflie.jsp");
			
		}		
		} else {
			   session.setAttribute("failedMSg", "Your Password is Incorrect");
				resp.sendRedirect("editproflie.jsp");
				
		}
		
	} catch (Exception e) {
	e.printStackTrace();
	}
	
	}

}
