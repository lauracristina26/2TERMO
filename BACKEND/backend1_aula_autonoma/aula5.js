const readline = require("readline-sync");

const nomealuno = readline.question("Digite o nome do aluno: ");
const disciplinadesejada = readline.question("Digite a disciplina: ");
const idade = readline.question("Digite a idade do aluno: ");
const anoletivo = readline.question("Digite o ano letivo que o aluno esta: ");

const nota1 = Number(readline.question("Digite a primeira nota: "));
const nota2 = Number(readline.question("Digite a segunda nota: "));
const faltas = Number(readline.question("Digite a quantidade de faltas: "));

const media = (nota1 + nota2)  / 2;

console.log("\n Relatório Do Aluno");
console.log("Aluno:", nomealuno);
console.log("Disciplina:", disciplinadesejada);
console.log("Idade:", idade);
console.log("Ano Letivo:", anoletivo)
console.log("Nota 1:", nota1);
console.log("Nota 2:", nota2);
console.log("Média:", media);
console.log("Faltas:", faltas);