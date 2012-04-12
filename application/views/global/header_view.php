<?php
/*
print '<pre>';
	print_r($session);
print '</pre>';
*/
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "https://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="https://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title><?php print $title;?></title>

<link rel='stylesheet' type='text/css' media='all' href='<?=base_url();?>/assets/css/style.css' />
<link rel="shortcut icon" href="<?=base_url();?>/assets/img/favicon.ico" />

<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>

</head>

<body>
	
    <div id="header" class="shadow">
    	<div id="header_content">
    		<div id="header_logo">
    			<a href="<?php print base_url();?>" id="logo_link">Quizzicus</a>
    		</div>
			
	        <div id="utility_area">
	            <a href="<?=base_url();?>/quizzes/" class="quiz">Quizzes</a>
	            <a href="<?=base_url();?>/grades/" class="grades">Grades</a>
	            <a href="<?=base_url();?>/account/payment/" class="payment">Payment</a>
	            <a href="<?=base_url();?>/account/" class="account">Account</a>
	        </div>
	        <a href="<?=base_url();?>/login/logout/">Log Out</a>
    	</div>
    </div>
        
        <div id="content">
        	
		<div class="space20"></div>
		
		<div class="box round shadow">
		
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