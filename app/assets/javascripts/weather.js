// $(function() {
//   var API_KEY = '5ad6c5ef4196a96b3ed9a1d487be0d17'
//   var city = 'Tokyo';
//   var url = 'http://api.openweathermap.org/data/2.5/forecast?q=' + city + ',jp&units=metric&APPID=' + API_KEY;
//   $.ajax({
//     url: url,
//     dataType: "json",
//     type: 'GET',
//   })
//   .done(function(data) {
//     var insertHTML = "";
//     var cityName = '<h2>' + data.city.name + '</h2>';
//     $('#city-name').html(cityName);
//     //
//     // $('#weather').html(insertHTML);
//   })
//   .fail(function(data) {
//      console.log("失敗しました");
//   });
// });
