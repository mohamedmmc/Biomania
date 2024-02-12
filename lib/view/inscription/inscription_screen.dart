import 'package:Biomania2/view/inscription/components/inscription_company.dart';
import 'package:Biomania2/view/inscription/components/inscription_company2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constant/sizes.dart';
import 'components/personal_info.dart';
import 'components/phone_detail.dart';
import 'components/user_type.dart';
import 'inscription_controller.dart';

class InscriptionScreen extends StatelessWidget {
  const InscriptionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<InscriptionController>(
      builder: (controller) => GestureDetector(
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.fromLTRB(Paddings.exceptional, Paddings.exceptional, Paddings.exceptional, 0),
            child: TabBarView(
              controller: controller.tabController,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                PersonalInfoTab(controller: controller),
                PhoneDetailTab(controller: controller),
                UserType(controller: controller),
                InscriptionCompany(controller: controller),
                InscriptionCompany2(controller: controller),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
