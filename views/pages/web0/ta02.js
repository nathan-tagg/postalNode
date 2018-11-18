/* ta02.js*/

function clicked() {
  alert("Clicked!");
}

function changeColor() {
	document.getElementsByTagName('div')[0].style.backgroundColor = document.getElementById("color").value;
}
