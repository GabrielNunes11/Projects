function toggleDarkMode() {
  var body = document.querySelector("body");
  var menu = document.querySelector(".container");
  var sol = document.querySelector(".sol");
  var lua = document.querySelector(".lua");
  body.classList.toggle("dark-mode");
  menu.classList.toggle("dark-mode");
  sol.style.display = "none";
  lua.style.display = "block";
}

function toggleLightMode() {
  var body = document.querySelector("body");
  var menu = document.querySelector(".container");
  var sol = document.querySelector(".sol");
  var lua = document.querySelector(".lua");
  body.classList.toggle("dark-mode");
  menu.classList.toggle("dark-mode");
  sol.style.display = "block";
  lua.style.display = "none";
}
