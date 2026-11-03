const fs = require('fs');

console.log("=== SISTEMA DE PERSISTENCIA: LEITURA DE MAQUINAS ===");

const nomeDoArquivo = "maquinas.json";

if (!fs.existsSync(nomeDoArquivo)) {
  console.error(`Erro: o arquivo '${nomeDoArquivo} nao foi encontrado`)
};

const conteudoTexto = fs.readFileSync(nomeDoArquivo, 'utf-8');

const maquinasRecuperadas = JSON.parse(conteudoTexto);

function buscarPorId(maquinas, id) {
  return maquinas.find((maquina) => maquina.id === id); //encontrar uma maquina; vai retornar exatamente o id que foi pedido; PROCURAR
}

function filtrarPorStatus(maquinas, status) {
  return maquinas.filter((maquina) => maquina.status === status); //filtrar as maquinas que se encontram na categoria desejada; CLASSIFICAR
}

console.log("Dados carregados com sucesso:\n");
console.table(maquinasRecuperadas);

console.log(`\nTotal de maquinas cadastradas: ${maquinasRecuperadas.length}`);
console.log(`Primeira maquina da lista: ${maquinasRecuperadas[0].nome}`);

function exercutar() {
      console.log(`\n=== Busca pelo ID 3 ===`);
      console.table(buscarPorId(maquinasRecuperadas, 3) ?? 'Maquina nao encontrada'); // ?? = if

      console.log(`\n=== MAQUINAS EM MANUTENCAO ===`);
      console.table(filtrarPorStatus(maquinasRecuperadas, 'manutencao'));
}
exercutar()