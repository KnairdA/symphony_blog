<?php

	require_once(TOOLKIT . '/class.event.php');

	Class eventadd_comment extends Event{

		const ROOTELEMENT = 'add-comment';

		public $eParamFILTERS = array(
			
		);

		public static function about(){
			return array(
				'name' => 'add-comment',
				'author' => array(
					'name' => 'Adrian Kummerländer',
					'website' => 'http://127.0.0.1/symphony',
					'email' => 'knairda@t-online.de'),
				'version' => 'Symphony 2.2.2',
				'release-date' => '2011-08-30T12:34:10+00:00',
				'trigger-condition' => 'action[add-comment]'
			);
		}

		public static function getSource(){
			return '2';
		}

		public static function allowEditorToParse(){
			return false;
		}

		public static function documentation(){
			return '
        <h3>Success and Failure XML Examples</h3>
        <p>When saved successfully, the following XML will be returned:</p>
        <pre class="XML"><code>&lt;add-comment result="success" type="create | edit">
  &lt;message>Entry [created | edited] successfully.&lt;/message>
&lt;/add-comment></code></pre>
        <p>When an error occurs during saving, due to either missing or invalid fields, the following XML will be returned:</p>
        <pre class="XML"><code>&lt;add-comment result="error">
  &lt;message>Entry encountered errors when saving.&lt;/message>
  &lt;field-name type="invalid | missing" />
  ...
&lt;/add-comment></code></pre>
        <h3>Example Front-end Form Markup</h3>
        <p>This is an example of the form markup you can use on your frontend:</p>
        <pre class="XML"><code>&lt;form method="post" action="" enctype="multipart/form-data">
  &lt;input name="MAX_FILE_SIZE" type="hidden" value="2097152" />
  &lt;label>Author
    &lt;input name="fields[author]" type="text" />
  &lt;/label>
  &lt;label>Website
    &lt;input name="fields[website]" type="text" />
  &lt;/label>
  &lt;label>Date
    &lt;input name="fields[date]" type="text" />
  &lt;/label>
  &lt;label>Article
    &lt;select name="fields[article]">
      &lt;option value="PlugBox Linux - Ein ArchLinux Port für den SheevaPlug">PlugBox Linux - Ein ArchLinux Port für den SheevaPlug&lt;/option>
      &lt;option value="Test Artikel 1">Test Artikel 1&lt;/option>
      &lt;option value="Test Artikel 3">Test Artikel 3&lt;/option>
    &lt;/select>
  &lt;/label>
  &lt;label>Comment
    &lt;textarea name="fields[comment]" rows="15" cols="50">&lt;/textarea>
  &lt;/label>
  &lt;label>Approved
    &lt;input name="fields[approved]" type="checkbox" />
  &lt;/label>
  &lt;input name="action[add-comment]" type="submit" value="Submit" />
&lt;/form></code></pre>
        <p>To edit an existing entry, include the entry ID value of the entry in the form. This is best as a hidden field like so:</p>
        <pre class="XML"><code>&lt;input name="id" type="hidden" value="23" /></code></pre>
        <p>To redirect to a different location upon a successful save, include the redirect location in the form. This is best as a hidden field like so, where the value is the URL to redirect to:</p>
        <pre class="XML"><code>&lt;input name="redirect" type="hidden" value="http://127.0.0.1/symphony/success/" /></code></pre>';
		}

		public function load(){
			if(isset($_POST['action']['add-comment'])) return $this->__trigger();
		}

		protected function __trigger(){
			// <customcode>
			$_POST['fields']['approved'] = '';
			// </customcode>
			
			include(TOOLKIT . '/events/event.section.php');
			return $result;
		}

	}
