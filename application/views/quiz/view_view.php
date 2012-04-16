
<h2 class="qhead"><?php print $quiz->name; ?></h2>
<br />
<h3 class="open"><?php print $quiz->description; ?></h3>
<div class="space20"></div>

<h3 class="qhead">Rules</h3>
<table class="view_quiz_table">
	
	<tr>
		<td><span class="museo">Timed: </span></td><td><?php print ($quiz->timed)? 'Timer Active' : 'Untimed'; ?></td>
		<td><span class="museo">Time Limit:</span></td>
		<td>
			<?php if($quiz->timed) {
				print date( "H \h\o\u\\r\s, i \m\i\\n\u\\t\e\s, s \s\e\c\o\\n\d\s", $quiz->timer );
			} else {
				print 'Untimed';
			} ?>
		</td>
	</tr>
	<tr>
		<td><span class="museo">Breaks Allowed: </span></td>
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
		<td><span class="museo">Privacy</span>:</td>
		<td><?php print ($quiz->public) ? 'Public' : 'Private'; ?></td>
	</tr>
		
</table>
<br />
	<h2 class="qhead">A Message from the Administrator of this Test</h2>
	<div>
		<h3 class="open">
<?php if(!empty($quiz->banner_message) || (strcmp($quiz->banner_message,'') != 0)): ?>
	
		<?php print $quiz->banner_message; ?>

		<br /><br />
<?php endif; ?>

<div class="msg_info round">

<?php

if($quiz->timed) {
	print ' Caution: Once this test is started, you will have ' . date( "H \h\o\u\\r\s, i \m\i\\n\u\\t\e\s, \a\\n\d s \s\e\c\o\\n\d\s", $quiz->timer ) . ' to complete the test. ';
}
if($quiz->allow_breaks) {
	$w = ($quiz->num_breaks_allowed == 1) ? ' it' : ' them';
	$n = ($quiz->num_breaks_allowed == 0) ? ' an infinite number of' : number_format( $quiz->num_breaks_allowed );
	print ' You will be allowed to take ' . $n . ' breaks during the completion of this test, if need be. Use ' . $w . ' wisely!';
} else {
	print 'There are *no* breaks allowed during this test. Please stay focused!';
}
?>
		</h3>
	</div>

<br />
<a href="<?=site_url("quizzes/take/{$quiz->id}");?>" id="button_submit">Take Quiz</a>
</div>