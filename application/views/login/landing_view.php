<script type="text/javascript">
	
	$(document).ready(function() {
		$("#button_submit").click(function() {
			$("#login_form_submit").click();
			return false;
		});
	});
	
	
</script>




<div style="width:50%;float:left;border-right:1px #999999 solid;">
	
<h1 class="qhead">Log In to Quizzicus</h1>
	<form id="login_form" action="<?=site_url();?>/login/go/" method="post">
		<label>Username <br />
		<input type="text" id="log_user" name="log_user" value="<?php print $this->session->userdata('username'); ?>"/>
		</label><br />

		<label>Password <br />
		<input type="password" id="log_pass" name="log_pass" />
		</label>
		
		<input type="submit" value="Submit" id="login_form_submit" style="visibility:hidden;"/>
		<a href="#" id="button_submit">Submit</a>
		<div class="space20"></div>
		<a href="#" class="dark">Forgot Password?</a>
	</form>
</div>

<div style="width:49%;height:235px;float:left;border-left:1px #eeeeee solid;">
	
	
	<fb:login-button
registration-url="https://developers.facebook.com/docs/plugins/registration" />
	
	
<!--	<iframe src="https://www.facebook.com/plugins/registration.php?
             client_id=113869198637480&
             redirect_uri=https%3A%2F%2Fdevelopers.facebook.com%2Ftools%2Fecho%2F&
             fields=name,birthday,gender,location,email"
        scrolling="auto"
        frameborder="no"
        style="border:none"
        allowTransparency="true"
        width="100%"
        height="330">
</iframe> 
-->
	
</div>

<div class="clear"></div>
</div>