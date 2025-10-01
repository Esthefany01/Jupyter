import 'package:jupyter/domain/entities/veiculo.dart';

abstract class VeiculoRepository {
  Future<List<Veiculo>> getAllVeiculos();
  Future<void> insertVeiculo(Veiculo veiculo);
  Future<void> updateVeiculo(Veiculo veiculo);
  Future<Veiculo?> buscarPorPlaca(String placa);
  Future<void> deleteVeiculo(String placa);
}
