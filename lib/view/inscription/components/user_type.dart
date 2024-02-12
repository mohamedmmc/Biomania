import 'package:Biomania2/view/inscription/components/phone_detail.dart';
import 'package:flutter/material.dart';

import '../../../constant/app_fonts.dart';
import '../../../constant/colors.dart';
import '../../../constant/constants.dart';
import '../../../constant/enums.dart';

import '../../../widgets/custom_buttons.dart';
import '../../../widgets/custom_circular_image_view.dart';
import '../inscription_controller.dart';
import 'inscription_company.dart';

class UserType extends StatefulWidget {
  static int indexValue = 2;
  final InscriptionController controller;

  const UserType({Key? key, required this.controller}) : super(key: key);

  @override
  _PhoneDetailTabState createState() => _PhoneDetailTabState();
}

class _PhoneDetailTabState extends State<UserType> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return SingleChildScrollView(
      child: Column(
        children: [
          Column(
            children: [
              const SizedBox(height: 40),
              CustomCircularImageView(
                imagePath: AppConstants.imagePath,
                height: 100.0,
                width: 100.0,
                fit: BoxFit.cover,
              ),
              const SizedBox(height: 40.0),
              Text(AppConstants.userTypeTitle, textAlign: TextAlign.center, style: AppFonts.x30Bold),
              const SizedBox(height: 8.0),
              Text(AppConstants.completeAccountSubtitle, style: AppFonts.x12Regular),
              const SizedBox(height: 60.0),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CustomButton(
                height: 60,
                title: AppConstants.userTypeIndividual,
                backgroundColor: kGrey,
                titleColor: Colors.black,
                onPressed: () async {
                  widget.controller.changeTab(index: InscriptionCompany.indexValue, userType: UserTypeEnum.Particulier);
                },
              ),
              const SizedBox(height: 16.0),
              CustomButton(
                height: 60,
                title: AppConstants.userTypeCompany,
                backgroundColor: kGrey,
                titleColor: Colors.black,
                onPressed: () {
                  widget.controller.changeTab(index: InscriptionCompany.indexValue, userType: UserTypeEnum.Societe);
                },
              ),
              const SizedBox(height: 16.0),
              CustomButton(
                height: 60,
                title: AppConstants.userTypeNormalUser,
                backgroundColor: kGrey,
                titleColor: Colors.black,
                onPressed: () async {
                  widget.controller.changeTab(index: InscriptionCompany.indexValue, userType: UserTypeEnum.client_normal);
                },
              ),
              const SizedBox(
                height: 40,
              ),
              CustomButton(
                radius: 35,
                height: 90,
                backgroundColor: kGrey,
                titleColor: Colors.black,
                onPressed: () {
                  widget.controller.changeTab(index: PhoneDetailTab.indexValue);
                },
                icon: Icons.chevron_left_sharp,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
