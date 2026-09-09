const entrada = require('readline-sync');

const manutencao = require('./funcoesManutencao');

const nomeMaquina = entrada.question("Nome da maquina: ");
const peca = entrada.questionFloat("Preco da peca: ");
const horas = entrada.questionInt("Horas de serviço: ");
const mesesUso = entrada.questionInt("Meses desde a última manutenção: ");

const total = manutencao.calcularTotal(peca, horas);
const garantia = manutencao.verificarGarantia(mesesUso);

console.log("\n=== RELATORIO FINAL ===");
console.log(`Maquina: ${nomeMaquina}`);
console.log(`Mao de Obra: ${horas}`);
console.log(`Pecas: ${peca}`);
console.log(`Valor a ser pago: R$ ${total.toFixed(2)}`);
console.log(`Situacao da garantia: ${garantia}`);