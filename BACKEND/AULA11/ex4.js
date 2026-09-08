const entrada = require("readline-sync");

// Criando a "ferramenta" de conversão
function coverterParaFahrenheit(celsius) {
    let fehrenheit = (celsius * 9/5) + 32;
    return fehrenheit; // Devolve o resultado para quem chegou
}

const tempC = entrada.questionFloat("Digite a temperatura em Celsius: ");

//Chamando a função e guardando o que ela "cuspiu" de volta
const tempF = coverterParaFahrenheit(tempC);

console.log(`A temperatura convertida e: ${tempF.toFixed(1)} °F`);
