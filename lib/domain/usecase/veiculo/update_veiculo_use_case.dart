import 'package:jupyter/domain/entities/veiculo.dart';
import 'package:jupyter/domain/repositories/veiculo_repository.dart';

class UpdateVeiculoUseCase {
  final VeiculoRepository _repository;

  UpdateVeiculoUseCase(this._repository);

  Future<void> call(Veiculo veiculo) async {
    await _repository.updateVeiculo(veiculo);
  }
}
