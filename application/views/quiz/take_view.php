


<pre>
	<?php //print_r($quiz); ?>
</pre>

<h1 class="qhead"><?php print $quiz['quizInfo']['name']; ?></h1>
<h2><?php print $quiz['quizInfo']['description']; ?></h2>



<a href="/quizzes/take/<?php print $quiz['quizInfo']['id'];?>" id="button_submit">Take Quiz</a>

<?php 
$i = 1;
foreach($quiz['questions'] as $k=>$v) {
	print "Question $i:" . $v['questionInfo']['question_name'] . '<br />';
	print $v['questionInfo']['question_content'] . '<br />';
	
	foreach($v['answers'] as $k=>$v) {
		print '<input type="radio" name="group' . $i . '">' . $v['answer_content'] . '<br />';
	}
	$i++;
}

?>
