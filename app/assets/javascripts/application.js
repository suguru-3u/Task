// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require jquery3
//= require popper
//= require bootstrap-sprockets
//= require_tree .

// 設計図
// times = document.getElementById('time')
//
// if (times > today){
//
// }

var now = new Date();
 function displayMonth() {
   var now, months, month, year;

   now = new Date();
   //var christmas = new Date(2016, 11, 25);
   months = ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'];
   month = now.getMonth();
   year = now.getFullYear();
   document.getElementsByClassName('DateTimeDisp').textContent = months[month] + ' ' + year;
 }
 displayMonth();

// 実際の処理