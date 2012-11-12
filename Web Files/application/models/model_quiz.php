<?php 

class Model_quiz extends CI_Model {

	function __construct() {
		parent::__construct();
	}
	
	function fetchQuizzesForUser($uid = all) {
		try {
			if(strcmp($uid,'all') == 0) {
				// No UID specified, return ALL quizzes active.
				$q = $this->db->get_where('quizzes',array('active'=>1));
				$data = $q->result();
			} else {
				if(!$q = $this->db->get_where('quizzes',array('user_id'=>$uid))) {
					throw new exception('Unable to fetch quizzes created by user.');
				}
				$data['user_quizzes'] = $q->result();
				
				if(!$q = $this->db->get_where('quiz_permissions',array('uid'=>$uid,'active'=>1))) {
					throw new exception('Unable to fetch quizzes assigned to user.');
				}
				foreach($q->result() as $k) {
					if(!$a = $this->db->get_where('quizzes',array('id'=>$k->qid))) {
						throw new exception("Unable to fetch quizzes assigned to user.");
					}
					$data['user_assigned_quizzes'][] = $a->result();
				}
			}
			return array('success'=>true,'data'=>$data);
		} catch(exception $e) {
			return array('success'=>false,'msg'=>$e->getMessage());
		}
	}
	
	public function getQuizInfo($qid) {
		try {
			if(empty($qid) || strcmp($qid,'') == 0) {
				throw new exception("Invalid Quiz ID Specified");	
			}
			if(!$q = $this->db->get_where('quizzes',array('id'=>$qid,'active'=>1))) {
				throw new exception("Unable to fetch information for that quiz. Please try again.");
			}
			if($q->num_rows() == 0) {
				throw new exception("No quizzes were found matching the ID provided. Please try again.");
			}
			if($q->num_rows() > 1) {
				throw new exception("There seems to be a database mishap that has identified two quizzes with the same ID. An administrator has been notified of this error. We're sorry!");
			}
			return array('success'=>true,'info'=>$q->row());
		} catch( exception $e) {
			return array('success'=>false,'msg'=>$e->getMessage());
		}
	}
	
	public function assembleQuiz($qid) {
		try {
			$assembledQuiz = array();
			
			if(empty($qid) || strcmp($qid,'') == 0) {
				throw new exception("Invalid Quiz ID Specified");	
			}
			

			//$q = "SELECT * FROM `quiz_questions` WHERE `quiz_id` = $qid LEFT JOIN `quiz_answers` ON `quiz_answers`.`question_id` = `uiz_questions`.`id`";

			$q = $this->db->query("
				SELECT * FROM `quiz_answers`
				LEFT JOIN `quiz_questions` 
					ON `quiz_questions`.`id` = `quiz_answers`.`question_id`
				LEFT JOIN `quizzes`
					ON `quizzes`.`id` = `quiz_questions`.`quiz_id`
				WHERE `quizzes`.`id` = $qid
				ORDER BY `quiz_questions`.`id` ASC
			");
			
			$answers = $q->result();

			foreach( $answers as $k ) {
				print $k->quiz_id . "\n";
				print $k->question_id . "\n";
				print_r(unserialize( $k->answer_content));
			}

			die();
			
			$i = 1;
			$comp = $answers[0]->question_id;
			$assembledQuiz['info'] = array('name'=>$answers[0]->name,'description'=>$answers[0]->description,'randomize'=>$answers[0]->randomize);
			foreach($answers as $k) {
				if($k->question_id != $comp) {
					$i++;
					$comp = $k->question_id;
				}
				$assembledQuiz['questions'][$i]['question'] = array('type'=>$k->question_type,'name'=>$k->question_name,'content'=>$k->question_content,'randomize'=>$k->randomize);
				$assembledQuiz['questions'][$i]['answers'][] = array('content'=>$k->answer_content,'is_correct'=>$k->is_correct);
			}
			return $assembledQuiz;
			
		} catch(exception $e) {
			//return array('success'=>false,'msg'=>$e->getMessage());
			print $e->getMessage();
		}
	}
}

?>