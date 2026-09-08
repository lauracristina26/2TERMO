const entrada = require("readline-sync");

console.log("===================");
console.log("CLASSIFIÇÃO DE ATLETA");
console.log("===================\n");

const idade = entrada.questionInt("Idade do atleta: ");

if (idade >= 5  <= 10) {
    console.log("CLASSIFICAÇÃO: Infantil!");
} 
else if (idade >= 11 && idade <= 17) {
    console.log("CLASSIFICAÇÃO: Juvenil!");
} 
else if (idade >=18 && idade <= 60) {
    console.log("CLASSIFICAÇÃO: Adulto!");
} 
else {
    console.log("CLASSIFICAÇÃO: Sênior!")
}
console.log("=========================");