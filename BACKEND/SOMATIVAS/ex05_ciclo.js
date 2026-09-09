const entrada = require('readline-sync');

const pecasCiclo = entrada.questionInt("Pecas produzidas por ciclo: ");

for (let i = 1; i <=10; ++i) {
    console.log(`Ciclo ${i} = ${pecasCiclo}`);
}