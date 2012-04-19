<?php //print_r($userdata);?>
<div class="profile_header_info">
	<img src="<?=base_url('assets/img/' . $userdata['profile_image_url']);?>" align="left" class="img_profile" />

	<h1 class="qhead" style="font-size: 4em;"><?=$userdata['name_first'] . " " . $userdata['name_last']; ?></h1>
	<h2 class="open">
	<?php
	switch( $userdata['user_type'] ) {
		case 1:
			print "Newcomer";
			break;
		case 2:
			print "Member";
			break;
		case 3:
			print "Moderator";
			break;
		case 4:
			print "Elite Member";
			break;
		case 5:
			print "Administrator";
			break;
		default:
			print "Member";
	}
	?>
	</h2>

	<?=$userdata['address'];?><br />
	Member Since <?=date("l \\t\h\e jS \of F, Y", strtotime( $userdata['created_on']));?>
</div>

<div class="clear"></div>
<br /><br />
<hr />