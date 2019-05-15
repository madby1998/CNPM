<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Đăng ký</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>

<div class="container">
  <h2>Nhập thông tin để đăng kí </h2>
  <form class="form-horizontal" action="XuLyDangKy" method="post">
    <div class="form-group">
      <label class="control-label col-sm-2" for="email">Tài khoản:</label>
      <div class="col-sm-10">
        <input type="text" class="form-control" id="email" name="username" placeholder="ví dụ: abcd0107">
      </div>
    </div>
    <div class="form-group">
      <label class="control-label col-sm-2" for="pwd">Mật khẩu:</label>
      <div class="col-sm-10">          
        <input type="password" class="form-control" id="pwd" name="pass" placeholder="Nhập mật khẩu ...">
      </div>
    </div>
    <div class="form-group">
      <label class="control-label col-sm-2" for="pwd">Tên của bạn:</label>
      <div class="col-sm-10">          
        <input type="text" class="form-control" id="pwd" name="name" placeholder="Nhập tên của bạn ...">
      </div>
    </div>
    <div class="form-group">        
      <div class="col-sm-offset-2 col-sm-10">
        <button type="submit" class="btn btn-success">Đăng ký</button>
      </div>
    </div>
  </form>
</div>

</body>
</html>
