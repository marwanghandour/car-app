import 'package:dio/dio.dart';

abstract class NetworkInfo {
  Future<bool> get isConnected;
}

class NetworkInfoImpl implements NetworkInfo {
  final Dio dio;

  NetworkInfoImpl(this.dio);

  @override
  Future<bool> get isConnected async {
    try {
      final response = await dio.get('https://www.google.com');
      return response.statusCode == 200;
    } catch (e) {
      return false;
    }
  }
}
