import 'package:Biomania2/repository/user_repository.dart';
import 'package:Biomania2/view/home/home_controller.dart';
import 'package:Biomania2/view/home/home_screen.dart';
import 'package:Biomania2/view/inscription/inscription_controller.dart';
import 'package:Biomania2/view/inscription/inscription_screen.dart';
import 'package:Biomania2/view/login/login_controller.dart';
import 'package:Biomania2/view/splash_screen/splash_screen.dart';
import 'package:Biomania2/view/splash_screen/splash_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: InitialBindings(),
      debugShowCheckedModeBanner: false,
      title: 'Biomania',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SplashScreen(),
      getPages: [
        GetPage(
          name: InscriptionController.routeName,
          page: () => const InscriptionScreen(),
          binding: BindingsBuilder.put(() => InscriptionController()),
        ),
        GetPage(
          name: HomeController.routeName,
          page: () => const HomeScreen(),
          binding: BindingsBuilder.put(() => HomeController()),
        )
      ],
    );
  }
}

class InitialBindings implements Bindings {
  @override
  void dependencies() {
    // Add the main application controller/services here for initialisation into the GetX store
    Get.lazyPut(() => SplashScreenController());
    Get.lazyPut(() => LoginController());
    Get.put<UserRepository>(UserRepository(), permanent: true);
  }
}