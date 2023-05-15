const setinha = document.getElementsByClassName("setinha");
const cabeca = document.getElementById("cabeca");
const iconescabeca = document.getElementsByClassName("iconescabeca");
const turistecimg = document.getElementById("turistecimg");
const lugares = document.getElementsByClassName("lugares");
const setaesquerda = document.getElementsByClassName("setaesquerda");
const setadireita = document.getElementsByClassName("setadireita");
const caixas = document.getElementsByClassName("caixas");
const iconburge = document.getElementById("iconeburge")
const barralateral = document.getElementById("barra-lateral");
const contaicone = document.getElementById("iconeconta");
const contacaixa = document.getElementById("conta-caixa");

let contacaixapos = 0;
let barrapos = 0;
let movspd = 310;
let dir = 0;

function inicio() {
  setTimeout(function () {
    cabeca.style.height = "50px";
    turistecimg.style.height = "50px";
    document.body.style.overflowY = "visible";

    iconburge.addEventListener("click", (event) =>{
      if(barrapos == 0){
      barralateral.style.transform = "translate(0px, 0)";
      barrapos = 1;
      }else{
        barralateral.style.transform = "translate(-251px, 0)";
        barrapos = 0;
      }
    });

    contaicone.addEventListener("click", (event)=>{
      if(contacaixapos == 0){
      contacaixapos = 1;
      contacaixa.style.zIndex = "2";
      console.log("aaaaaaaaaaaaaaaaaaaaaaaaa")
    }else{
      contacaixapos = 0
      contacaixa.style.zIndex = "-1";
    }
    });

    Array.from(caixas).forEach(function (elemento) {
      elemento.pos = 0;
    });

    Array.from(setaesquerda).forEach(function (elemento) {
      elemento.addEventListener("click", (event) => {
        rolarparaesquerda(
          elemento.parentElement.parentElement.getElementsByClassName(
            "lugares"
          ),
          elemento.parentElement.parentElement
        );
      });
    });

    Array.from(setadireita).forEach(function (elemento) {
      elemento.addEventListener("click", (event) => {
        rolarparadireita(
          elemento.parentElement.parentElement.getElementsByClassName(
            "lugares"
          ),
          elemento.parentElement.parentElement
        );
      });
    });
  }, 2000);

  setTimeout(function () {
    Array.from(iconescabeca).forEach(function (elemento) {
      elemento.style.transform = "translate(0px, 0)";
    });
  }, 3500);
}

Array.from(setinha).forEach(function (elemento) {
  elemento.addEventListener("click", (event) => {
    window.scrollTo(0, 742);
  });
});

function rolarparadireita(lug, da) {
  if (da.pos > -movspd * (20 - 5)) {
    da.pos = da.pos - movspd;
    Array.from(lug).forEach(function (elemento) {
      elemento.style.transform = "translateX(" + da.pos + "px)";
    });
  }
}

function rolarparaesquerda(lug, da) {
  if (da.pos != 0) {
    da.pos = da.pos + movspd;
    Array.from(lug).forEach(function (elemento) {
      elemento.style.transform = "translateX(" + da.pos + "px)";
    });
  }
}

//Carrossel meio da pagina
document.addEventListener("DOMContentLoaded", function () {
  var slides = document.querySelectorAll(".carousel-item");
  var currentSlide = 0;

  function showSlide(n) {
    slides[currentSlide].classList.remove("active");
    currentSlide = (n + slides.length) % slides.length;
    slides[currentSlide].classList.add("active");
  }

  function nextSlide() {
    showSlide(currentSlide + 1);
  }

  setInterval(nextSlide, 8000); // Transição a cada 3 segundos

  showSlide(currentSlide);
});

function toggleDarkMode() {
  var body= document.querySelector('body');
  var menu = document.querySelector('.menu')
  var sol = document.querySelector('.sol');
  var lua = document.querySelector('.lua');
  body.classList.toggle('dark-mode');
  menu.classList.toggle('dark-mode')
  sol.style.display='none';
  lua.style.display='block';

 }
 
 function toggleLightMode() {
  var body= document.querySelector('body');
  var menu = document.querySelector('.menu')
  var sol = document.querySelector('.sol');
  var lua = document.querySelector('.lua')
  body.classList.toggle('dark-mode');
  menu.classList.toggle('dark-mode')
  sol.style.display='block';
  lua.style.display='none';
 }
