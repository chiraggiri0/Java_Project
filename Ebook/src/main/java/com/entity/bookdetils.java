package com.entity;

public class bookdetils {
	
private int bookid;
private String bookname;
private String author;
private String price;

private String bookcategory;
private String status;
private String photo;
private String user_email;

public bookdetils() {
super();
}

public bookdetils(String price, String bookname, String author, String bookcategory, String status, String photo,
		String user_email) {
	super();
	this.price=price;
	this.bookname = bookname;
	this.author = author;
	this.bookcategory = bookcategory;
	this.status = status;
	this.photo = photo;
	this.user_email = user_email;
}

public int getBookid() {
	return bookid;
}

public void setBookid(int bookid) {
	this.bookid = bookid;
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

public String getBookcategory() {
	return bookcategory;
}

public void setBookcategory(String bookcategory) {
	this.bookcategory = bookcategory;
}

public String getStatus() {
	return status;
}

public void setStatus(String status) {
	this.status = status;
}

public String getPhoto() {
	return photo;
}

public void setPhoto(String photo) {
	this.photo = photo;
}

public String getUser_email() {
	return user_email;
}

public void setUser_email(String user_email) {
	this.user_email = user_email;
}

@Override
public String toString() {
	return "bookdetils [bookid=" + bookid + ", bookname=" + bookname + ", author=" + author + ", price=" + price
			+ ", bookcategory=" + bookcategory + ", status=" + status + ", photo=" + photo + ", user_email="
			+ user_email + "]";
}




}
