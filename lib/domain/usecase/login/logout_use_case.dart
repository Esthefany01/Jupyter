import 'package:jupyter/domain/repositories/login_repository.dart';

class LogoutUseCase {
  final LoginRepository _repository;

  LogoutUseCase(this._repository);

  Future<void> call() async {
    await _repository.logout();
  }
}
