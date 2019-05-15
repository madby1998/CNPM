package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.KhachHangDAO;
import model.KhachHang;

@WebServlet("/XuLyDangNhap")
public class XuLyDangNhap extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public XuLyDangNhap() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username= request.getParameter("username");
		String pass = request.getParameter("pass");
		
		KhachHang kh = new KhachHangDAO().layThongTinTaiKhoan(username);
		System.out.println(kh);
		if(new KhachHangDAO().kiemTraDangNhap(username, pass)){
			HttpSession session = request.getSession();
			session.setAttribute("user", kh);
			
			response.sendRedirect("index.jsp");
		}else{
			System.out.println("Loi dang nhap");
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
