<?php

	require_once(TOOLKIT . '/class.datasource.php');

	Class datasourcearticles_showcase extends Datasource{

		public $dsParamROOTELEMENT = 'articles-showcase';
		public $dsParamORDER = 'random';
		public $dsParamPAGINATERESULTS = 'yes';
		public $dsParamLIMIT = '5';
		public $dsParamSTARTPAGE = '1';
		public $dsParamREDIRECTONEMPTY = 'no';
		public $dsParamSORT = 'system:date';
		public $dsParamASSOCIATEDENTRYCOUNTS = 'no';

		public $dsParamFILTERS = array(
				'15' => 'yes',
		);

		public $dsParamINCLUDEDELEMENTS = array(
				'title'
		);


		public function __construct(&$parent, $env=NULL, $process_params=true){
			parent::__construct($parent, $env, $process_params);
			$this->_dependencies = array();
		}

		public function about(){
			return array(
				'name' => 'articles-showcase',
				'author' => array(
					'name' => 'Adrian Kummerländer',
					'website' => 'http://127.0.0.1/symphony',
					'email' => 'knairda@t-online.de'),
				'version' => 'Symphony 2.2.3',
				'release-date' => '2011-09-17T14:24:29+00:00'
			);
		}

		public function getSource(){
			return '1';
		}

		public function allowEditorToParse(){
			return true;
		}

		public function grab(&$param_pool=NULL){
			$result = new XMLElement($this->dsParamROOTELEMENT);

			try{
				include(TOOLKIT . '/data-sources/datasource.section.php');
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
