const entrada = require("readline-sync");

const preco = entrada.questionFloat("Valor da conta: ");

const desconto = ({preco} * (10/100));


if (preco => 100) {
    console.log(`O Valor do pagamento com desconto é de ${desconto.toFixed(2)}`);
} else if (preco < 100) {
    console.log(`O valor do pagamento é de ${preco.toFixed(2)}`);
} else {
    console.log("Coloco o preco para calcularmos o valor!");
}
