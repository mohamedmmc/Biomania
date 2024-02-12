import 'package:Biomania2/model/user.dart';
import 'package:get/get.dart';
import '../networking/api_base_helper.dart';

class UserRepository extends GetxService {
  static UserRepository get find => Get.find<UserRepository>();

  Future<String?> login({required String email, required String password}) async {
    final Map<String, String> loginData = {
      'email': email,
      'password': password,
    };
    final result = await ApiBaseHelper().request(RequestType.post, 'api/auth/login', body: loginData);

    return result['token'];
  }

  Future<UserModel?> signUp({required UserModel userModel}) async {
    UserModel? userModelResponse;

    final result = await ApiBaseHelper().request(RequestType.post, 'api/auth/register', body: userModel.toJson());
    userModelResponse = UserModel.fromJson(result);

    return userModelResponse;
  }
}
