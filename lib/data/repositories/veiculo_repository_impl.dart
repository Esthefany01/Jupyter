import 'package:jupyter/data/database/dao/veiculo_dao.dart';
import 'package:jupyter/data/mappers/veiculo_map.dart';
import 'package:jupyter/domain/entities/veiculo.dart';
import 'package:jupyter/domain/repositories/veiculo_repository.dart';

import 'package:flutter/foundation.dart';

class VeiculoRepositoryImpl implements VeiculoRepository {
  final VeiculoDao _dao;

  VeiculoRepositoryImpl(this._dao);

  @override
  Future<Veiculo?> buscarPorPlaca(String placa) async {
    try {
      final responseModel = await _dao.buscarPorPlaca(placa);
      return VeiculoMapper.toEntityOrNull(responseModel);
    } catch (e, stack) {
      debugPrint("Erro ao buscar veículo por placa: $e\n$stack");
      throw Exception("Erro ao buscar veículo. Tente novamente.");
    }
  }

  @override
  Future<List<Veiculo>> getAllVeiculos() async {
    try {
      final responseModel = await _dao.getAllVeiculos();
      return responseModel.map((e) => VeiculoMapper.toEntity(e)).toList();
    } catch (e, stack) {
      debugPrint("Erro ao listar veículos: $e\n$stack");
      throw Exception("Erro ao carregar veículos.");
    }
  }

  @override
  Future<void> insertVeiculo(Veiculo veiculo) async {
    try {
      final veiculoToModel = VeiculoMapper.toModel(veiculo);
      await _dao.insertVeiculo(veiculoToModel);
    } catch (e, stack) {
      debugPrint("Erro ao inserir veículo: $e\n$stack");
      throw Exception("Erro ao salvar veículo.");
    }
  }

  @override
  Future<void> updateVeiculo(Veiculo veiculo) async {
    try {
      final veiculoToModel = VeiculoMapper.toModel(veiculo);
      await _dao.updateVeiculo(veiculoToModel);
    } catch (e, stack) {
      debugPrint("Erro ao atualizar veículo: $e\n$stack");
      throw Exception("Erro ao atualizar veículo.");
    }
  }

  @override
  Future<void> deleteVeiculo(String placa) async {
    try {
      return await _dao.deleteVeiculo(placa);
    } catch (e, stack) {
      debugPrint("Erro ao deletar veículo: $e\n$stack");
      throw Exception("Erro ao deletar veículo.");
    }
  }
}
