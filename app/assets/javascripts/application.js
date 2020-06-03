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
// データがあった場合に呼ばれる関数
  function buildHTML(dataFromSearchFunction){
    let html = `
    <li>${dataFromSearchFunction.name}</li>
    `
    searchResult.append(html);
  }

  // 該当するデータがなかった時に呼ばれる関数
  function NoResult(message){
    let html = `
    <li>${message}</li>
    `
    searchResult.append(html);
  }

$(function() {
  $("#search-input").on("keyup", function() {
    let input = $("#search-input").val();
    console.log(input);
    $.ajax({
      type: 'GET',
      url: '/tasks/search',
      data: { name: input },
      dataType: 'json'
    })
    .done(function(data){
        // 通信が成功した時の処理
      searchResult.empty(); //再度検索した際に前のデータを消す処理
      if (data.length !== 0) {
        data.forEach(function(data) { //dataは配列型に格納されているのでEach文で処理
        buildHTML(data)
        });
      } else {
        NoResult('該当する商品はありません')
        }
      })
   .fail(function() {
      alert('error');
    });
  });
});
