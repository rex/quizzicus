<?php

class AutoPop extends CI_Controller {
	
	public function index() {
		print "Select a function: <br /><br />";
		print '<a href="' . site_url("autopop/users") . '">Create a lot of users</a><br /><br />';
		print '<a href="' . site_url("autopop/quizzes") . '">Create a lot of quizzes</a><br /><br />';
	}

	public function quizzes() {

		$num = new stdClass;
		$num->quizzes = 1000;
		$num->questions = 20;
		$num->answers = 5;

		$quiz = new stdClass;
		$quiz->subjects = array(
			'Language Arts','Mathematics','Science','Health','Handwriting','Physical Education','Art','Music','Instrumental Music','Movement or Eurythmy','Handwork or handcrafts','Life Lab or gardening','Dramatics',
			'Dance','Spanish or other foreign language','Leadership','Special Education Day Class','Resource Program','Speech','Adaptive P.E.','Occupational Therapy','Middle School Subjects','Reading','Language arts',
			'Speech and Debate','English','Basic Math','Pre-algebra','Consumer Math','Algebra','Geometry','Honors Math in Algebra or Geometry','Life Science','Earth Science','Physical Science','Health','Social Studies',
			'Geography','Ancient Civilizations','Medieval and Renaissance','U.S. History and Government','French / Spanish / Latin','Computer Science or Lab','Art','Home Economics','Woodshop','Metal Shop','Business Technology',
			'Instrumental Music','Band','Choir','Drama','Physical Education','Sports','Special Education Day Class','Resource Program','Speech Therapy','Occupational Therapy','English I','English II','English III','English IV',
			'Remedial English','ESL – English as second language','World Literature','Ancient Literature','Medieval Literature','Renaissance Literature','Modern Literature','British Literature','American Literature','Classical literature',
			'Shakespeare','Heroes, Myth and Legend','Film as Literature','Composition','Creative Writing','Poetry','Grammar','Vocabulary','Debate','Speech','Journalism','Publishing Skills','Photojournalism','Yearbook','Study Skills','Research Skills',
			'FINE ARTS','Art I','Art II','Art III','Art IV','Art Appreciation','Art History','Drawing','Painting','Sculpture','Ceramics','Instrumental Music','Music Appreciation','Music History','Music Theory','Music Fundamentals','Band',
			'Orchestra','Choir','Voice','Classical Music Studies','Performing Arts','Theatre Arts'
		);
		$quiz->types = array(
			"Exam" , "Final" , "Midterm" , "Study Guide" , "Pop Quiz" , "Quiz" , "Entrance Exam" , "Knowledge Assessment"
		);
		$quiz->questions = array(
			"Where is the United States?","Who is the president?","Why is the sky blue?","How many woodchucks are there?","Are there aliens out there?", "How long is your name?","Who was our first president?","What is my name?",
			"Who is your daddy?","What does he do?","What does a keyboard look like?","How bright is the sun?","Why are there muskrats everywhere?","Is this a bizarre question?","This statement is false.","GlaDOS is amazing","The sun is yellow.",
			"There are 200 letter in the English language.","I love snack cakes.","I wonder how many planets there are?","This is a question.","This is not a question.","I wonder if this is a question?","How many people are there?","Do you like coca-cola?",
			"How do you like your burgers cooked?", "Do you own a dog?","What is the subject of this class?","Blah blah blah HAHAHA","WOOOOOOO Going crazy","I like lightbulbs.","I need some advil.","What is Advil made of?","What's the VP's name?",
			"Do you love me?","Are you playing your love games with me?","Do you know what love games are?"
		);
		$surnames = array("Mr." , "Mrs.");
		$fnames = array(
			"Sally" , "Bobby" , "Mark" , "Joe" , "Rebecca" , "Elizabeth" , "Sarah" , "Travis" , "Billy" , "Nathan" , "Yu" , "Josh" , "Ian" , "Jacob" , 
			"Michael" , "Scott" , "Matthew" , "Ethan" , "Andrew" , "Daniel" , "Anthony" , "Christopher" , "Alexander" , "Ryan" , "Tyler" , "Dylan" , "Benjamin"
		);
		$lnames = array(
			"Moore" , "Fisher" , "Hamilton" , "Darvish" , "Kinsler" , "Garcia" , "Jones" , "Mercer" , "Alameel" , "Davis" , "Johnson" , "Sills" , "Williams" , "Brown" , "Miller" , 
			"Anderson" , "Jackson" , "Martin" , "Harris" , "Thompson" , "Wilson" , "Taylor" , "Robinson" , "Martinez" , "Clark" , "Lewis" , "Lee"
		);
		$streets = array(
			"Oak" , "Spring Valley" , "Canton" , "Oak Lawn" , "Main" , "Belt Line" , "Clark" , "Cedar" , "Meadow Creek" , "Creek View" , "Valley View" , "Commerce" , "Gaston" , 
			"Awesome" , "Captain Amazing" , "Whatever" , "Baseball" , "Ballpark" , "Prairie" , "Spring Creek" , "Snob Hill" , "Swiss" , "Tree Grass" , "Lollipop" , "Happiness" , "Bay Point"
		);


		$finished = false;

		$quizzes = array();
		while( !$finished ) {

			$questions = "";
			$quizCount = count($quizzes);
			$rand = rand(0,7006);


			// IMPORTANT
			$randUser = "";
			$q = $this->db->query("SELECT id FROM quizzers ORDER BY RAND() LIMIT 1");
			$r = $q->row();
			$randUser = $r->id;



			$teacher = array_rand(array_flip( $surnames )) . " " . array_rand(array_flip( $lnames ));
			$subject = array_rand(array_flip( $quiz->subjects ));
			$quiztype = array_rand(array_flip( $quiz->types ));
			$date = date("Y-m-d H:i:s");
			$active = ( ( $quizCount % 10 ) == 0 ) ? "0" : "1";
			$public = ( ( $quizCount % 5 ) == 0) ? "0" : "1";
			$timed = ( ( $quizCount % 3 ) == 0) ? "0" : "1";
			$timer = ( ( $quizCount % 7 ) == 0) ? "0" : 60 * rand(60,6000);
			$allowBreaks = ( ( $quizCount % 4 ) == 0) ? "0" : "1";
			$num_breaks = ( $allowBreaks == "0" ) ? "0" : rand(1,100);
			$randomize = ( ( $quizCount % 6 ) == 0) ? "0" : "1";
			$nsfw = ( ( $quizCount % 8 ) == 0) ? "1" : "0";
			$banner = "banner" . rand(1,5) . ".png";

			$testname = "$teacher's $subject $quiztype";
			for( $i = 0; $i < $num->questions; $i++ ) {

				$type = rand(1,5);
				if( $type == 1 ) {
					$answers = array_rand(array_flip(array("true","false"))); // Boolean
				} else {
					$answers = array_rand(array_flip( array_merge($fnames,$streets,$lnames,$quiz->subjects) ), $num->answers );
				}
				$questions[] = array(
					'name'	=>	array_rand(array_flip( $quiz->questions )),
					'type'	=>	$type,
					'desc'	=>	"This is a question description. I really hope you enjoy it, because I'm not making a million custom descriptions.",
					'answers' => $answers,
					'correct' => ( is_array($answers) ) ? array_rand( $answers ) : $answers
				);
			}
			$data = array(
				'name'	=>	$testname,
				'description' => "The test description goes here. For this one, we would make a reference to the title, $testname.",
				'num_questions' => $num->questions,
				'date_created'	=>	$date,
				'created_by_user' => $randUser,
				'last_modified_by_user' => $randUser,
				'active' => $active,
				'public' => $public,
				'timed'	=> $timed,
				'timer'	=> $timer,
				'allow_breaks'	=> $allowBreaks,
				'num_breaks_allowed' => $num_breaks,
				'randomize'	=> $randomize,
				'nsfw'	=> $nsfw,
				'questions' => $questions,
				'banner'	=>	$banner
			);
			$quizzes[] = $data;

			if( count($quizzes) >= $num->quizzes ) {
				$finished = true;
			}

		}

		//print_r( $quizzes );

/**/
		foreach( $quizzes as $k=>$v ) {

			$quizInfo = array(
				'user_id'	=>	$v['created_by_user'],
				'name'		=>	$v['name'],
				'description'=> $v['description'],
				'num_questions'=> $v['num_questions'],
				'date_created'=>$v['date_created'],
				'created_by_user'=>$v['created_by_user'],
				'last_modified_by_user'=>$v['last_modified_by_user'],
				'active'	=>	$v['active'],
				'public'	=>	$v['public'],
				'timed'		=>	$v['timed'],
				'timer'		=>	$v['timer'],
				'allow_breaks'=>$v['allow_breaks'],
				'num_breaks_allowed'=>$v['num_breaks_allowed'],
				'banner_message'=>"This is the stock banner message. I will do something with this eventually. The quiz is {$v['name']} though.",
				'banner_image_url'=>$v['banner'],
				'randomize'	=>	$v['randomize'],
				'nsfw'		=>	$v['nsfw']
			);
			//print_r($quizInfo);
			$q = $this->db->insert('quizzes',$quizInfo);
			$quiz_id = $this->db->insert_id();
			//$quiz_id = $k;

			foreach( $v['questions'] as $key=>$val ) {
				$questionInfo = array(
					'quiz_id'	=>	$quiz_id,
					'question_type'=> $val['type'],
					'question_name'=> $val['name'],
					'question_content'=>$val['desc'],
					'created_on'=> $v['date_created'],
					'last_modified_by_user'=>$v['last_modified_by_user'],
					'active'	=> $v['active']
				);
				//print_r($questionInfo);
				$q = $this->db->insert('quiz_questions',$questionInfo);
				$question_id = $this->db->insert_id();
				//$question_id = $key;//
				if( is_array( $val['answers'])) {
					foreach( $val['answers'] as $KEY=>$VAL ) {
						$correct = 0;
						if( $KEY == $val['correct'] ) {
							$correct = 1;
						} else {
							$correct = 0;
						}
						$answerInfo = array(
							'quiz_id'	=>	$quiz_id,
							'question_id'=> $question_id,
							'answer_type'=> $val['type'],
							'answer_content'=>$VAL,
							'date_created' => $v['date_created'],
							'is_correct' => $correct
						);
						//print_r($answerInfo);
						$this->db->insert('quiz_answers',$answerInfo);
					}
				} else {
					$correct = 1;
					$answerInfo = array(
						'quiz_id'	=>	$quiz_id,
						'question_id'=> $question_id,
						'answer_type'=> $val['type'],
						'answer_content'=>$val['answers'],
						'date_created' => $v['date_created'],
						'is_correct' => $correct
					);
					//print "<h1>BOOLEAN -> {$val['answers']}</h1>";
					//print_r($answerInfo);
					$this->db->insert('quiz_answers',$answerInfo);
				}
			}
		}


	}

	public function users() {

		// Grab Country Codes
		$q = $this->db->select('iso')->from('taxonomy_countries')->get();
		foreach( $q->result_array() as $k=>$v ) {
			$countries[] = $v['iso'];
		}
		$q = $this->db->select("abbrev")->from('taxonomy_states')->get();
		foreach( $q->result_array() as $k=>$v ) {
			$states[] = $v['abbrev'];
		}

		$i = 10;
		$records = 100;
		$usernames = array();
		$max_type = 5;
		$fnames = array(
			"Sally" , "Bobby" , "Mark" , "Joe" , "Rebecca" , "Elizabeth" , "Sarah" , "Travis" , "Billy" , "Nathan" , "Yu" , "Josh" , "Ian" , "Jacob" , 
			"Michael" , "Scott" , "Matthew" , "Ethan" , "Andrew" , "Daniel" , "Anthony" , "Christopher" , "Alexander" , "Ryan" , "Tyler" , "Dylan" , "Benjamin"
		);
		$lnames = array(
			"Moore" , "Fisher" , "Hamilton" , "Darvish" , "Kinsler" , "Garcia" , "Jones" , "Mercer" , "Alameel" , "Davis" , "Johnson" , "Sills" , "Williams" , "Brown" , "Miller" , 
			"Anderson" , "Jackson" , "Martin" , "Harris" , "Thompson" , "Wilson" , "Taylor" , "Robinson" , "Martinez" , "Clark" , "Lewis" , "Lee"
		);
		$streets = array(
			"Oak" , "Spring Valley" , "Canton" , "Oak Lawn" , "Main" , "Belt Line" , "Clark" , "Cedar" , "Meadow Creek" , "Creek View" , "Valley View" , "Commerce" , "Gaston" , 
			"Awesome" , "Captain Amazing" , "Whatever" , "Baseball" , "Ballpark" , "Prairie" , "Spring Creek" , "Snob Hill" , "Swiss" , "Tree Grass" , "Lollipop" , "Happiness" , "Bay Point"
		);
		$streetEnds = array(
			"Blvd." , "St." , "Ave." , "Rd." , "Pkwy." , "Cir." , "Dr."
		);
		$phonePre = array(
			"972" , "214" , "817" , "469" , "505" , "512" , "201"
		);

		$finished = false;
		// First, we create users
		while( !$finished ) {
			$fname = array_rand(array_flip($fnames));
			$lname = array_rand(array_flip($lnames));
			$street = array_rand(array_flip( $streets ));
			$streetEnd = array_rand(array_flip( $streetEnds));
			$state = array_rand(array_flip($states));
			$country = array_rand(array_flip( $countries));
			$zip = rand(10000,99999);
			$phone = array_rand(array_flip($phonePre)) . "-" . rand(100,999) . '-' . rand(0,9999);

			$rand = mt_rand();
			$smallRand = rand(1000,9999);
			$uname = strtolower($fname[0] . $lname) . $rand;
			$pass = sha1($lname);
			if( $i % 10 == 0 ) {
				$active = 0;
			} else {
				$active = 1;
			}
			$address = "$smallRand $street $streetEnd SomeCity, $state $zip";

			if( in_array( $uname , $usernames ) ) {
				$uname = $uname . $rand;
			}
			if( in_array( $uname , $usernames ) ) {
				break;
			}
			$usernames[] = $uname;

			$time = date("Y-m-d H:i:s");

			$user[] = array(
				"username" => $uname,
				"password"	 => $pass,
				"user_type"	 => rand(1,$max_type),
				"active" => $active,
				"created_on" => $time,
				"active" => $active
			);
			$info[] = array(
				"name_first" => $fname,
				"name_last"  => $lname,
				"phone"		 => $phone,
				"country_code"=> $country,
				"address"	 => $address,
				"profile_image_url" => "profile" . rand(1,9) . ".jpg"
			);
			$activeUsers[$active][] = "$fname $lname";

			$i++;
			if( count($user) == $records ) {
				$finished = true;
			}
		}
		
/*		
		foreach( $user as $k=>$v ) {
			$this->db->insert('quizzers',$v);
			$info[$k]['user_id'] = $this->db->insert_id();
			$this->db->insert('quizzers_info',$info[$k]);
		}

		print "<h1>All done!</h1>";

		print "\n\n" . count($usernames) . "\n\n" ;
		//print_r($usernames);
		
		//print_r($activeUsers);
		foreach( $info as $k=>$v ) {
			print "<div style=\"clear:both;\">";
			print "<img src=\"http://localhost/quizzicus/assets/img/{$v['profile_image_url']}\" align=\"left\" />";
			print "<h2>{$v['name_first']} {$v['name_last']} a.k.a. {$user[$k]['username']}</h2>";
			print "Address: {$v['address']}<br />";
			print "Phone: {$v['phone']}<br />";
			print "</div> \n\n";
		}
*/
		//print_r($info);
		//print_r($user);
		/**/
		//print '</pre>';
	}

	function show() {

		print "<pre>";
		print "</pre>";
		$q = "SELECT * FROM `quizzers` LEFT JOIN `quizzers_info` ON `quizzers_info`.`user_id` = `quizzers`.`id` LIMIT 100";
		$q = $this->db->query($q);
		foreach( $q->result() as $k ) {
			print '<div style="clear:both;">';
			print '<img src="http://localhost/quizzicus/assets/img/' . $k->profile_image_url . '" align="left" style="width:40px; height: 40px;"/>';
			print "<h2>{$k->name_first} {$k->name_last} ({$k->username})</h2>";
			print '</div>';
		}
	}

	function count() {

		$q = "SELECT user_id, COUNT(user_id) FROM `quizzes` GROUP BY user_id ORDER BY COUNT(user_id) DESC";

		$q = $this->db->query( $q );

		$output = "";
		$count = 0;

		foreach( $q->result_array() as $k ) {
			$output .= "User {$k['user_id']} has {$k['COUNT(user_id)']} quizzes. <br />";
			$count += $k['COUNT(user_id)'];
		}

		$highUser = $q->row_array();
		$highUser = $highUser['user_id'];

		$q = "SELECT * FROM `quizzers` u LEFT JOIN `quizzers_info` i ON i.`user_id` = u.`id` WHERE u.`id` = $highUser";

		$q = $this->db->query( $q );

		print "<pre>";
		print_r($q->result());
		print "</pre>";

		print "<h1>There are " . $q->num_rows() . " users with quizzes assigned.</h1>";
		$q = "SELECT id FROM quizzers AS u WHERE NOT EXISTS ( SELECT * FROM quizzes AS q WHERE q.user_id = u.id )";

		$q = $this->db->query($q);

		print "<h1>$count quizzes accounted for.</h1>";
		print "<h1> There are " . number_format( $q->num_rows() ) . " users without quizzes assigned to them.</h1>";

		print $output;


	}
}

?>