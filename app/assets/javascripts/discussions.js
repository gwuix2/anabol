$(function() {
  var faye = new Faye.Client('http://anabolizmus:9292/faye');
  faye.subscribe("/messages/new", function(data) {
    eval(data);
  });
});