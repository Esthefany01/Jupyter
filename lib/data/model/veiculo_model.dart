class VeiculoModel {
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

  VeiculoModel({
    this.id,
    required this.placa,
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

  factory VeiculoModel.fromMap(Map<String, dynamic> map) {
    return VeiculoModel(
      id: map['id'],
      placa: map['placa'],
      renavam: map['renavam'],
      chassi: map['chassi'],
      cor: map['cor'],
      marca: map['marca'],
      modelo: map['modelo'],
      anoFabricacao: map['ano_fabricacao'],
      anoModelo: map['ano_modelo'],
      combustivel: map['combustivel'],
      categoria: map['categoria'],
      locadora: map['locadora'],
      situacao: map['situacao'],
      dataAquisicao: map['data_aquisicao'] != null ? DateTime.parse(map['data_aquisicao']) : null,
      dataVenda: map['data_venda'] != null ? DateTime.parse(map['data_venda']) : null,
      kmAtual: map['km_atual'],
      kmUltimaRevisao: map['km_ultima_revisao'],
      dataUltimaRevisao: map['data_ultima_revisao'] != null ? DateTime.parse(map['data_ultima_revisao']) : null,
    );
  }

  /// Para inserção, normalmente não enviamos o `id` (o banco gera)
  Map<String, dynamic> toMapInsert() {
    return {
      'placa': placa,
      'renavam': renavam,
      'chassi': chassi,
      'cor': cor,
      'marca': marca,
      'modelo': modelo,
      'ano_fabricacao': anoFabricacao,
      'ano_modelo': anoModelo,
      'combustivel': combustivel,
      'categoria': categoria,
      'locadora': locadora,
      'situacao': situacao,
      'data_aquisicao': dataAquisicao?.toIso8601String(),
      'data_venda': dataVenda?.toIso8601String(),
      'km_atual': kmAtual,
      'km_ultima_revisao': kmUltimaRevisao,
      'data_ultima_revisao': dataUltimaRevisao?.toIso8601String(),
    };
  }

  /// Para update, geralmente enviamos todos os campos (exceto `id`)
  Map<String, dynamic> toMapUpdate() {
    return toMapInsert();
  }

  /// Caso queira enviar tudo (útil em alguns cenários)
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      ...toMapInsert(),
    };
  }
}
