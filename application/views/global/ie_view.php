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
a {
	font-size: 40px;
	color: #333;
}
img {
	height: 48px;
	width: 48px;
	border: 1px #eee solid;
	padding: 10px;
}
a img:hover {
	border: 1px #333 solid;
}
body {
	height: 100%;
	background: #133461;
}
h1, h2 {
	color: #222;
}
.container {
	width: 600px;
	margin: 50px auto;
}
.signup {
	padding: 10px;
	background: #999;
}
</style>
	</head>

	<body>
		<div class="container">
			<a href="<?=site_url();?>" id="logo_link">Quizzicus</a>

			<div class="signup">
				<!--
				<h2 class="qhead museo">Sign Up for a Beta Invite</h2>
				<br />
				<input type="text" name="email" id="email" value="Enter Email" />
				--> 
				<h1>Closed Beta</h1>
				
				Currently, we are in a closed beta. We'll let you know when we open up registration... But...

				<br />
				<h2>Your browser is</h2>
				<h1>NOT SUPPORTED</h1>

				In order to make the experience of Quizzicus users faster, more cohesive and generally more awesome, Internet Explorer will not be a supported browser.
				Microsoft's never-ending fight to hold back the open web has caused the loss of countless millions of man-hours in development time that could have been spent developing awesome features for users.
				I will not do that to users of Quizzicus, and you're welcome. You don't even have to thank me.

				<h1>What you can do</h1>
				<h3><a href="http://www.google.com/chromeframe">Install Google Chrome Frame</a></h3>

				<h2>OR</h2>
				<h3>Install one of the browsers listed below to get started!</h3>
				<div style="margin:auto;width: 300px;">
					<a href="http://www.google.com/chrome"><img src="<?=base_url();?>assets/img/icons/browsers/Chrome.png" alt="Google Chrome" title="Google Chrome" /></a>
					<a href="http://www.opera.com/"><img src="<?=base_url();?>assets/img/icons/browsers/Opera.png" alt="Opera" title="Opera" /></a>
					<a href="http://www.apple.com/safari/"><img src="<?=base_url();?>assets/img/icons/browsers/Safari.png" alt="Safari" title="Safari" /></a>
					<a href="http://www.mozilla.org/en-US/firefox/new/"><img src="<?=base_url();?>assets/img/icons/browsers/Firefox.png" alt="Firefox" title="Firefox" /></a>
				</div>

			</div>

		</div>
	</body>

</html>