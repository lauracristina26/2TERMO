const entrada = require("readline-sync");

console.log("------------------------------------");
console.log("SISTEMA DE ACESSO AO LABORATÓRIO");
console.log("------------------------------------\n");

const idade = entrada.questionInt("Idade do Aluno: ");
const autorizacao = entrada.question("Possui autorizacao?: ");
const acompanhante = entrada.question("Esta acompanhado de um professor?: ");


if(idade >=16 && autorizacao == true || acompanhante == true) {
   console.log("Acesso Liberado!");
}
else if (idade >=16 && autorizacao == true || acompanhante == false) {
   console.log("Acesso Liberado!")
}
else if (idade < 16 && autorizacao == false || acompanhante == true) {
   console.log("Acesso Liberado!")
}
else if (idade < 16 && autorizacao == false || acompanhante == false) {
   console.log("Acesso Negativo")
}
else {
   console.log("Por Favor, forneça uma informação válida")
}
