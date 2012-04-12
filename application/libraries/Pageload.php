<?php 

class Pageload {

	function load($view = null, $data = null) {
	
		$CI =& get_instance();
		
		$CI->load->view('global/header_view',$data);
		$CI->load->view($view . '_view',$data);
		$CI->load->view('global/footer_view',$data);
	}
	
	function loadIndex($view = null, $data = null) {
	
		$CI =& get_instance();
		
		$CI->load->view('index/header_view',$data);
		$CI->load->view($view . '_view',$data);
		$CI->load->view('index/footer_view',$data);
	}

}

?>