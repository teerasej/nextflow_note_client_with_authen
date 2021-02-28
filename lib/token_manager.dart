import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class TokenManager {
  static final storage = new FlutterSecureStorage();

  static String userToken;

  static Future<bool> isTokenExist() async {
    var token = await storage.read(key: 'token');

    if (token != null && token.isNotEmpty) {
      userToken = token;
      return true;
    } else {
      return false;
    }
  }

  static Future<String> getToken() async {
    var token = await storage.read(key: 'token');
    userToken = token;
    return token;
  }

  static Future<void> saveToken(String token) async {
    await storage.write(key: 'token', value: token);
  }
}
