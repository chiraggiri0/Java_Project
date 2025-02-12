package com.user.servlet;
import java.io.File;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.dao.bookdaoimpl;
import com.database.DBconnect;
import com.entity.bookdetils;

@WebServlet("/add_oldbook")
@MultipartConfig
public class addoldbookservlet extends HttpServlet {
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		try {
			String  bookname=req.getParameter("bname");
			String  author=req.getParameter("author");
			String  price=req.getParameter("price");
			String  categories="Old";
			String  status="Active";
			Part part=req.getPart("bimg");
			String  filename=part.getSubmittedFileName();
			
			String useremail=req.getParameter("user");
		
			bookdetils bd=new bookdetils(price,author,bookname,categories,status,filename,useremail);
			bookdaoimpl d=new bookdaoimpl(DBconnect.getconn());
			
			boolean f=d.addbook(bd);
			HttpSession session=req.getSession();
			
			if (f) {
			
				String path=getServletContext().getRealPath("")+"book";
				File file=new File(path);
				part.write(path+File.separator +filename);
				
				session.setAttribute("succMsg", "Book Add Successfully...");
	            resp.sendRedirect("sellbook.jsp");		
			} else {
				session.setAttribute("faildMsg", "Somthing Wrong in Upload..");
	            resp.sendRedirect("sellbook.jsp");
			}
			
		} catch (Exception e) {
		System.out.println(e.getMessage());
		}
		
	}


}
