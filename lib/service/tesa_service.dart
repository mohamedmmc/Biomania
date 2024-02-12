
import 'package:Biomania2/model/user.dart';
import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';
import 'package:get/get.dart';

import 'shared_preferences.dart';

class TesaService extends GetxService {
  static TesaService get find => Get.find<TesaService>();

  UserModel? get currentUser => SharedPreferencesService.find.get('token') != null ? UserModel.fromJson(JWT.decode(SharedPreferencesService.find.get('token')!).payload) : null;

  TesaService() {
    _init();
  }

  Future<void> _init() async {

  }
}
