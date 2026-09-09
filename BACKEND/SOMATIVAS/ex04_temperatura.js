const entrada = require('readline-sync');

const temperatura = entrada.questionInt("Registre a temperatura: ");

if (temperatura >= 60) {
    console.log("situação NORMAL.");
} else if (temperatura <= 61 && temperatura >=80) {
    console.log("situação ATENÇÃO!");
} else {
    console.log("situação CRÍTICA!");
}

console.log(`Temperatura: ${temperatura} °C`)
