const entrada = require('readline-sync');
const oficina = require('./funcoesOficinas');

console.log("=== SISTEMA DE GESTAO DE OFICINA 1.0 ===");

const peca = entrada.questionFloat("Preco da peca: R$ ");
const horas = entrada.questionInt("Horas de servico: R$ ");
const tempoUso = entrada.questionInt("Meses desde o ultimo conserto:  ");

const total = oficina.calcularOrcamento(peca, horas);
const garantia = oficina.verificarGarantia(tempoUso);
const desconto = oficina.calcularDesconto(total, 20);

console.log("\n--- RELATORIO DE SERVICO ---");
console.log(`Orcamento: R$ ${total.toFixed(2)}`);
console.log(`Status Garantia: ${garantia}`);
console.log(`Orcamento com desconto aplicado: R$ ${desconto.toFixed(2)}`);
console.log("------------------------------");