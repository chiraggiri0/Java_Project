package com.user.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.cartdaoimpl;
import com.database.DBconnect;

@WebServlet("/removebook")
public class removebookservlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		int bid=Integer.parseInt(req.getParameter("bid").trim());
		int uid=Integer.parseInt(req.getParameter("uid").trim());
		int cid=Integer.parseInt(req.getParameter("cid").trim());
		
		
		cartdaoimpl c=new cartdaoimpl(DBconnect.getconn());
		boolean f=c.deletebook(bid, uid,cid);
		HttpSession session=req.getSession();
		
	if (f) {
		session.setAttribute("failed","failed Removed From Cart");
		resp.sendRedirect("cart.jsp");
	
	} else {
		session.setAttribute("succMsg","Book Removed From Cart");
		resp.sendRedirect("cart.jsp");
	
	}
	}

	
}
