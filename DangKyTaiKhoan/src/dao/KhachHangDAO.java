package dao;

import java.sql.ResultSet;

import model.KhachHang;
import model.MyConnectDB;

public class KhachHangDAO implements ObjectDAO{

	@Override
	public boolean themTaiKhoan(Object obj) {
		KhachHang kh = (KhachHang) obj;
		try {
			new MyConnectDB().thucThiSQL("insert into DangNhap values('"+kh.getUserName()+"','"+kh.getPass()+"','"+kh.getName()+"')");
			return true;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}

	public KhachHang layThongTinTaiKhoan(String username){
		try {
			ResultSet  rs=new MyConnectDB().chonDuLieu("select * from DangNhap where UserName='"+username+"'");
			 while(rs.next()){
				String user = rs.getString(1);
				String pass = rs.getString(2);
				String name = rs.getString(3);
				return new KhachHang(user,pass,name);
			 }
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e.getMessage());
		}
		return null;
		
	}
	
	@Override
	public boolean kiemTraDangNhap(String username,String pass) {
		
		try {
			ResultSet  rs=new MyConnectDB().chonDuLieu("select * from DangNhap where UserName='"+username+"'");
			 while(rs.next()){
				 if(rs.getString(1).equals(username) && rs.getString(2).equals(pass)){
					 return true;
				 }
			 }
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e.getMessage());
		}
		
		
		return false;
	}
	public static void main(String[] args) {
		KhachHang kh = new KhachHang("lephong", "abcd", "Phong");
//		System.out.println(new KhachHangDAO().themTaiKhoan(kh));
		System.out.println(new KhachHangDAO().kiemTraDangNhap("lephong", "abcd"));
	}
}
