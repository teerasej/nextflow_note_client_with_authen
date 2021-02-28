import 'package:dio/dio.dart';

class Connection {
  static String endpoint = 'https://note-api.azurewebsites.net';

  static Dio getDio() {
    var options = BaseOptions(
      baseUrl: Connection.endpoint,
      connectTimeout: 10000,
    );

    var dioClient = Dio(options);
    return dioClient;
  }
}
