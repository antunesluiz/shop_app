import 'package:flutter/cupertino.dart';
import 'package:shop_app/models/user.dart';

class RegisterProvider with ChangeNotifier {
  late User _user;

  get user => _user;

  void setUser(User user) {
    _user = user;

    notifyListeners();
  }
}
