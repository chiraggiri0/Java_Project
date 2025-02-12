package com.entity;

public class book_order {
private int id;
private String orderid;
private String username;
private String email;
private String phone;
private String fulladd;
private String bookname;
private String author;
private String price;
private String payment;

public book_order() {
super();
}

public int getId() {
	return id;
}

public void setId(int id) {
	this.id = id;
}

public String getOrderid() {
	return orderid;
}

public void setOrderid(String orderid) {
	this.orderid = orderid;
}

public String getUsername() {
	return username;
}

public void setUsername(String username) {
	this.username = username;
}

public String getEmail() {
	return email;
}

public void setEmail(String email) {
	this.email = email;
}

public String getPhone() {
	return phone;
}

public void setPhone(String phone) {
	this.phone = phone;
}

public String getFulladd() {
	return fulladd;
}

public void setFulladd(String fulladd) {
	this.fulladd = fulladd;
}

public String getBookname() {
	return bookname;
}

public void setBookname(String bookname) {
	this.bookname = bookname;
}

public String getAuthor() {
	return author;
}

public void setAuthor(String author) {
	this.author = author;
}

public String getPrice() {
	return price;
}

public void setPrice(String price) {
	this.price = price;
}

public String getPayment() {
	return payment;
}

public void setPayment(String payment) {
	this.payment = payment;
}

@Override
public String toString() {
	return "book_order [id=" + id + ", orderid=" + orderid + ", username=" + username + ", email=" + email + ", phone="
			+ phone + ", fulladd=" + fulladd + ", bookname=" + bookname + ", author=" + author + ", price=" + price
			+ ", payment=" + payment + "]";
}



}
