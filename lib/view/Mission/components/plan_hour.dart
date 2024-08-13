import 'package:Biomania2/constant/app_fonts.dart';
import 'package:Biomania2/constant/colors.dart';
import 'package:Biomania2/view/mission/mission_controller.dart';
import 'package:Biomania2/view/mission/components/plan_date.dart';
import 'package:Biomania2/view/mission/components/type_logement.dart';
import 'package:Biomania2/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

import '../../../constant/constants.dart';
import '../../../widgets/custom_buttons.dart';

class PlanHour extends StatefulWidget {
  static int indexValue = 1;
  final MissionController controller;

  const PlanHour({Key? key, required this.controller}) : super(key: key);

  @override
  State<PlanHour> createState() => _PlanHourState();
}

class _PlanHourState extends State<PlanHour> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(AppConstants.yourCommande, style: AppFonts.x30Bold),
        Text(AppConstants.planifie,
            style: AppFonts.x20Bold.copyWith(color: kBlackColor)),
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
        Text(
          AppConstants.hour,
          style: AppFonts.x20Bold.copyWith(color: kBlackColor),
        ),
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          CustomTextField(
            width: 150,
            height: 150,
            textFontSize: 30,
            textInputType: TextInputType.number,
            textStyle: AppFonts.x20Bold.copyWith(color: kBlackColor),
          ),
          CustomTextField(
            width: 150,
            height: 150,
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
                widget.controller.changeTab(PlanDate.indexValue);
              }, //controller.navigateToInscription,
              icon: Icons.chevron_left_sharp,
            ),
            CustomButton(
              radius: 35,
              height: 90,
              backgroundColor: Colors.black,
              titleColor: Colors.white,
              onPressed: () {
                widget.controller.changeTab(TypeLogement.indexValue);
              }, //controller.login,
              icon: Icons.done,
            )
          ],
        ),
      ],
    );
  }
}
