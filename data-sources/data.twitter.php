<?php

	require_once(TOOLKIT . '/class.datasource.php');

	Class datasourcetwitter extends Datasource{

		public $dsParamROOTELEMENT = 'twitter';
		public $dsParamURL = 'https://twitter.com/statuses/user_timeline/KnairdA.atom';
		public $dsParamXPATH = '/';
		public $dsParamCACHE = '5';
		public $dsParamTIMEOUT = '6';

		

		

		public function __construct(&$parent, $env=NULL, $process_params=true){
			parent::__construct($parent, $env, $process_params);
			$this->_dependencies = array();
		}

		public function about(){
			return array(
				'name' => 'Twitter',
				'author' => array(
					'name' => 'Adrian Kummerländer',
					'website' => 'http://127.0.0.1/symphony',
					'email' => 'knairda@t-online.de'),
				'version' => 'Symphony 2.2.2',
				'release-date' => '2011-09-01T13:17:41+00:00'
			);
		}

		public function getSource(){
			return 'dynamic_xml';
		}

		public function allowEditorToParse(){
			return true;
		}

		public function grab(&$param_pool=NULL){
			$result = new XMLElement($this->dsParamROOTELEMENT);

			try{
				include(TOOLKIT . '/data-sources/datasource.dynamic_xml.php');
			}
			catch(FrontendPageNotFoundException $e){
				// Work around. This ensures the 404 page is displayed and
				// is not picked up by the default catch() statement below
				FrontendPageNotFoundExceptionHandler::render($e);
			}
			catch(Exception $e){
				$result->appendChild(new XMLElement('error', $e->getMessage()));
				return $result;
			}

			if($this->_force_empty_result) $result = $this->emptyXMLSet();

			

			return $result;
		}

	}
