import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shop_app/models/user.dart';
import 'package:shop_app/themes/strings.dart';

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

  Future<User> register({User? user}) async {
    print(AppStrings.kRegisterUrl);
    Uri url = Uri.parse(AppStrings.kRegisterUrl);

    try {
      http.Response response = await client!.post(
        url,
        body: {
          'email': user!.email!.trim(),
          'password': user.password!.trim(),
        },
      );

      Map<String, dynamic> result = json.decode(response.body);

      if (response.statusCode == 200) {
        return User.fromJson(result['data']['user']);
      } else if (response.statusCode == 402) {
        return User.fromJson(result);
      }

      throw Exception('Erro na requisição');
    } on Exception catch (e) {
      print(e);
      throw Exception(e);
    }
  }

  Future<User> completeProfile({User? user}) async {
    print(AppStrings.kCompleteProfileUrl);
    Uri url = Uri.parse(AppStrings.kCompleteProfileUrl);

    try {
      http.Response response = await client!.post(
        url,
        body: {
          'id': user!.id.toString(),
          'first_name': user.firstName!.trim(),
          'last_name': user.lastName!.trim(),
          'phone': user.phone!.trim(),
          'token': user.token!.trim(),
          'address': user.address!.trim(),
        },
      );

      Map<String, dynamic> result = json.decode(response.body);

      if (response.statusCode == 200) {
        return User.fromJson(result['data']['user']);
      } else if (response.statusCode == 402) {
        return User.fromJson(result);
      }

      throw Exception('Erro na requisição');
    } on Exception catch (e) {
      print(e);
      throw Exception(e);
    }
  }

  void close() {
    client!.close();
  }
}
