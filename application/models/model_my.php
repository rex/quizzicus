<?php

class Model_my extends CI_Model {
	
	function fetch() {
		$id = $this->session->userdata('id');
		$q = $this->db->query("SELECT * FROM quizzers LEFT JOIN quizzers_info ON quizzers_info.user_id = quizzers.id WHERE quizzers.id = $id");

		return $q->row_array();

	}

}