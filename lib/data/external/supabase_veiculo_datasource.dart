import 'package:jupyter/data/model/veiculo_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseVeiculoDatasource {
  final SupabaseClient _client;

  SupabaseVeiculoDatasource(this._client);

  Future<List<VeiculoModel>> fetchVeiculos() async {
    final response = await _client.from('veiculos').select();
    return (response as List).map((map) => VeiculoModel.fromMap(map)).toList();
  }

  Future<VeiculoModel> insertVeiculo(VeiculoModel veiculo) async {
    final response = await _client.from('veiculos').insert(veiculo.toMapInsert()).select().single();

    return VeiculoModel.fromMap(response);
  }

  Future<VeiculoModel> updateVeiculo(VeiculoModel veiculo) async {
    final response = await _client.from('veiculos').insert(veiculo.toMapUpdate()).select().single();

    return VeiculoModel.fromMap(response);
  }
}
