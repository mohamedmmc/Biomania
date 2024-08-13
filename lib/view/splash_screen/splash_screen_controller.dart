import 'package:get/get.dart';
import '../login/login_screen.dart';

class SplashScreenController extends GetxController {
  static const routeName = '/splash_screen';
  Duration duration = const Duration(seconds: 2);

  //delay with variable of time
  SplashScreenController() {
    Future.delayed(Duration(seconds: duration.inSeconds), () {
      Get.off(() => const LoginScreen());
    });
  }
}
