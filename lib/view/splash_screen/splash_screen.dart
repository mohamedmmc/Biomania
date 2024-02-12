import 'package:Biomania2/view/splash_screen/splash_screen_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/time_progress_bar.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<SplashScreenController>(
        builder: (controller) => Stack(
          children: [
            const Image(
              image: AssetImage('assets/images/splashscreen.png'),
              fit: BoxFit.cover,
              height: 1000,
            ),
            Opacity(
              opacity: 0.84,
              child: Container(height: 1000, color: Colors.black),
            ),
            const Center(
              child: Image(image: AssetImage('assets/images/logo.png'), fit: BoxFit.cover),
            ),
            Positioned(
              bottom: 100, // Adjust this value as needed
              left: 0,
              right: 0,
              child: Center(
                child: SizedBox(
                  width: Get.width * 0.3,
                  child: TimeProgressBar(
                    duration: controller.duration,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
