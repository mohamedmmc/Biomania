import 'package:Biomania2/view/inscription/components/user_type.dart';
import 'package:flutter/material.dart';

import '../../../constant/app_fonts.dart';
import '../../../constant/colors.dart';
import '../../../constant/constants.dart';
import '../../../constant/sizes.dart';
import '../../../widgets/custom_button_icon.dart';
import '../../../widgets/custom_buttons.dart';
import '../../../widgets/custom_circular_image_view.dart';
import '../inscription_controller.dart';
import 'inscription_company2.dart';

class InscriptionCompany extends StatefulWidget {
  static int indexValue = 3;
  final InscriptionController controller;

  const InscriptionCompany({Key? key, required this.controller}) : super(key: key);

  @override
  _PhoneDetailTabState createState() => _PhoneDetailTabState();
}

class _PhoneDetailTabState extends State<InscriptionCompany> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
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
                Text(AppConstants.completeAccountTitle, textAlign: TextAlign.center, style: AppFonts.x30Bold),
                const SizedBox(height: 8.0),
                Text(AppConstants.completeAccountSubtitle, style: AppFonts.x12Regular),
                const SizedBox(height: 60.0),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CustomButtonIcon(
                    height: 60,
                    title: AppConstants.identityCard,
                    backgroundColor: kGrey,
                    titleColor: Colors.black,
                    onPressed: () async {
                      widget.controller.setImage(widget.controller.identityCardFile);
                    },
                    isSelected: widget.controller.identityCardFile.value != null),
                const SizedBox(height: 16.0),
                CustomButtonIcon(
                    height: 60,
                    title: AppConstants.identityPhoto,
                    backgroundColor: kGrey,
                    titleColor: Colors.black,
                    onPressed: () {
                      widget.controller.setImage(widget.controller.identityPhotoFile);
                    },
                    isSelected: widget.controller.identityPhotoFile.value != null),
                const SizedBox(height: 16.0),
                CustomButtonIcon(
                    height: 60,
                    title: AppConstants.driverLicense,
                    backgroundColor: kGrey,
                    titleColor: Colors.black,
                    onPressed: () async {
                      widget.controller.setImage(widget.controller.driverLicenseFile);
                    },
                    isSelected: widget.controller.driverLicenseFile.value != null),
                const SizedBox(height: 16.0),
                CustomButtonIcon(
                    height: 60,
                    title: AppConstants.rib,
                    backgroundColor: kGrey,
                    titleColor: Colors.black,
                    onPressed: () async {
                      widget.controller.setImage(widget.controller.ribFile);
                    },
                    isSelected: widget.controller.ribFile.value != null),
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(Paddings.regular),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CustomButton(
                        radius: 35,
                        height: 90,
                        backgroundColor: kGrey,
                        titleColor: Colors.black,
                        onPressed: () {
                          widget.controller.changeTab(index: UserType.indexValue);
                        },
                        icon: Icons.chevron_left_sharp,
                      ),
                      CustomButton(
                        radius: 35,
                        height: 90,
                        backgroundColor: Colors.black,
                        titleColor: Colors.white,
                        onPressed: () async {
                          widget.controller.changeTab(index: InscriptionCompany2.indexValue);
                        },
                        icon: Icons.done,
                      )
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
