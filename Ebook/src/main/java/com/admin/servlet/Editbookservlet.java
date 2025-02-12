package com.admin.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.bookdaoimpl;
import com.database.DBconnect;
import com.entity.bookdetils;

@WebServlet("/editbooks")
public class Editbookservlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			int id = Integer.parseInt(req.getParameter("id"));
			String price = req.getParameter("price");
			String author = req.getParameter("author");
			String bookname = req.getParameter("bname");
			String status = req.getParameter("bstatus");
	
			bookdetils b = new bookdetils();
			b.setBookid(id);
			b.setPrice(price);
			b.setAuthor(author);
			b.setBookname(bookname);
			b.setStatus(status);
			
			bookdaoimpl bd=new bookdaoimpl(DBconnect.getconn());
				boolean f=bd.updateeditbook(b);
			HttpSession session=req.getSession();
			if (f) {
                       session.setAttribute("succMsg","Book update successfully...");
                       resp.sendRedirect("admin/allbook.jsp");
			} else {
				session.setAttribute("failedMsg","Book not update successfully...");
                resp.sendRedirect("admin/allbook.jsp");
			}
				
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
