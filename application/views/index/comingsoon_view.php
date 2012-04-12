<!DOCTYPE html>
<html>

	<head>
		<title><?=$title;?></title>

		<link rel="stylesheet" type="text/css" href="<?=base_url();?>assets/css/style.css" />
		<link rel="shortcut icon" href="<?=base_url();?>assets/img/favicon.ico" />
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<style type="text/css">
* {
	font-family: Open;
	font-size: 18px;
	text-align:center;
}
img {
	height: 48px;
	width: 48px;
}
body {
	height: 100%;
}
.container {
	width: 400px;
	margin: 150px auto;
}
.signup {
	padding: 25px;
	box-shadow: 0 5px 35px #222, inset 0 1px 1px #eee;
	border-radius: 5px;
	background: -webkit-gradient(linear ,left bottom, left top, color-stop(0, #666), color-stop(1, #999));
}
</style>
	</head>

	<body>
		<div class="container">
			<a href="<?php print site_url();?>" id="logo_link">Quizzicus</a>

			<div class="signup">
				<!--
				<h2 class="qhead museo">Sign Up for a Beta Invite</h2>
				<br />
				<input type="text" name="email" id="email" value="Enter Email" />
				--> 
				<h1 class="qhead museo">Closed Beta</h1>
				
				Currently, we are in a closed beta. We'll let you know when we open up registration.

				<br /><br />
				<h2 class="qhead museo">Browser Support</h2>

				When launched, Quizzicus&copy; will only support the following browsers:
				<br /><br />
				<div style="margin:auto;width: 225px;">
					<img src="<?=base_url();?>assets/img/icons/browsers/Chrome.png" alt="Google Chrome" title="Google Chrome" />
					<img src="<?=base_url();?>assets/img/icons/browsers/Opera.png" alt="Opera" title="Opera" />
					<img src="<?=base_url();?>assets/img/icons/browsers/Safari.png" alt="Safari" title="Safari" />
					<img src="<?=base_url();?>assets/img/icons/browsers/Firefox.png" alt="Firefox" title="Firefox" />
				</div>

			</div>

		</div>
	</body>

</html>