class Veiculo {
  final String? id;
  final String placa;
  final String? renavam;
  final String? chassi;
  final String? cor;
  final String? marca;
  final String? modelo;
  final int? anoFabricacao;
  final int? anoModelo;
  final String? combustivel;
  final String? categoria;
  final String? locadora;
  final String? situacao;
  final DateTime? dataAquisicao;
  final DateTime? dataVenda;
  final int? kmAtual;
  final int? kmUltimaRevisao;
  final DateTime? dataUltimaRevisao;

  Veiculo({
    required this.placa,
    this.id,
    this.renavam,
    this.chassi,
    this.cor,
    this.marca,
    this.modelo,
    this.anoFabricacao,
    this.anoModelo,
    this.combustivel,
    this.categoria,
    this.locadora,
    this.situacao,
    this.dataAquisicao,
    this.dataVenda,
    this.kmAtual,
    this.kmUltimaRevisao,
    this.dataUltimaRevisao,
  });
}
