import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shop_app/models/user.dart';

class ApiServices {
  http.Client? client;

  ApiServices() {
    client = http.Client();
  }

  Future<User> login({String? email, String? password}) async {
    Uri url = Uri.parse('https://reqres.in/api/login');

    try {
      http.Response response = await client!.post(
        url,
        body: {'email': email!.trim(), 'password': password!.trim()},
      );

      if (response.statusCode == 200 || response.statusCode == 400) {
        return User.fromJson(json.decode(response.body));
      } else {
        throw Exception('Erro ao carregar os dados');
      }
    } on Exception catch (e) {
      throw Exception(e);
    }
  }

  void close() {
    client!.close();
  }
}
