// Configuração dos números de WhatsApp para cada unidade
// Substiua os números abaixo pelos números reais com DDD (Ex: 5519999999999)
const telefonesWhatsapp = {
  Limeira: "5519999999999",
  Campinas: "5519999999999",
  Americana: "5519999999999"
};

// Configuração dos links das Redes Sociais
const linksRedesSociais = {
  instagram: "https://www.instagram.com/oficinabeleza_lr",
  tiktok: "https://www.tiktok.com/@oficinabeleza_lr",
  linkedin: "https://www.linkedin.com"
};

// Função para redirecionar para o WhatsApp da unidade
function abrirWhatsApp(unidade) {
  const numero = telefonesWhatsapp[unidade];
  const mensagem = encodeURIComponent(`Olá! Gostaria de agendar um horário na unidade de ${unidade}.`);
  const url = `https://wa.me/${numero}?text=${mensagem}`;
  
  // Abre em uma nova aba
  window.open(url, '_blank');
}

// Função para abrir os links das redes sociais
function abrirRedeSocial(rede) {
  const url = linksRedesSociais[rede];
  if (url) {
    window.open(url, '_blank');
  }
}