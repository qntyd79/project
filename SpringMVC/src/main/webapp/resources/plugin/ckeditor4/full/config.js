/**
 * @license Copyright (c) 2003-2021, CKSource - Frederico Knabben. All rights reserved.
 * For licensing, see https://ckeditor.com/legal/ckeditor-oss-license
 */

CKEDITOR.editorConfig = function( config ) {
	
	config.toolbarGroups = [
		{ name: 'document', groups: [ 'mode', 'document', 'doctools' ] },
		{ name: 'clipboard', groups: [ 'clipboard', 'undo' ] },
		{ name: 'editing', groups: [ 'find', 'selection', 'spellchecker', 'editing' ] },
		{ name: 'forms', groups: [ 'forms' ] },
		'/',
		{ name: 'basicstyles', groups: [ 'basicstyles', 'cleanup' ] },
		{ name: 'paragraph', groups: [ 'list', 'indent', 'blocks', 'align', 'bidi', 'paragraph' ] },
		{ name: 'links', groups: [ 'links' ] },
		{ name: 'insert', groups: [ 'insert' ] },
		'/',
		{ name: 'styles', groups: [ 'styles' ] },
		{ name: 'colors', groups: [ 'colors' ] },
		{ name: 'tools', groups: [ 'tools' ] },
		{ name: 'others', groups: [ 'others' ] },
		{ name: 'about', groups: [ 'about' ] }
	];

	config.removeButtons = 'ExportPdf';
	
	// 기본설정
	config.language = 'ko';
	config.uiColor = '#e1e1e1';
	config.width = 500;     // 500 pixels wide.
	config.width = '100%';   // CSS unit (percent).
	config.height = 500;        // 500 pixels high.
	config.height = '25em';     // CSS unit (em).
	config.resize_enabled = false;
	config.enterMode = CKEDITOR.ENTER_BR;
	config.shiftEnterMode = CKEDITOR.ENTER_P;
	config.htmlEncodeOutput = false; 
	config.extraAllowedContent = 'strong;span;ul;li;table;td;style;*[id];*(*);*{*}';
	config.fillEmptyBlocks = false;
	config.allowedContent = true;
    config.filebrowserUploadMethod='form';
	
	// 업로드설정
    config.filebrowserUploadUrl      = '/modules/attach/ckUpload.do',
    config.filebrowserImageUploadUrl = '/modules/attach/ckUpload.do',
    config.filebrowserWindowWidth = '640',
    config.filebrowserWindowHeight= '480'
};

