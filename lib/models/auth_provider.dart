import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier {
  String? currentUserRole;

  bool login(String username, String password) {
    if (username == 'admin' && password == 'admin123') {
      currentUserRole = 'admin';
      notifyListeners();
      return true;
    } else if (username == 'operator' && password == 'operator123') {
      currentUserRole = 'operator';
      notifyListeners();
      return true;
    }
    return false;
  }

  void logout() {
    currentUserRole = null;
    notifyListeners();
  }
}
