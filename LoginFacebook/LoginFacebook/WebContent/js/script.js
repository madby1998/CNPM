$(function() {

	$("#loiHoTenDem").hide();
	$("#loiTen").hide();
	$("#loiDiaChi").hide();
	$("#loiSoDienThoai").hide();
	$("#loiSoTaiKhoan").hide();
	$("#loiEmail").hide();
	$("#loiPassword").hide();
	$("#loiNhapLaiPassword").hide();

	var loiHoTenDem = false;
	var loiTen = false;
	var loiDiaChi = false;
	var loiSoDienThoai = false;
	var loiSoTaiKhoan = false;
	var loiEmail = false;
	var loiPassword = false;
	var loiNhapLaiPassword = false;


	$("#hovatendem").focusout(function() {

		check_HoVaTen();
		
	});
	$("#ten").focusout(function() {

		check_Ten();
		
	});
	$("#diachi").focusout(function() {

		check_DiaChi();
		
	});
	$("#sodienthoai").focusout(function(){
		check_sodienthoai();
	});

	$("#sotaikhoan").focusout(function(){
		check_sotaikhoan();
	});


	$("#password").focusout(function() {

		check_password();
		
	});

	$("#passwordnhaplai").focusout(function() {

		check_retype_password();
		
	});

	$("#email").focusout(function() {

		check_email();
		
	});




	function check_sodienthoai() {
		var sodienthoai_noidung = $("#sodienthoai").val();
		if(sodienthoai_noidung==""){
			$("#loiSoDienThoai").html("Cảnh báo: Số điện thoại không được rỗng")
			$("#loiSoDienThoai").show();
			loiSoDienThoai = true;
		}
		else {
			$("#loiSoDienThoai").hide();
		}
	}


	
	function check_sotaikhoan() {
		var sotaikhoan_noidung = $("#sotaikhoan").val();
		if(sotaikhoan_noidung==""){
			$("#loiSoTaiKhoan").html("Cảnh báo: Số tài khoản không được rỗng")
			$("#loiSoTaiKhoan").show();
			loiSoTaiKhoan = true;
		}
		else {
			$("#loiSoTaiKhoan").hide();
		}
	}


	function check_HoVaTen() {

		var username_length = $("#hovatendem").val().length;
		
		
		if(username_length < 2 || username_length > 20) {
			$("#loiHoTenDem").html("Cảnh báo: Độ dài của Họ phải từ 2 đến 20 ký tự");
			$("#loiHoTenDem").show();
			loiHoTenDem = true;
		} 
		var ho = $("#hovatendem").val();
		if(ho==""){
			$("#loiHoTenDem").html("Cảnh báo: Tên không được rỗng");
			$("#loiHoTenDem").show();
			loiHoTenDem = true;
		}

		else {
			$("#loiHoTenDem").hide();
		}

	}


	function check_Ten(){
		var ten_length = $("#ten").val().length;
		var ten = $("#ten").val();
		
		
		if(ten_length>20) {
			$("#loiTen").html("<b>Cảnh báo</b> Tên có độ dài bé hơn 20 ký tự");
			$("#loiTen").show();
			error_ten = true;
		}
		if(ten =="") {
			$("#loiTen").html("<b>Cảnh báo</b> Tên người dùng không được rỗng");
			$("#loiTen").show();
			error_ten = true;
		}
		else {
			$("#loiTen").hide();
		}

	}

	function check_password() {

		var password_length = $("#password").val().length;
		var password = $("#password").val();
		
		if(password_length < 8) {
			$("#loiPassword").html("Cảnh báo: Mật khẩu phải dài hơn 8 ký tự");
			$("#loiPassword").show();
			loiPassword = true;
		} 
		if(password == ""){
			$("#loiPassword").html("Cảnh báo: Không được rỗng")
			$("loiPassword").show();
		}
		else {
			$("#loiPassword").hide();
		}

	}

	function check_retype_password() {

		var password = $("#password").val();
		var retype_password = $("#passwordnhaplai").val();
		
		if(password !=  retype_password) {
			$("#loiNhapLaiPassword").html("Cảnh báo : Mật khẩu nhập lại không khớp");
			$("#loiNhapLaiPassword").show();
			loiNhapLaiPassword = true;
		} else {
			$("#loiNhapLaiPassword").hide();
		}

	}

	function check_email() {

		var pattern = new RegExp(/^[+a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/i);

		if(pattern.test($("#email").val())) {
			$("#loiEmail").hide();
		} else {
			$("#loiEmail").html("Email không hợp lệ");
			$("#loiEmail").show();
			loiEmail = true;
		}

	}
	function check_DiaChi(){
		var diachi_noidung = $("#diachi").val();
		if(diachi_noidung == ""){
			$("#loiDiaChi").html("Cảnh báo: Địa chỉ không được rỗng")
			$("#loiDiaChi").show();
			loiDiaChi = true;
		}
		else{
			$("#loiDiaChi").hide();
		}
	}

//	$("#dangKy").submit(function() {
//
//		loiHoTenDem = false;
//		loiTen = false;
//		loiDiaChi = false;
//		loiSoDienThoai= false;
//		
//		loiSoTaiKhoan = false;
//		loiEmail = false;
//		loiPassword=false;
//		loiNhapLaiPassword=false;
//		
//
//
//		check_HoVaTen();
//		check_Ten();
//		check_DiaChi();
//		check_sodienthoai();
//		check_sotaikhoan();
//		check_password();
//		check_retype_password();
//		check_email();
//		
//		if(loiHoTenDem == false && loiTen == false && loiDiaChi == false && loiSoDienThoai == false && 
//				loiSoTaiKhoan == false && loiEmail == false && loiPassword == false && loiNhapLaiPassword == false ) {
//			return true;
//		} else {
//			return false;	
//		}
//
//	});

});


