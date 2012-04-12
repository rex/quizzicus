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
			
			if(!$a = $this->db->get_where('quizzes',array('id'=>$qid,'active'=>1))) {
				throw new exception("Unable to fetch quiz for user during assembly.");
			}
			$result = $a->result_array();
			$assembledQuiz['quizInfo'] = $result[0];
			if(!$b = $this->db->get_where('quiz_questions',array('quiz_id'=>$qid,'active'=>1))) {
				throw new exception("Unable to fetch questions for the quiz requested during assembly.");
			}
			$questions = $b->result_array();
			$qCount = 0;
			foreach($questions as $k) {
				$assembledQuiz['questions'][$qCount]['questionInfo'] = $k;
				if(!$c = $this->db->get_where('quiz_answers',array('quiz_id'=>$k['quiz_id'],'question_id'=>$k['id']))) {
					throw new exception("Unable to fetch answers for quiz during assembly.");
				}
				$answerObject = $c->result_array();
				foreach($answerObject as $k) {
					$assembledQuiz['questions'][$qCount]['answers'][] = $k;
				}
				$qCount++;
			}
			return $assembledQuiz;
		} catch(exception $e) {
			//return array('success'=>false,'msg'=>$e->getMessage());
			print $e->getMessage();
		}
	}
}

?>