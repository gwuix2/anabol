$(function() {
  var faye = new Faye.Client('http://anabolizus.com:9292/faye');
  faye.subscribe("/messages/new", function(data) {
    eval(data);
  });
});