const fs = require('fs');

console.log("=== SISTEMA DE PERSISTENCIA: LEITURA DE MAQUINAS === ");

const nomeDoArquivo = "maquinas.json";

if (!fs.existsSync(nomeDoArquivo))  { //tratamento de erro
  console.error(`Erro: o arquivo '${nomeDoArquivo} nao foi encontrado`)
};

const conteudoTexto = fs.readFileSync(nomeDoArquivo, 'utf-8'); //para leitura, o uft-8 é para codificar para o idioma 

const maquinasRecuperadas = JSON.parse(conteudoTexto); //tradutor, devolvendo as informações que foram armazenadas

console.log("Dados carregados com sucesso:\n");
console.table(maquinasRecuperadas); //o console.table exibe uma tabela no terminal para o usuario

console.log(`\nTotal de maquinas cadastradas: ${maquinasRecuperadas.length}`);
console.log(`Primeira maquina da lista: ${maquinasRecuperadas[0].nome}`);