package com.user.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.userdaoimpl;
import com.database.DBconnect;
import com.entity.user;


@WebServlet("/registration")
public class RegisterServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		try {
			String name=req.getParameter("name");
			String email=req.getParameter("email");
			String phone=req.getParameter("phone");
			String password=req.getParameter("password");
			String check=req.getParameter("check");
			
		//	System.out.println(name+" "+email+" "+phone+" "+password+" "+check);
			
			user us=new user();
			us.setName(name);
			us.setEmail(email);
			us.setPhone(phone);
			us.setPassword(password);
			
			
			HttpSession session=req.getSession();
			
			if (check != null) {
				userdaoimpl dao = new userdaoimpl(DBconnect.getconn());
			    	
			    boolean f2=dao.checkuser(email);
			    if (f2) {
					
			    	boolean f = dao.userRegister(us);

					if (f) {
						//System.out.println("User Registration successfully...");
				   session.setAttribute("succMSg", "Registartion successfully...");
					resp.sendRedirect("registration.jsp");
					} else {
						 session.setAttribute("failedmsg", "Something Wrong on server..");
							resp.sendRedirect("registration.jsp");
						//System.out.println("something Wrong on server.Retry!");
					}

				} else {
					 session.setAttribute("failedmsg", "User Already Exist! try Another Email...");
						resp.sendRedirect("registration.jsp");

				}
			
			
			}else {
				
				session.setAttribute("failedmsg", "please check Agree trems & condition");
				resp.sendRedirect("registration.jsp");
			
				//sSystem.out.println("please check Agree trems & condition");
				}
				
			
		} catch (Exception e) {
		e.printStackTrace();
		}
		
	}
	

}
