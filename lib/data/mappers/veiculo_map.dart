import 'package:jupyter/data/model/veiculo_model.dart';
import 'package:jupyter/domain/entities/veiculo.dart';

class VeiculoMapper {
  static Veiculo toEntity(VeiculoModel model) {
    return Veiculo(
      id: model.id,
      placa: model.placa,
      renavam: model.renavam,
      chassi: model.chassi,
      cor: model.cor,
      marca: model.marca,
      modelo: model.modelo,
      anoFabricacao: model.anoFabricacao,
      anoModelo: model.anoModelo,
      combustivel: model.combustivel,
      categoria: model.categoria,
      locadora: model.locadora,
      situacao: model.situacao,
      dataAquisicao: model.dataAquisicao,
      dataVenda: model.dataVenda,
      kmAtual: model.kmAtual,
      kmUltimaRevisao: model.kmUltimaRevisao,
      dataUltimaRevisao: model.dataUltimaRevisao,
    );
  }

  static VeiculoModel toModel(Veiculo entity) {
    return VeiculoModel(
      id: entity.id,
      placa: entity.placa,
      renavam: entity.renavam,
      chassi: entity.chassi,
      cor: entity.cor,
      marca: entity.marca,
      modelo: entity.modelo,
      anoFabricacao: entity.anoFabricacao,
      anoModelo: entity.anoModelo,
      combustivel: entity.combustivel,
      categoria: entity.categoria,
      locadora: entity.locadora,
      situacao: entity.situacao,
      dataAquisicao: entity.dataAquisicao,
      dataVenda: entity.dataVenda,
      kmAtual: entity.kmAtual,
      kmUltimaRevisao: entity.kmUltimaRevisao,
      dataUltimaRevisao: entity.dataUltimaRevisao,
    );
  }

  static Veiculo? toEntityOrNull(VeiculoModel? model) {
    if (model == null) return null;
    return toEntity(model);
  }
}
