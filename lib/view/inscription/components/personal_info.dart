import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../constant/app_fonts.dart';
import '../../../constant/colors.dart';
import '../../../constant/constants.dart';
import '../../../constant/sizes.dart';
import '../../../helper/form_validators.dart';
import '../../../widgets/custom_buttons.dart';
import '../../../widgets/custom_circular_image_view.dart';
import '../../../widgets/custom_text_field.dart';
import '../inscription_controller.dart';
import 'phone_detail.dart';

class PersonalInfoTab extends StatefulWidget {
  static int indexValue = 0;
  final InscriptionController controller;
  const PersonalInfoTab({Key? key, required this.controller}) : super(key: key);

  @override
  _PersonalInfoTabState createState() => _PersonalInfoTabState();
}

class _PersonalInfoTabState extends State<PersonalInfoTab> with AutomaticKeepAliveClientMixin {
  late final TextEditingController confirmPasswordController;

  @override
  void initState() {
    super.initState();
    confirmPasswordController = TextEditingController();
  }

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context); // This is required.

    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          const SizedBox(height: 40),
          CustomCircularImageView(
            imagePath: AppConstants.imagePath,
            height: 100.0,
            width: 100.0,
            fit: BoxFit.cover,
          ),
          const SizedBox(height: 40.0),
          Text(AppConstants.creerCompteTitle, textAlign: TextAlign.center, style: AppFonts.x30Bold),
          const SizedBox(height: 8.0),
          Text(AppConstants.creerCompteSubtitle, style: AppFonts.x12Regular),
          Text(AppConstants.creerCompteSubtitle2, style: AppFonts.x12Regular),
          const SizedBox(height: 60.0),
          Form(
            key: widget.controller.formKey1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomTextField(
                  validator: FormValidators.notEmptyOrNullValidator,
                  controller: widget.controller.nameController,
                  hintText: AppConstants.creerComptePrenom,
                  textInputType: TextInputType.emailAddress,
                  textStyle: AppFonts.x16Regular.copyWith(color: kBlackColor),
                  hintStyle: AppFonts.x16Regular,
                ),
                CustomTextField(
                  validator: FormValidators.notEmptyOrNullValidator,
                  controller: widget.controller.userNameController,
                  hintText: AppConstants.creerCompteNom,
                  textInputType: TextInputType.emailAddress,
                  textStyle: AppFonts.x16Regular.copyWith(color: kBlackColor),
                  hintStyle: AppFonts.x16Regular,
                ),
                CustomTextField(
                  validator: FormValidators.emailValidator,
                  controller: widget.controller.emailController,
                  hintText: AppConstants.creerCompteAdresseMail,
                  textInputType: TextInputType.emailAddress,
                  textStyle: AppFonts.x16Regular.copyWith(color: kBlackColor),
                  hintStyle: AppFonts.x16Regular,
                  textCapitalization: TextCapitalization.none,
                ),
                CustomTextField(
                  validator: FormValidators.notNullObjectValidator,
                  controller: widget.controller.passwordController,
                  hintText: AppConstants.creerCompteMDP,
                  textInputType: TextInputType.emailAddress,
                  textStyle: AppFonts.x16Regular.copyWith(color: kBlackColor),
                  hintStyle: AppFonts.x16Regular,
                  isPassword: true,
                  textCapitalization: TextCapitalization.none,
                ),
                CustomTextField(
                  validator: (value) {
                    if (value != widget.controller.passwordController.text) {
                      return 'Passwords do not match';
                    }
                    return null;
                  },
                  controller: confirmPasswordController,
                  hintText: AppConstants.creerCompteCMDP,
                  textInputType: TextInputType.emailAddress,
                  textStyle: AppFonts.x16Regular.copyWith(color: kBlackColor),
                  hintStyle: AppFonts.x16Regular,
                  isPassword: true,
                  textCapitalization: TextCapitalization.none,
                ),
              ],
            ),
          ),
          const SizedBox(height: 60.0),
          Padding(
            padding: const EdgeInsets.all(Paddings.regular),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomButton(
                  radius: 35,
                  height: 90,
                  backgroundColor: backButton,
                  titleColor: Colors.black,
                  onPressed: () {},
                  icon: Icons.chevron_left_sharp,
                ),
                CustomButton(
                  radius: 35,
                  height: 90,
                  backgroundColor: Colors.black,
                  titleColor: Colors.white,
                  onPressed: () {
                    widget.controller.changeTab(index: PhoneDetailTab.indexValue);
                  },
                  icon: Icons.done,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

}
