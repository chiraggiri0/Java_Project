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

@WebServlet("/delete")
public class bookdeleteservlet  extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			int id = Integer.parseInt(req.getParameter("id"));
			bookdaoimpl d = new bookdaoimpl(DBconnect.getconn());
			boolean f = d.deletebook(id);
			HttpSession session = req.getSession();
			if (f) {
				session.setAttribute("succMsg", "Book delete successfully...");
				resp.sendRedirect("admin/allbook.jsp");
			} else {
				session.setAttribute("failedMsg", "Book not deleted successfully...");
				resp.sendRedirect("admin/allbook.jsp");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	

}
