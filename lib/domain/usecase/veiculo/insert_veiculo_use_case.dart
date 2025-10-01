import 'package:jupyter/domain/entities/veiculo.dart';
import 'package:jupyter/domain/repositories/veiculo_repository.dart';

class InsertVeiculoUseCase {
  final VeiculoRepository _repository;

  InsertVeiculoUseCase(this._repository);

  Future<void> call(Veiculo veiculo) async {
    await _repository.insertVeiculo(veiculo);
  }
}
