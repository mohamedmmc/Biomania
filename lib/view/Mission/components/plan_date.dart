import 'package:Biomania2/constant/app_fonts.dart';
import 'package:Biomania2/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constant/constants.dart';
import '../../../widgets/custom_buttons.dart';
import '../../../widgets/custom_image_card.dart';

class PlanDate extends StatelessWidget {
  const PlanDate({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(AppConstants.yourCommande, style: AppFonts.x30Bold),
        Text(AppConstants.planifie, style: AppFonts.x20Bold.copyWith(color: kBlackColor)),
        const SizedBox(height: 40),
        CustomImageCard(image: 'assets/images/splashscreen.png',title: 'maintenant',width: Get.width,height: 150,),
        const SizedBox(height: 40,),
        Text(AppConstants.planifier,style: AppFonts.x20Bold.copyWith(color: kBlackColor),),
        const SizedBox(height: 120,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CustomButton(
              radius: 35,
              height: 90,
              backgroundColor: backButton,
              titleColor: Colors.black,
              onPressed:(){} ,//controller.navigateToInscription,
              icon: Icons.chevron_left_sharp,
            ),
            CustomButton(
              radius: 35,
              height: 90,
              backgroundColor: Colors.black,
              titleColor: Colors.white,
              onPressed:(){} ,//controller.login,
              icon: Icons.done,
            )
          ],
        ),
      ],
    );
  }
}
