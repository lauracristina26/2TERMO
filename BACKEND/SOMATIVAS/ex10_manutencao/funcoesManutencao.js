function calcularMaoDeObras(horas) {
    const valorHora = 80.00;
}

function calcularTotal(valorPecas, horas) {
    return valorPecas + horas;
}

function verificarGarantia(meses) {
    if (meses <=6) {
        return "EM GARANTIA";
    } else {
        return "FORA DA GARANTIA";
    }
}

module.exports = {
    calcularMaoDeObras,
    calcularTotal,
    verificarGarantia
};