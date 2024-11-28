import '../../data/repo/auth_repo.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';


class AuthUseCases {
  final AuthRepository repository;
  final FlutterSecureStorage secureStorage = const FlutterSecureStorage();

  

  AuthUseCases(this.repository);

  Future<String?> signUp(String email, String password) {
    return repository.signUp(email, password);
  }

  Future<String?> logIn(String email, String password) {
    return repository.logIn(email, password);
  }

  Future<String?> logOut() {
    return repository.logOut();
  }

  


}

