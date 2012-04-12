<pre>
	<?php print_r($quiz); ?>
</pre>


<h1 class="qhead"><?php print $quiz->name; ?></h1>
<h2><?php print $quiz->description; ?></h2>

<table class="view_quiz_table round innershadow raleway">
	
	<tr>
		<td>Timed: </td><td><?php print ($quiz->timed)? 'Timer Active' : 'Untimed'; ?></td>
		<td>Time Limit:</td>
		<td>
			<?php if($quiz->timed) {
				print $quiz->timer / 60 . ' minutes';
			} else {
				print 'Untimed';
			} ?>
		</td>
	</tr>
	<tr>
		<td>Breaks Allowed: </td>
		<td><?php 
			if($quiz->allow_breaks) {
				if($quiz->num_breaks_allowed == 0)
					print '&infin;';
				else {
					print $quiz->num_breaks_allowed;
				}
			} else {
				print 'None';
			}
		?></td>
		<td>Privacy:</td>
		<td><?php print ($quiz->public) ? 'Public' : 'Private'; ?></td>
	</tr>
		
</table>
<br />
	<h2 class="qhead">A Message from the Administrator of this Test</h2>
	<div class="gen_cloud_box round innershadow museo">
		<h3 class="raleway">
<?php if(!empty($quiz->banner_message) || (strcmp($quiz->banner_message,'') != 0)): ?>
	
		<?php print $quiz->banner_message; ?>
<?php endif; ?>
<?php

if($quiz->timed) {
	print 'Caution: Once this test is started, you will have ' . ( $quiz->timer / 60 ) . ' minutes to complete the test. ';
}
if($quiz->allow_breaks) {
	$w = ($quiz->num_breaks_allowed == 1) ? 'it' : 'them';
	$n = ($quiz->num_breaks_allowed == 0) ? 'an infinite number of' : $quiz->num_breaks_allowed;
	print 'You will be allowed to take ' . $n . ' breaks during the completion of this test, if need be. Use ' . $w . ' wisely!';
} else {
	print 'There are *no* breaks allowed during this test. Please stay focused!';
}
?>
		</h3>
	</div>



<a href="/quizzes/take/<?php print $quiz->id;?>" id="button_submit">Take Quiz</a>

<pre>
	<?php print_r($quiz); ?>
</pre>

