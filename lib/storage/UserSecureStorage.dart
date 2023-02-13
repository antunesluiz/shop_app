import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shop_app/models/user.dart';
import 'dart:convert';

class UserSecureStorage {
  static final FlutterSecureStorage _storage = FlutterSecureStorage();

  static const String _keyUser = 'user';

  static Future setUser(dynamic user) async =>
      await _storage.write(key: _keyUser, value: json.encode(user.toJson()));

  static Future<User?> getUser() async {
    String? storage = await _storage.read(key: _keyUser);

    return storage != null ? User.fromJson(json.decode(storage)) : null;
  }
}
