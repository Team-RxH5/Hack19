import 'package:Fluttery/data/model/gitter_message.dart';
import 'package:Fluttery/data/remote/gitter_api.dart';

class GitterRepository {
  final GitterAPI _api;

  void setClientCode(String code) {}

  String getClientCode() {
    return null;
  }

  Future<List<GitterMessage>> getMessages() => _api.getMessages();

  // Singleton
  static final GitterRepository _gitterRepo = GitterRepository._internal();

  factory GitterRepository() {
    return _gitterRepo;
  }

  GitterRepository._internal() : _api = GitterAPI();
}
