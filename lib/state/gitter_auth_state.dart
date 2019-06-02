import 'package:Fluttery/data/gitter_repository.dart';
import 'package:Fluttery/data/model/gitter_user.dart';
import 'package:flutter/material.dart';

class GitterAuthState extends ChangeNotifier {
  static const String TAG = "GitterAuthState: ";
  GitterRepository _repo = GitterRepository();

  GitterUser user;

  GitterAuthState() {
    authenticate();
  }

  void onClientAuthorized(String code) {
    _repo.exchangeToken(code).then((token) {
      _repo.setToken(token.data["access_token"]).then((_) {
        authenticate();
      });
    });
  }

  void authenticate() {
    _repo.initToken().then((_) {
      _repo.getCurrentUser().then((user) {
        this.user = user;
        notifyListeners();
      }).catchError((err) {
        print(TAG + "GET CURRENT USER " + err.toString());
      });
    }).catchError((err) {
      print(TAG + "INIT TOKEN " + err.toString());
    });
  }
}
