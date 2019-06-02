import 'package:Fluttery/data/model/gitter_message.dart';
import 'package:Fluttery/data/model/gitter_user.dart';
import 'package:Fluttery/data/remote/gitter_api.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GitterRepository {
  static const PREF_GITTER_CODE = "GITTER_CODE";
  static const PREF_GITTER_ACCESS_TOKEN = "GITTER_ACCESS_TOKEN";

  final GitterAPI _api;
  String _accessToken;

  bool hasToken() => _accessToken != null;

  Future<void> setToken(String token) {
    _accessToken = token;
    return SharedPreferences.getInstance().then((pref) {
      return pref.setString(PREF_GITTER_ACCESS_TOKEN, token);
    });
  }

  Future<void> initToken() {
    return SharedPreferences.getInstance().then((pref) {
      _accessToken = pref.getString(PREF_GITTER_ACCESS_TOKEN);
    });
  }

  Future<dynamic> exchangeToken(String code) => _api.getToken(code);

  Future<List<GitterMessage>> getMessages() => _api.getMessages();

  Future<GitterUser> getCurrentUser() =>
      _accessToken != null ? _api.getUser(_accessToken) : null;

  // Singleton
  static final GitterRepository _gitterRepo = GitterRepository._internal();

  factory GitterRepository() {
    return _gitterRepo;
  }

  GitterRepository._internal() : _api = GitterAPI();
}
