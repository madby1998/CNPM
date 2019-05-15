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
@WebServlet("/XuLyDangKy")
public class XuLyDangKy extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public XuLyDangKy() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		
		String username= request.getParameter("username");
		String pass= request.getParameter("pass");
		String name= request.getParameter("name");
		
		KhachHang kh = new KhachHang(username, pass, name);
		
		if(new KhachHangDAO().themTaiKhoan(kh)){
//			HttpSession session = request.getSession();
//			session.setAttribute("user", kh);
			response.sendRedirect("DangNhap.jsp");
		}else{
			System.out.println("Đăng ký thành công");
		}
		
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
