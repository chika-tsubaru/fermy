window.addEventListener("load", function() {

  var obj = document.getElementsByClassName("answer_btn");
  answersAry = Array.prototype.slice.call(obj);
  var object = document.getElementsByClassName("answer_text");

  function tabSwitch() {

    const index = answersAry.indexOf(this);
    if(object[index].style.display =="block"){
      object[index].style.display = "none";
    }
    else{
      object[index].style.display = "block";
    }

  }

  answersAry.forEach(function(value) {
    value.addEventListener("click", tabSwitch);
  });

});