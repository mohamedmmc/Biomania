import 'package:Biomania2/constant/app_fonts.dart';
import 'package:Biomania2/constant/colors.dart';
import 'package:Biomania2/view/mission/components/besoins.dart';
import 'package:Biomania2/view/mission/components/plan_hour.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constant/constants.dart';
import '../../../widgets/custom_buttons.dart';
import '../../../widgets/custom_image_card.dart';
import '../../../widgets/custom_text_field.dart';
import '../mission_controller.dart';

class TypeLogement extends StatefulWidget {
  static int indexValue = 2;
  final MissionController controller;

  const TypeLogement({Key? key, required this.controller}) : super(key: key);

  @override
  State<TypeLogement> createState() => _PlanDateState();
}

class _PlanDateState extends State<TypeLogement> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(AppConstants.yourCommande, style: AppFonts.x30Bold),
          Text(AppConstants.ajoutezVosRenseignements,
              style: AppFonts.x20Bold.copyWith(color: kBlackColor)),
          const SizedBox(height: 40),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(AppConstants.typeDeLogement,
                style: AppFonts.x20Bold.copyWith(color: kBlackColor)),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomImageCard(
                image: 'assets/images/splashscreen.png',
                title: 'Domicile',
                width: Get.width / 2.5,
                height: 130,
              ),
              CustomImageCard(
                image: 'assets/images/splashscreen.png',
                title: 'Entreprise',
                width: Get.width / 2.5,
                height: 130,
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              AppConstants.Superficie,
              style: AppFonts.x20Bold.copyWith(color: kBlackColor),
            ),
          ),
          CustomTextField(
            width: Get.width,
            height: 150,
            textFontSize: 30,
            textInputType: TextInputType.number,
            textAlign: TextAlign.center,
            textStyle: AppFonts.x20Bold.copyWith(color: kSelectedColor),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              AppConstants.NombreDePiece,
              style: AppFonts.x20Bold.copyWith(color: kBlackColor),
            ),
          ),
          CustomTextField(
            width: Get.width,
            height: 150,
            textFontSize: 30,
            textAlign: TextAlign.center,
            textInputType: TextInputType.number,
            textStyle: AppFonts.x20Bold.copyWith(color: kBlackColor),
          ),
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
                  widget.controller.changeTab(PlanHour.indexValue);
                }, //controller.navigateToInscription,
                icon: Icons.chevron_left_sharp,
              ),
              CustomButton(
                radius: 35,
                height: 90,
                backgroundColor: Colors.black,
                titleColor: Colors.white,
                onPressed: () {
                  widget.controller.changeTab(Besoins.indexValue);
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
