<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<script type="text/javascript">
	jQuery(document).ready(function($) {
		$(".scroll").click(function(event) {
			event.preventDefault();
			$('html,body').animate({
				scrollTop : $(this.hash).offset().top
			}, 1000);
		});
	});
</script>
<!-- start-smoth-scrolling -->
<!-- facebook login script-->
<script>
	function statusChangeCallback(response) { // Thực hiện và lấy về response từ FB.getLoginStatus().
		console.log('statusChangeCallback');
		console.log(response);
		if (response.status === 'connected') { // nếu login thành công
			window.location.href = 'Sign_in_Controller.jsp?access_token='
					+ response.authResponse.accessToken;
		} else { // đăng nhâp không thành công hoặc k gọi được sign_in_controller
			document.getElementById('status').innerHTML = 'Please log '
					+ 'into this app.';
		}
	}
	function checkLoginState() {
		FB.getLoginStatus(function(response) {
			statusChangeCallback(response);
		});
	}

	window.fbAsyncInit = function() {
		FB.init({
			appId : '427174628074067',
			cookie : true, // cookie cho phép máy chủ truy cập
			// the session
			xfbml : true, // phân tích các plugins 
			version : 'v2.12' // phiên bản API để gọi
		});

		FB.getLoginStatus(function(response) {
			statusChangeCallback(response);
		});

	};
	// tải SDK
	(function(d, s, id) {  
		var js, fjs = d.getElementsByTagName(s)[0];
		if (d.getElementById(id))
			return;
		js = d.createElement(s);
		js.id = id;
		js.src = "https://connect.facebook.net/en_US/sdk.js";
		fjs.parentNode.insertBefore(js, fjs);
	}(document, 'script', 'facebook-jssdk'));

	// test API sau khi login thành công 
	//  statusChangeCallback() khi đã gọi
	function testAPI() {
		console.log('Welcome!  Fetching your information.... ');
		FB
				.api(
						'/me',
						function(response) {
							console.log('Successful login for: '
									+ response.name);
							document.getElementById('status').innerHTML = 'Thanks for logging in, '
									+ response.name + '!';
						});
	}
</script>
<title>Login/Sign-In</title>

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">

<link rel='stylesheet'
	href='https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css'>

<link rel="stylesheet" href="css/style.css">

</head>
<body>
	<div class="logmod">
		<div class="logmod__wrapper">
			<span class="logmod__close">Close</span>
			<div class="logmod__container">
				<ul class="logmod__tabs">
					<li data-tabtar="lgm-2"><a href="#">Login</a></li>
					<li data-tabtar="lgm-1"><a href="#">Sign Up</a></li>
				</ul>
				<div class="logmod__tab-wrapper">
					<div class="logmod__tab lgm-1">
						<div class="logmod__heading">
							<span class="logmod__heading-subtitle">Enter your personal
								details <strong>to create an acount</strong>
							</span>
						</div>
						<div class="logmod__form">
							<form accept-charset="utf-8" action="#" class="simform">
								<div class="sminputs">
									<div class="input full">
										<label class="string optional" for="user-name">Email*</label>
										<input class="string optional" maxlength="255" id="user-email"
											placeholder="Email" type="email" size="50" />
									</div>
								</div>
								<div class="sminputs">
									<div class="input string optional">
										<label class="string optional" for="user-pw">Password
											*</label> <input class="string optional" maxlength="255" id="user-pw"
											placeholder="Password" type="text" size="50" />
									</div>
									<div class="input string optional">
										<label class="string optional" for="user-pw-repeat">Repeat
											password *</label> <input class="string optional" maxlength="255"
											id="user-pw-repeat" placeholder="Repeat password" type="text"
											size="50" />
									</div>
								</div>
								<div class="simform__actions">
									<input class="sumbit" name="commit" type="sumbit"
										value="Create Account" /> <span
										class="simform__actions-sidetext">By creating an
										account you agree to our <a class="special" href="#"
										target="_blank" role="link">Terms & Privacy</a>
									</span>
								</div>
							</form>
						</div>
						<div class="logmod__alter">
							<div class="logmod__alter-container">
								<a href="#" class="connect facebook">
									<div class="connect__icon">
										<i class="fa fa-facebook"></i>
									</div>
									<div class="connect__context">
										<span>Create an account with <strong>Facebook</strong></span>
									</div>
								</a> <a href="#" class="connect googleplus">
									<div class="connect__icon">
										<i class="fa fa-google-plus"></i>
									</div>
									<div class="connect__context">
										<span>Create an account with <strong>Google+</strong></span>
									</div>
								</a>
							</div>
						</div>
					</div>
					<div class="logmod__tab lgm-2">
						<div class="logmod__heading">
							<span class="logmod__heading-subtitle">Enter your email
								and password <strong>to sign in</strong>
							</span>
						</div>
						<div class="logmod__form">
							<form accept-charset="utf-8" action="#" class="simform">
								<div class="sminputs">
									<div class="input full">
										<label class="string optional" for="user-name">Email*</label>
										<input class="string optional" maxlength="255" id="user-email"
											placeholder="Email" type="email" size="50" />
									</div>
								</div>
								<div class="sminputs">
									<div class="input full">
										<label class="string optional" for="user-pw">Password
											*</label> <input class="string optional" maxlength="255" id="user-pw"
											placeholder="Password" type="password" size="50" /> <span
											class="hide-password">Show</span>
									</div>
								</div>
								<div class="simform__actions">
									<input class="sumbit" name="commit" type="sumbit"
										value="Log In" /> <span class="simform__actions-sidetext"><a
										class="special" role="link" href="#">Forgot your password?<br>Click
											here
									</a></span>
								</div>
							</form>
						</div>
						<div class="logmod__alter">
							<div class="logmod__alter-container">
								<a href="#" class="connect facebook">
									<div class="connect__icon">
										<fb:login-button scope="public_profile,email"
											onlogin="checkLoginState();">
                Sign in with Facebook
					</fb:login-button>
									</div>
									<div class="connect__context"></div>
								</a> <a
									href="https://accounts.google.com/o/oauth2/auth?scope=email&redirect_uri=http://localhost:8080/AccessGoogle/login-google&response_type=code
		&client_id=922553214022-d77uqk5ot1b5qup5h4ph4kkjk0pa3rf5.apps.googleusercontent.com&approval_prompt=force"
									class="connect googleplus">
									<div class="connect__icon">
										<i class="fa fa-google-plus"></i>
									</div>

									<div class="connect__context">
										<span>Sign in with <strong>Google+</strong></span>
									</div>
								</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script
		src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>



	<script src="js/index.js"></script>




</body>
</html>