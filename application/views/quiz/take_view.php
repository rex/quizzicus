<script>

$(document).ready(function() {
	$("#question1").fadeIn();

	$(".quiz_qlabel").click(function() {
		console.log("Clicked!");
		$(this).addClass(".quiz_qwrapper_active");
		alert(this);
	});
});

</script>


<pre>
	<?php //print_r($quiz); ?>
</pre>

<?php 
$i = 1;

foreach($quiz['questions'] as $k=>$v) {
	print "<div id=\"question$i\" class=\"quiz_question\">";

	print "<h1 class=\"qhead\">" . $v['questionInfo']['question_name'] . '</h1><div class="space20"></div>';
	print "<h3>" . $v['questionInfo']['question_content'] . '</h3><div class="space20"></div>';
	
	foreach($v['answers'] as $k=>$v) {
		print '<div class="quiz_qwrapper"><label class="quiz_qlabel"><input type="radio" name="group' . $i . '">' . $v['answer_content'] . '</label></div>';
	}
	$i++;
	print "</div>";
}

?>
<div class="space20"></div>
<a href="/quizzes/take/<?php print $quiz['quizInfo']['id'];?>" id="button_submit">Submit Answer</a>