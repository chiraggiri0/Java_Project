package com.user.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.cartdaoimpl;
import com.dao.orderBookimpl;
import com.database.DBconnect;
import com.entity.book_order;
import com.entity.bookdetils;
import com.entity.cart;

@WebServlet("/order")
public class orderservlet extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
	try {
		HttpSession session=req.getSession();
		
		int id=Integer.parseInt(req.getParameter("id"));
		String orderid=req.getParameter("orderid");
		
		String name=req.getParameter("username");
		String email=req.getParameter("email");
		String phone=req.getParameter("phone");
		String address=req.getParameter("address");
		String landmark=req.getParameter("landmark");
		String city=req.getParameter("city");
		String pincode=req.getParameter("pincode");
		String payment=req.getParameter("payment");
		
		String fulladd=address+","+landmark+","+city+","+pincode;
//		System.out.println(name+" "+email+" "+phone+" "+fulladd+"  "+payment);

		cartdaoimpl dao=new cartdaoimpl(DBconnect.getconn());
	    List<cart> blist=dao.getbookbyuser(id);

	    if (blist.isEmpty()) {
			resp.sendRedirect("cart.jsp");
		}else {
		    orderBookimpl dao2=new orderBookimpl(DBconnect.getconn());
		    
		    book_order o=null;
		    ArrayList<book_order> orderList=new ArrayList<book_order>();
		    
		    Random r=new Random();
		    for (cart c:blist) {
		    	o =new book_order();
				o.setOrderid("Book-ORD-00"+r.nextInt(1000));
				o.setUsername(name);
				o.setEmail(email);
				o.setPhone(phone);
				o.setFulladd(fulladd);
				o.setBookname(c.getBookname());
				o.setAuthor(c.getAuthor());			
				o.setPrice(c.getPrice()+"");
				o.setPayment(payment);
		        orderList.add(o);
		   }
		    boolean f=dao2.savorder(orderList);
		    
		    if (f) {
		    	
		    	resp.sendRedirect("ordersucc.jsp");
			} else {
				resp.sendRedirect("cart.jsp");
			}
			
		}
	} catch (Exception e) {
	e.printStackTrace();
	}
	}

	
}
