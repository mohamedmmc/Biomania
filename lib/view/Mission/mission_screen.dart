import 'package:Biomania2/constant/sizes.dart';
import 'package:Biomania2/view/mission/components/plan_date.dart';
import 'package:Biomania2/view/mission/components/plan_hour.dart';
import 'package:Biomania2/view/mission/components/type_logement.dart';
import 'package:Biomania2/view/mission/mission_controller.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../mission/components/besoins.dart';

class MissionScreen extends StatelessWidget {
  const MissionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //FocusNode _focusNode = FocusNode();
    return GetBuilder<MissionController>(
      builder: (controller) => GestureDetector(
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.fromLTRB(
                Paddings.exceptional, 50, Paddings.exceptional, 0),
            child: SizedBox(
              child: TabBarView(
                controller: controller.tabController,
                // physics: const NeverScrollableScrollPhysics(),
                children: [
                  PlanDate(controller: controller),
                  PlanHour(controller: controller),
                  TypeLogement(controller: controller),
                  Besoins(controller: controller),
                  PlanDate(controller: controller),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
