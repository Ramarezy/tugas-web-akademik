function show_modal(iteration) {
  console.log("myModal" + iteration);

  var modal = document.getElementById("myModal" + iteration);

  var span = document.getElementById("close" + iteration);

  myBtn.onclick = function () {
    modal.style.display = "block";
  };

  span.onclick = function () {
    modal.style.display = "none";
  };

  window.onclick = function (event) {
    if (event.target == modal) {
      modal.style.display = "none";
    }
  };
}

function show_modal_edit(iteration) {
  var modal = document.getElementById("myModal" + iteration);
  var span = document.getElementById("close" + iteration);

  var buttonEdit = document.getElementById("buttonEdit" + iteration);

  buttonEdit.onclick = function () {
    modal.style.display = "block";
  };

  span.onclick = function () {
    modal.style.display = "none";
  };

  window.onclick = function (event) {
    if (event.target == modal) {
      modal.style.display = "none";
    }
  };
}
