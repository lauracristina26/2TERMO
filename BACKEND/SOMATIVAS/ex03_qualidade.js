const entrada = require('readline-sync');

const peso = entrada.questionInt("Peso da peca: ");

if (peso >= 95 && peso < 105) {
    console.log("PEÇA APROVADA");
} else {
    console.log("PEÇA REPROVADA");
}