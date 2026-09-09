const entrada = require('readline-sync');

let nome = entrada.question("Nome do material: ");
let quantidadeCom = entrada.questionInt("Quantidade comprada: ");
let precoUnitario = entrada.questionFloat("Preco Unitario: ");

let valorTotal = precoUnitario * quantidadeCom; 

console.log("=== RELATORIO DA COMPRA ===");
console.log(`Material: ${nome}`);
console.log(`Quanidade Comprada: ${quantidadeCom}`);
console.log(`Preco: ${precoUnitario}`);
console.log(`Total pago: R$ ${valorTotal.toFixed(2)}`);