<?php 

require_once('config.php');

class Functions {

	function __construct() {
		
		$this->db = new DB();
	
	}
	
	function _fetchQuizzes() {
		return $this->db->query("SELECT * FROM `quizzes`");
	}
	
	function _fetchQuizQuestions($quiz) {
		return $this->db->query("SELECT * FROM `questions` WHERE `quiz_id` = $quiz GROUP BY `question number` ORDER BY `question_number` DESC");
	}

}

?>