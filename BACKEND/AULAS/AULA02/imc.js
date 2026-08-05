const entrada = require('readline-sync');

console.log("--- CALCULADORA DE IMC ---")

const quantidadePeso = entrada.questionFloat("Qual o seu peso? ");
const numeroAltura = entrada.questionFloat("Qual a sua altura? ");

const total = quantidadePeso / (numeroAltura * numeroAltura)

console.log("\n--- CALCULO FEITO ---");
console.log(`Seu IMC é: ${total.toFixed(2)}`);