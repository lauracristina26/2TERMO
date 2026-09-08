const entrada = require("readline-sync");

console.log("======================");
console.log("VERIFICADOR DE VOTAÇÃO")
console.log("======================\n");

const nome = entrada.question("Nome: ")
const data = entrada.questionInt("Data de Nascimento: ")

const calculo = (2026 - {data});

console.log(`\nA idade do candidato é ${nome} é ${calculo}`);

if (calculo >= 16) {
    console.log("Você pode votar! Tire seu titulo de eleitor quando quiser 😊");
} else if (calculo < 16) {
    console.log("Você ainda não tem a idade minima para votar! Tente novamente daqui a alguns anos 🫤");
} else {
    console.log("Por favor, digite um numero valido!");
}

