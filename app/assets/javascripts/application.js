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

// 処理の設計図
// taskscountのidを取得, countのidを取得


// 数が０個なら緑の背景、数が０個以上なら青の背景、数が０個以上なら赤の背景
// function NumberOfTasks () {
//   var taskscount = document.getElementById('taskscount').innerHTML;
//   var count = document.getElementById('count');
//   console.log('onload');
//   console.log(taskscount);
//   console.log(count);
//   if (taskscount > 0){
//     count.classList.add('bg-info');
//   }else{
//     count.classList.remove('bg-info');
//   }
// }
// 処理の実行エリア
