import 'package:jupyter/data/model/veiculo_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class VeiculoDao {
  final SupabaseClient _client;

  VeiculoDao(this._client);

  Future<List<VeiculoModel>> getAllVeiculos() async {
    final response = await _client.from('veiculos').select();
    return (response as List).map((e) => VeiculoModel.fromMap(e)).toList();
  }

  Future<void> insertVeiculo(VeiculoModel veiculo) async {
    await _client.from('veiculos').insert(veiculo.toMapInsert());
  }

  Future<void> updateVeiculo(VeiculoModel veiculo) async {
    await _client.from('veiculos').update(veiculo.toMapUpdate()).eq('id', veiculo.id ?? "");
  }

  Future<VeiculoModel?> buscarPorPlaca(String placa) async {
    final response = await _client.from('veiculos').select().eq('placa', placa).maybeSingle();

    return response == null ? null : VeiculoModel.fromMap(response);
  }

  Future<void> deleteVeiculo(String placa) async {
    await _client.from('veiculos').delete().eq('placa', placa);
  }
}
