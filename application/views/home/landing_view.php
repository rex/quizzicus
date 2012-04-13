
<h1 class="qhead">Landing Page - <?php print $this->session->userdata('full_name'); ?></h1>

	<div class="space20"></div>
	<table class="link_table">
		<tr>
			<td><a href="#">Account Information<img src="<?=base_url();?>/assets/img/icons/user.png" align="right" /></a></td>
			<td><a href="#">Payment Information<img src="<?=base_url();?>/assets/img/icons/creditcard.png" align="right" /></a></td>
		</tr>
		<tr>
			<td><a href="#">Reports<img src="<?=base_url();?>/assets/img/icons/notebook.png" align="right" /></a></td>
			<td><a href="#">Gradebook<img src="<?=base_url();?>/assets/img/icons/monitor.png" align="right" /></a></td>
		</tr>
		<tr>
			<td><a href="#">Support</a></td>
			<td><a href="#">View Quizzes<img src="<?=base_url();?>/assets/img/icons/write.png" align="right" /></a></td>
		</tr>
		
	</table>

<div class="space20"></div>
<h1 class="qhead">My Quizzes</h1>
<?php foreach($quizzes['user_quizzes'] as $k): ?>

	<div class="box_list_div">
		<a href="/quizzes/view/<?php print $k->id;?>/"><h3 class="qhead bold"><?php print $k->name; ?></h3></a>
		<?php print $k->description; ?>
		
	</div>	

<?php endforeach;?>

<div class="space20"></div>
<?php if(!empty($quizzes['user_assigned_quizzes'])): ?>
<h1 class="qhead">Quizzes Shared with Me</h1>
<?php foreach($quizzes['user_assigned_quizzes'][0] as $k): ?>

	<div class="box_list_div">
		<a href="/quizzes/view/<?php print $k->id;?>/"><h3 class="qhead bold"><?php print $k->name; ?></h3></a>
		<?php print $k->description; ?>
		
	</div>	

<?php endforeach;?>
<?php endif; ?>
</div>