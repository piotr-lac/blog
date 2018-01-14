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
//= require_tree .

//= require jquery
//= require bootstrap-sprockets

//alert('koko')
window.addEventListener("load", function() {
 //  document.getElementById("q").value = "form javascript";

 //  document.getElementById("q").addEventListener('keypress', function() {
 //    console.log(this.value)
 //  });

 //  document.getElementById("q").addEventListener("mouseover", function() {
 //   console.log("myszka")
 // });

    document.getElementById("add").addEventListener("click", function() {
    var score = parseInt(document.getElementById('field1').value)+parseInt(document.getElementById('field2').value);
    document.getElementById("wynik").innerHTML = score
      
  })

});