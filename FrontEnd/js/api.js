document.addEventListener("DOMContentLoaded", function() {
    const url = "https://6458072a0c15cb148216ac44.mockapi.io/name";
    const list = document.getElementById("lista-de-destinos");
    const filtro = document.getElementById("filtro-de-destinos");
  
    async function getData() {
      let dadosJson = await fetch(url);
      let dados = await dadosJson.json();
      console.log(dados);
  
      let destinos = dados.map((element) => {
        return element.destino;
      });
  
      filtro.addEventListener("input", function() {
        let filtroValor = filtro.value.toLowerCase();
        let destinosFiltrados = destinos.filter((destino) => {
          return destino.toLowerCase().includes(filtroValor);
        });
  
        list.innerHTML = "";
  
        destinosFiltrados.forEach((destino) => {
          let li = document.createElement("li");
          li.textContent = destino;
          list.appendChild(li);
        });
      });
  
      destinos.forEach((destino) => {
        let li = document.createElement("li");
        li.textContent = destino;
        list.appendChild(li);
      });
    }
  
    getData();
  });
  