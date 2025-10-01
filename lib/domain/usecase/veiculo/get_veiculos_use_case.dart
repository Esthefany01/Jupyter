import 'package:jupyter/domain/entities/veiculo.dart';
import 'package:jupyter/domain/repositories/veiculo_repository.dart';

class GetVeiculosUseCase {
  final VeiculoRepository _repository;

  GetVeiculosUseCase(this._repository);

  Future<List<Veiculo>> call() async {
    return await _repository.getAllVeiculos();
  }
}
