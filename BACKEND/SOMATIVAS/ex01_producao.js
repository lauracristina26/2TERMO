const entrada = require('readline-sync');

const quantidadePecas = entrada.questionInt("Quantas pecas foram poduzidas? ");
const quantidadeHoras = entrada.questionInt("Qual a quantidade de horas do turno? ");

const totalPecas = quantidadePecas * quantidadeHoras; 

console.log(`Produção por hora: ${quantidadePecas}`);
console.log(`Horas de produção: ${quantidadeHoras}`);
console.log(`Total de pecas produzidas: ${totalPecas}`);