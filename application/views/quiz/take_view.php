<script>

$(document).ready(function() {
	$("#question1").fadeIn();

	$("input[type=radio]").click(function() {
		$('.quiz_qwrapper_active').removeClass('quiz_qwrapper_active');
		$(this.parentNode.parentNode).addClass('quiz_qwrapper_active');
	});
});

</script>


<pre>
	<?php print_r($quiz); ?>
</pre>

<?php 
$i = 1;

foreach($quiz['questions'] as $k=>$v) {
	print "<div id=\"question$i\" class=\"quiz_question\">";

	print "<h1 class=\"qhead\">" . $v['question']['name'] . '</h1><div class="space20"></div>';
	print "<h3>" . $v['question']['content'] . '</h3><div class="space20"></div>';
	
	foreach($v['answers'] as $k=>$v) {
		print '<div class="quiz_qwrapper"><label class="quiz_qlabel"><input type="radio" name="group' . $i . '" class="button_radio" />' . $v['content'] . '</label></div>';
	}
	$i++;
	print "</div>";
}

?>
<input type="hidden" id="curQuestion" value="1" />
<div class="space20"></div>
<a href="#" id="button_submit">Submit Answer</a>