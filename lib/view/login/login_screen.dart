import 'package:Biomania2/constant/colors.dart';
import 'package:Biomania2/helper/form_validators.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constant/app_fonts.dart';
import '../../constant/constants.dart';
import '../../constant/sizes.dart';
import '../../widgets/custom_buttons.dart';
import '../../widgets/custom_circular_image_view.dart';
import '../../widgets/custom_text_field.dart';
import 'login_controller.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //FocusNode _focusNode = FocusNode();
    return GetBuilder<LoginController>(
      builder: (controller) => Scaffold(
        body: Padding(
          padding: const EdgeInsets.fromLTRB(Paddings.exceptional, Paddings.exceptional, Paddings.exceptional, 0),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              //crossAxisAlignment: CrossAxisAlignment.,
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 40),
                CustomCircularImageView(
                  imagePath: AppConstants.imagePath,
                  height: 100.0,
                  width: 100.0,
                  fit: BoxFit.cover,
                ),
                const SizedBox(height: 40.0),
                Text(AppConstants.appTitle, style: AppFonts.x30Bold),
                const SizedBox(height: 8.0),
                Text(AppConstants.appSubtitle, style: AppFonts.x12Regular),
                const SizedBox(height: 60.0),
                Form(
                  key: controller.formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomTextField(
                        validator: FormValidators.emailValidator,
                        controller: controller.emailController,
                        hintText: AppConstants.emailHintText,
                        textInputType: TextInputType.emailAddress,
                        textStyle: AppFonts.x16Regular.copyWith(color: kBlackColor),
                        hintStyle: AppFonts.x16Regular,
                        textCapitalization: TextCapitalization.none,
                      ),
                      CustomTextField(
                        validator: FormValidators.notNullObjectValidator,
                        controller: controller.passwordController,
                        hintText: AppConstants.passwordHintText,
                        textInputType: TextInputType.emailAddress,
                        textStyle: AppFonts.x16Regular.copyWith(color: kBlackColor),
                        hintStyle: AppFonts.x16Regular,
                        isPassword: true,
                      ),
                      const SizedBox(height: 16.0),
                      const SizedBox(height: 8.0),
                      Padding(
                        padding: const EdgeInsets.only(left: Paddings.regular, top: Paddings.large),
                        child: GestureDetector(
                          onTap: () {
                            // Handle 'Mot de passe oublié' action
                          },
                          child: Text(
                            AppConstants.forgotPasswordText,
                            style: AppFonts.x12Regular,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 60.0),
                Text(AppConstants.loremIpsumText, textAlign: TextAlign.center, style: AppFonts.x12Regular),
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
                        onPressed: controller.navigateToInscription,
                        icon: Icons.chevron_left_sharp,
                      ),
                      CustomButton(
                        radius: 35,
                        height: 90,
                        backgroundColor: Colors.black,
                        titleColor: Colors.white,
                        onPressed: controller.login,
                        icon: Icons.done,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
