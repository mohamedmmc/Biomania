import 'package:Biomania2/constant/app_fonts.dart';
import 'package:Biomania2/constant/colors.dart';
import 'package:Biomania2/view/mission/components/plan_hour.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constant/constants.dart';
import '../../../widgets/custom_buttons.dart';
import '../../../widgets/custom_image_card.dart';
import '../../../widgets/custom_text_field.dart';
import '../mission_controller.dart';

class PlanDate extends StatefulWidget {
  static int indexValue = 0;
  final MissionController controller;

  const PlanDate({Key? key, required this.controller}) : super(key: key);

  @override
  State<PlanDate> createState() => _PlanDateState();
}

class _PlanDateState extends State<PlanDate> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(AppConstants.yourCommande, style: AppFonts.x30Bold),
          Text(AppConstants.planifie,
              style: AppFonts.x20Bold.copyWith(color: kBlackColor)),
          const SizedBox(height: 40),
          CustomImageCard(
            image: 'assets/images/splashscreen.png',
            title: 'maintenant',
            width: Get.width,
            height: 150,
          ),
          const SizedBox(
            height: 40,
          ),
          Text(
            AppConstants.planifier,
            style: AppFonts.x20Bold.copyWith(color: kBlackColor),
          ),
          const SizedBox(
            height: 100,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            CustomTextField(
              width: 100,
              height: 120,
              textFontSize: 30,
              textInputType: TextInputType.number,
              textStyle: AppFonts.x20Bold.copyWith(color: kBlackColor),
            ),
            CustomTextField(
              width: 100,
              height: 120,
              textFontSize: 30,
              textInputType: TextInputType.number,
              textStyle: AppFonts.x20Bold.copyWith(color: kBlackColor),
            ),
            CustomTextField(
              width: 100,
              height: 120,
              textFontSize: 30,
              textInputType: TextInputType.number,
              textStyle: AppFonts.x20Bold.copyWith(color: kBlackColor),
            ),
          ]),
          const SizedBox(
            height: 60,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CustomButton(
                radius: 35,
                height: 90,
                backgroundColor: backButton,
                titleColor: Colors.black,
                onPressed: () {
                  widget.controller.navigateToHomeScreen;
                }, //controller.navigateToInscription,
                icon: Icons.chevron_left_sharp,
              ),
              CustomButton(
                radius: 35,
                height: 90,
                backgroundColor: Colors.black,
                titleColor: Colors.white,
                onPressed: () {
                  widget.controller.changeTab(PlanHour.indexValue);
                }, //controller.login,
                icon: Icons.done,
              )
            ],
          ),
        ],
      ),
    );
  }
}
