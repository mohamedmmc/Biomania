import 'package:Biomania2/constant/enums.dart';
import 'package:flutter/material.dart';

import '../../../constant/app_fonts.dart';
import '../../../constant/colors.dart';
import '../../../constant/constants.dart';
import '../../../constant/sizes.dart';
import '../../../helper/form_validators.dart';
import '../../../widgets/custom_button_icon.dart';
import '../../../widgets/custom_buttons.dart';
import '../../../widgets/custom_circular_image_view.dart';
import '../../../widgets/custom_text_field.dart';
import '../inscription_controller.dart';
import 'inscription_company.dart';

class InscriptionCompany2 extends StatefulWidget {
  static int indexValue = 4;
  final InscriptionController controller;

  const InscriptionCompany2({Key? key, required this.controller}) : super(key: key);

  @override
  _PhoneDetailTabState createState() => _PhoneDetailTabState();
}

class _PhoneDetailTabState extends State<InscriptionCompany2> with AutomaticKeepAliveClientMixin {
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
                widget.controller.userTypeValue == UserTypeEnum.Societe.name
                    ? CustomTextField(
                        validator: FormValidators.notNullObjectValidator,
                        controller: widget.controller.matriculeFiscalController,
                        hintText: AppConstants.creerMatriculeFiscal,
                        textInputType: TextInputType.number,
                        textStyle: AppFonts.x16Regular.copyWith(color: kBlackColor),
                        hintStyle: AppFonts.x16Regular,
                        textCapitalization: TextCapitalization.none,
                        textInputAction: TextInputAction.done,
                        onSubmitted: (_) => FocusScope.of(context).unfocus(),
                      )
                    : widget.controller.userTypeValue == UserTypeEnum.Particulier.name
                        ? CustomTextField(
                            validator: FormValidators.notNullObjectValidator,
                            controller: widget.controller.passportController,
                            hintText: AppConstants.creerPasseport,
                            textInputType: TextInputType.emailAddress,
                            textStyle: AppFonts.x16Regular.copyWith(color: kBlackColor),
                            hintStyle: AppFonts.x16Regular,
                            textCapitalization: TextCapitalization.none,
                          )
                        : widget.controller.userTypeValue == UserTypeEnum.Societe.name
                            ? CustomTextField(
                                validator: FormValidators.notNullObjectValidator,
                                controller: widget.controller.numFreelancerController,
                                hintText: AppConstants.creerNumFreelancer,
                                textInputType: TextInputType.emailAddress,
                                textStyle: AppFonts.x16Regular.copyWith(color: kBlackColor),
                                hintStyle: AppFonts.x16Regular,
                                textCapitalization: TextCapitalization.none,
                              )
                            : const Text("aaaa"),
                CustomButtonIcon(
                    height: 60,
                    title: AppConstants.insurance,
                    backgroundColor: kGrey,
                    titleColor: Colors.black,
                    onPressed: () async {
                      widget.controller.setImage(widget.controller.insuranceFile);
                    },
                    isSelected: widget.controller.insuranceFile.value != null),
                const SizedBox(height: 16.0),
                CustomButtonIcon(
                    height: 60,
                    title: AppConstants.rcPro,
                    backgroundColor: kGrey,
                    titleColor: Colors.black,
                    onPressed: () async {
                      widget.controller.setImage(widget.controller.rcProFile);
                    },
                    isSelected: widget.controller.rcProFile.value != null),
                const SizedBox(height: 16.0),
                CustomButtonIcon(
                    height: 60,
                    title: AppConstants.policyholderCode,
                    backgroundColor: kGrey,
                    titleColor: Colors.black,
                    onPressed: () async {
                      widget.controller.setImage(widget.controller.policyholderCodeFile);
                    },
                    isSelected: widget.controller.policyholderCodeFile.value != null),
                const SizedBox(height: 16.0),
                CustomButtonIcon(
                    height: 60,
                    title: AppConstants.bioCleaningCertificate,
                    backgroundColor: kGrey,
                    titleColor: Colors.black,
                    onPressed: () async {
                      widget.controller.setImage(widget.controller.bioCleaningCertificateFile);
                    },
                    isSelected: widget.controller.bioCleaningCertificateFile.value != null),
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
                        onPressed: () async {
                          widget.controller.changeTab(index: InscriptionCompany.indexValue);
                        },
                        icon: Icons.chevron_left_sharp,
                      ),
                      CustomButton(
                        radius: 35,
                        height: 90,
                        backgroundColor: Colors.black,
                        titleColor: Colors.white,
                        onPressed: () async {
                          widget.controller.signUp();
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
