(function repetirAlertas() {
  let contador = 0;

  function mostrarAlerta() {
    alert("⚠️ Alerta número " + (contador + 1));
    contador++;

    if (contador < 5) {
      setTimeout(mostrarAlerta, 100); // pequena pausa entre alertas
    } else {
      contador = 0;
      setTimeout(mostrarAlerta, 1000); // pausa maior antes de repetir os 5
    }
  }

  mostrarAlerta();
})();
