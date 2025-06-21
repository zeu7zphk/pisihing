(function () {
  // 🔍 Função para pegar um cookie (se não for HttpOnly)
  function getCookie(name) {
    const cookieArr = document.cookie.split(";");

    for (let i = 0; i < cookieArr.length; i++) {
      const cookie = cookieArr[i].trim();
      if (cookie.startsWith(name + "=")) {
        return cookie.substring(name.length + 1);
      }
    }
    return null;
  }

  const codigo = getCookie("codigo");

  if (codigo) {
    // Corrigido: sem o duplo "//"
    const url = "https://affiliate.evofitnes.com/venda.php";

    fetch(url, {
      method: "POST",
      headers: {
        "Content-Type": "application/json"
      },
      body: JSON.stringify({ codigo: codigo })
    })
    .then(res => res.text())
    .then(res => {
      console.log("✅ Enviado com sucesso:", res);
    })
    .catch(err => {
      console.error("❌ Erro ao enviar POST:", err);
    });
  } else {
    console.warn("⚠️ Cookie 'codigo' não encontrado ou é HttpOnly.");
  }
})();
