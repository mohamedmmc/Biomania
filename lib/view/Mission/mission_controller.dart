import 'package:Biomania2/repository/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MissionController extends GetxController
    with GetSingleTickerProviderStateMixin {
  static String routeName = '/mission';
  late final tabController = TabController(length: 5, vsync: this);

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  Future<void> setBool(String key, bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool(key, value);
  }

  Future<void> navigateToInscription() async {
    Get.toNamed("inscription");
  }

  Future<void> login() async {
    if (formKey.currentState!.validate()) {
      final String? token = await UserRepository.find.login(
          email: emailController.text, password: passwordController.text);
      Get.toNamed("/home");
    }
  }

  void changeTab(int index) {
    switch (index) {
      case 0:
        tabController.animateTo(index);
        update();
      case 1:
        tabController.animateTo(index);
        update();
      case 2:
        tabController.animateTo(index);
        update();
      case 3:
        tabController.animateTo(index);
        update();
    }
  }

  Future<void> navigateToHomeScreen() async {
    Get.toNamed("home");
  }
}
