import 'package:Fluttery/data/gitter_repository.dart';
import 'package:Fluttery/data/model/gitter_user.dart';
import 'package:flutter/material.dart';

class GitterAuthState extends ChangeNotifier {
  static const String TAG = "GitterAuthState: ";
  GitterRepository _repo = GitterRepository();

  GitterUser user;

  void onClientAuthorized(String code) {
    _repo.setClientCode(code);
    authenticate();
  }

  void authenticate() {
    final String code = _repo.getClientCode();
    if (code != null) {
      _getAuthorizationCode(code);
    } else {
      print(TAG + "Code not available");
    }
  }

  void _getAuthorizationCode(String code) {
    print(code);
  }
}
