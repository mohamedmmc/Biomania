import 'package:Biomania2/repository/user_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController {
  static String routeName = '/';
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  Future<void> setBool(String key,bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool(key, value);
  }
  Future<void> navigateToInscription() async {
    Get.toNamed("inscription");
  }
  Future<void> login() async {
    if (formKey.currentState!.validate()) {
      final String? token = await UserRepository.find.login(email: emailController.text, password: passwordController.text);
      Get.toNamed("/home");
    }

  }
}