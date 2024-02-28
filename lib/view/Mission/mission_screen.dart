import 'package:Biomania2/constant/colors.dart';
import 'package:Biomania2/helper/form_validators.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constant/app_fonts.dart';
import '../../constant/constants.dart';
import '../../constant/sizes.dart';
import '../../widgets/custom_buttons.dart';
import '../../widgets/custom_text_field.dart';
import 'components/plan_date.dart';
import 'mission_controller.dart';

class MissionScreen extends StatelessWidget {
  const MissionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //FocusNode _focusNode = FocusNode();
    return GetBuilder<MissionController>(
      builder: (controller) => Scaffold(
        body: Padding(
          padding: const EdgeInsets.fromLTRB(Paddings.exceptional, 50, Paddings.exceptional, 0),
          child: SizedBox(
            child: TabBarView(
              controller: controller.tabController,
              // physics: const NeverScrollableScrollPhysics(),
              children: [
                PlanDate(),
                PlanDate(),
                PlanDate(),
                PlanDate(),
                PlanDate(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
