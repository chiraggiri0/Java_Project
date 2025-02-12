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

@WebServlet("/login")
public class loginServlet  extends HttpServlet
{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		try {
			
			userdaoimpl dao=new userdaoimpl(DBconnect.getconn());
			HttpSession session=req.getSession();
			String email=req.getParameter("email");
			String password=req.getParameter("password");
			
			if ("admin@gmail.com".equals(email) && "Admin".equals(password)) {
				user us = new user();
				us.setName("Admin");
				session.setAttribute("userobj", us);
				resp.sendRedirect("admin/home.jsp");

			} else {

				user us =dao.login(email, password);

				if (us != null) {

					session.setAttribute("userobj", us);
					resp.sendRedirect("index.jsp");
				} else {
					session.setAttribute("failedMSg", "Email & Password Invaild");
					resp.sendRedirect("login.jsp");
				}

				resp.sendRedirect("home.jsp");

			}

		} catch (Exception e) {

		}
	}
}
