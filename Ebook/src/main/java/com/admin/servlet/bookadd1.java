package com.admin.servlet;

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

@WebServlet("/bookadd1")
@MultipartConfig
public class bookadd1 extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		try {
			String  price=req.getParameter("price");
			String  author=req.getParameter("author");
			String  bookname=req.getParameter("bname");
			String  categories=req.getParameter("categories");
			String  status=req.getParameter("bstatus");
			Part part=req.getPart("bimg");
			String  filename=part.getSubmittedFileName();
		
			bookdetils bd=new bookdetils(price,author,bookname,categories,status,filename,"admin");
			bookdaoimpl d=new bookdaoimpl(DBconnect.getconn());
			
			boolean f=d.addbook(bd);
			HttpSession session=req.getSession();
			
			if (f) {
			
				String path=getServletContext().getRealPath("")+"book";
				File f1=new File(path);
				part.write(path+f1.separator+filename);
				
				session.setAttribute("succMsg", "Book Add Successfully...");
	            resp.sendRedirect("admin/addbook.jsp");		
			} else {
				session.setAttribute("faildMsg", "Somthing Wrong in Upload..");
	            resp.sendRedirect("admin/addbook.jsp");
			}
			
		} catch (Exception e) {
		System.out.println(e.getMessage());
		}
		
	}

	
	
}