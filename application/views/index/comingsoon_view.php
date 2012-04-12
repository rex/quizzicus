<!DOCTYPE html>
<html>

	<head>
		<title><?=$title;?></title>

		<link rel="stylesheet" type="text/css" href="<?=base_url();?>assets/css/style.css" />
<style type="text/css">
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
				<span class="open" style="font-size: 18px;">
					Currently, we are in a closed beta. We'll let you know when we open up registration.
				</span>
			</div>
		</div>
	</body>

</html>