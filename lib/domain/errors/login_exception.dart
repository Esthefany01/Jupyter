class LoginFailure implements Exception {
  final String message;
  LoginFailure({required this.message});

  @override
  String toString() => 'LoginFailure: $message';
}

class RegisterFailure implements Exception {
  final String message;
  RegisterFailure({required this.message});

  @override
  String toString() => 'RegisterFailure: $message';
}

class LogoutFailure implements Exception {
  final String message;
  LogoutFailure({required this.message});

  @override
  String toString() => 'LogoutFailure: $message';
}
