// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require foundation
//= require turbolinks
//= require epiceditor

var opts = {
  container: 'epiceditor',
  textarea: 'my-edit-area',
  basePath: '/epiceditor',
  parser: marked,
  theme: {
    base: '/themes/base/epiceditor.css',
    preview: '/themes/preview/preview-dark.css',
    editor: '/themes/editor/epic-dark.css'
  },
  button: {
    preview: true,
    bar: "auto"
  },
  focusOnLoad: false,
  shortcut: {
    modifier: 18,
    fullscreen: 70,
    preview: 80
  },
  string: {
    togglePreview: 'Toggle Preview Mode',
    toggleEdit: 'Toggle Edit Mode',
    toggleFullscreen: 'Enter Fullscreen'
  },
  autogrow: true
};
$("#my-edit-area").hide();

var edit_regex = /pages\/\w*\/edit$/i;
var new_regex = /pages\/new$/i;

console.log("before ifs");
if (edit_regex.test(window.location.pathname) ){
  var editor = new EpicEditor(opts).load();
  console.log("inside edit_regex if");
}

if (new_regex.test(window.location.pathname) ){
  var editor = new EpicEditor(opts).load();
  $("#my-edit-area").val("");
  window.editor.importFile(null, '');
  console.log("inside new_regex if");
}
console.log("after ifs");

$(function(){ $(document).foundation(); });

