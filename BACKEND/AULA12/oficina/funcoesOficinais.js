function calcularOrcamento(precoPeca, horasTrabalho) {
  const valorHora = 85.00;
  const totalMaodeObra = horasTrabalho * valorHora;
  return precoPeca + totalMaodeObra; //devolve 
}

function verificarGarantia(meses) {
  if (meses <=3){
    return "Dentro da Garantia"
  }else {
    return "Garantia expirada"
  }
}

function calcularDesconto(totalMaodeObra) {
  return totalMaodeObra * 0.8;
}

module.exports = {
  calcularOrcamento,
  verificarGarantia,
  calcularDesconto
}
