package com.user.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.bookdaoimpl;
import com.dao.cartdaoimpl;
import com.database.DBconnect;
import com.entity.bookdetils;
import com.entity.cart;

@WebServlet("/cart")
public class cartservlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		try {
       
		   int bid=Integer.parseInt(req.getParameter("bid").trim());	
		   int uid=Integer.parseInt(req.getParameter("uid").trim());	
			
		   bookdaoimpl dao=new bookdaoimpl(DBconnect.getconn());
		   bookdetils b=dao.getbookbyid(bid);
		   
		   cart c=new cart();
		   c.setBid(bid);
		   c.setUid(uid);
		   c.setBookname(b.getBookname());
		   c.setAuthor(b.getAuthor());
		   c.setTotalprice(Double.parseDouble(b.getPrice()));
		   c.setPrice(Double.parseDouble(b.getPrice()));
		   
		   cartdaoimpl dao1=new cartdaoimpl(DBconnect.getconn());
		   boolean f=dao1.addcart(c);
		   
		   HttpSession session=req.getSession();
		   
		   if (f) {
			   
			   session.setAttribute("addcart", "Book Added to Cart");
			   resp.sendRedirect("all_newbook.jsp");
			   
		} else {
			   session.setAttribute("failed", "Try Again..something Wrong!");
			   resp.sendRedirect("all_newbook.jsp");
		}
		   
		   
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	
}
