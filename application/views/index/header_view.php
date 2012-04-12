<?php
/*
print '<pre>';
	print_r($session);
print '</pre>';
*/
?>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title><?php print $title;?></title>

<link rel='stylesheet' type='text/css' media='all' href='<?=base_url();?>assets/css/style.css' />
<link rel="shortcut icon" href="<?=base_url();?>assets/img/favicon.ico" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>

<style>

body {
	background:url('<?=base_url();?>assets/img/main_content_bg.png') repeat-x bottom;
}
h1, h2 {
	font-family: Ostrich;
}
#display_bar {
	width:100%;
	height:360px;
	background:url('<?=base_url();?>assets/img/cloud_bg.png') repeat-x bottom;
}
#display_bar_content {
	width:800px;
	margin:auto;
	padding-top:40px;
}
#display_bar_content #spiel {
	width:380px;
	float:left;
}
#display_bar_content #laptop {
	width:420px;
	height:250px;
	float:right;
	background:url('<?=base_url();?>assets/img/laptop.png') no-repeat top;
}
#content {
	background:url('<?=base_url();?>assets/img/main_content_bg.png') repeat-x top left;
	width:100%;
	min-height: 600px;
	padding-top:90px;
}
#question_counter {
	width:720px;
	margin:auto;
	background:url('<?=base_url();?>assets/img/question_counter_bg.png') no-repeat center top;
	height:180px;
	padding-top:35px;
}
#qcounter_object {
	width:638px;
	height:120px;
	margin:auto;
	position:relative;
	z-index:100;
	background:url('<?=base_url();?>assets/img/question_counter_backdrop.png') no-repeat top center;
}
#premier_create_acct {
	display:block;
	text-indent:-9999em;
	background:url('<?=base_url();?>assets/img/create_acct_button.png') no-repeat top;
	width:280px;
	height:67px;
}
#tour_button_small {
	display:block;
	text-indent:-9999em;
	background:url('<?=base_url();?>assets/img/tour_button_sprite.png') no-repeat top;
	width:67px;
	height:67px;
	margin:-70px auto auto 280px;
}
#premier_create_acct:hover,#tour_button_small:hover {
	background-position:0 -67px;
}
#premier_create_acct:active,#tour_button_small:active {
	background-position:0 -134px;
}
#lower_container {
	width:800px;
	margin:auto;
}


</style>
</head>

<body>
    <div id="header" class="shadow">
    	<div id="header_content">
    		<div id="header_logo">
    			<a href="<?php print base_url();?>" id="logo_link">Quizzicus</a>
    		</div>
			
	        <div id="utility_area">
	            <a href="#" class="quiz">Quizzes</a>
	            <a href="#" class="grades">Grades</a>
	            <a href="#" class="payment">Payment</a>
	            <a href="/account/" class="account">Account</a>
	        </div>
    	</div>
    </div>
    <?php //$this->load->view('global/nav_view');?>
    
    <div id="display_bar">
    	
    	<div id="display_bar_content">
    		
    		<div id="spiel">
    			<h2 class="qhead" style="line-height: 100%;">Start studying better<br /> with <span style="font-size:50px" class="qhead">Quizzicus</span></h2>
    			<h3>Say goodbye to difficult studying and get started learning in a much more fun, beautiful way.</h3>
    			
    			<a href="#" id="premier_create_acct"></a>
    			
    			<a href="#" id="tour_button_small" name="Take the Tour" title="Take the Tour">Take the Tour</a>
    		</div>
    		
    		<div id="laptop">
    			
    		</div>
    		
    		<div class="clear"></div>

			<div id="question_counter">
				<div id="qcounter_object">
					
				</div>
			</div>
    	</div>
    	
    </div>
    
    <div id="content">
    	
	
	<?php 
	
	if($alerts['alert'] == true) {
		
		foreach($alerts['items'] as $k) {
			switch($k['type']) {
				case 1:
					$div = 'error';
					break;
				case 2:
					$div = 'success';
					break;
				case 3:
					$div = 'info';
					break;
				default:
					$div = 'info';
			}
			print '<div class="msg_' . $div . ' round">' . $k['msg'] . '</div>';
		}
		
	}
	?>