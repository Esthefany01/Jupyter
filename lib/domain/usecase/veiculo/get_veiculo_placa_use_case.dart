import 'package:jupyter/domain/entities/veiculo.dart';
import 'package:jupyter/domain/repositories/veiculo_repository.dart';

class GetVeiculoPlacaUseCase {
  final VeiculoRepository _repository;

  GetVeiculoPlacaUseCase(this._repository);

  Future<Veiculo?> call(String placa) async {
    return await _repository.buscarPorPlaca(placa);
  }
}
