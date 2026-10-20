const entrada = require('readline-sync');
const fs = require('fs');

const quantidadeFerramentas = entrada.questionInt("Quantas ferramentas que deseja cadastrar? ");

const ferramentas = [];

for (let i = 0; i < quantidadeFerramentas; i++ ) {
  console.log(`\n Item ${i + 1} de ${quantidadeFerramentas}`);
  const nome = entrada.question("Nome da Ferramenta: ");
  const qtde = entrada.questionInt("Quantidade: ");
  const custoUnitario = entrada.questionFloat("Custo Unitario (R$): ");

  ferramentas.push({
    nome: nome,
    quantidade: qtde,
    custo: custoUnitario
  })
}

fs.writeFileSync('ferramentas.json', JSON.stringify(ferramentas, null, 2));

console.log(`\n==================================`);
console.log(`Sucesso: ${ferramentas.length} itens gravados em 'ferramentas.json`);
console.log(`=====================================`)
