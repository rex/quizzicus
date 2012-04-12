
<h1 class="qhead raleway">Landing Page - <?php print $this->session->userdata('full_name'); ?></h1>

	<div class="space20"></div>
	<table class="link_table round thinborder innershadow raleway">
		<tr>
			<td><a href="#">Account Information</a></td>
			<td><a href="#">Payment Information</a></td>
		</tr>
		<tr>
			<td><a href="#">Reports</a></td>
			<td><a href="#">Gradebook</a></td>
		</tr>
		<tr>
			<td><a href="#">Support</a></td>
			<td><a href="#">View Quizzes</a></td>
		</tr>
		
	</table>

<div class="space20"></div>
<h1 class="qhead raleway">My Quizzes</h1>
<?php foreach($quizzes['user_quizzes'] as $k): ?>

	<div class="box_list_div innershadow round">
		<a href="/quizzes/view/<?php print $k->id;?>/"><h2 class="qhead bold"><?php print $k->name; ?></h2></a>
		<h3 class="raleway bold"><?php print $k->description; ?></h3>
		
	</div>	

<?php endforeach;?>

<?php if(!empty($quizzes['user_assigned_quizzes'])): ?>
<h1 class="qhead raleway">Quizzes Shared with Me</h1>
<?php foreach($quizzes['user_assigned_quizzes'][0] as $k): ?>

	<div class="box_list_div innershadow round">
		<a href="/quizzes/view/<?php print $k->id;?>/"><h2 class="qhead bold"><?php print $k->name; ?></h2></a>
		<h3 class="raleway bold"><?php print $k->description; ?></h3>
		
	</div>	

<?php endforeach;?>
<?php endif; ?>
</div>