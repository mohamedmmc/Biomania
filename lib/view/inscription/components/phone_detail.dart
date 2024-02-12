import 'package:Biomania2/view/inscription/components/personal_info.dart';
import 'package:Biomania2/view/inscription/components/user_type.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import '../../../constant/app_fonts.dart';
import '../../../constant/colors.dart';
import '../../../constant/constants.dart';
import '../../../constant/sizes.dart';
import '../../../helper/file_image_picker.dart';
import '../../../helper/form_validators.dart';
import '../../../widgets/custom_buttons.dart';
import '../../../widgets/custom_circular_image_view.dart';
import '../../../widgets/custom_text_field.dart';
import '../inscription_controller.dart';

class PhoneDetailTab extends StatefulWidget {
  static int indexValue = 1;
  final InscriptionController controller;

  const PhoneDetailTab({Key? key, required this.controller}) : super(key: key);

  @override
  _PhoneDetailTabState createState() => _PhoneDetailTabState();
}

class _PhoneDetailTabState extends State<PhoneDetailTab>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);

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
          Text(AppConstants.completeAccountTitle,
              textAlign: TextAlign.center, style: AppFonts.x30Bold),
          const SizedBox(height: 8.0),
          Text(AppConstants.completeAccountSubtitle, style: AppFonts.x12Regular),
          const SizedBox(height: 60.0),
          Form(
            key: widget.controller.formKey2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomTextField(
                  validator: FormValidators.notEmptyOrNullValidator,
                  controller: widget.controller.adresseController,
                  hintText: AppConstants.adresseHintText,
                  textInputType: TextInputType.emailAddress,
                  textStyle: AppFonts.x16Regular.copyWith(color: kBlackColor),
                  hintStyle: AppFonts.x16Regular,
                ),
                const SizedBox(height: 16.0),
                IntlPhoneField(
                  decoration: InputDecoration(
                    labelText: 'Numéro de telephone',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(Paddings.exceptional),
                      borderSide: const BorderSide(
                        color: kWhite,
                        width: 1.0,
                      ),
                    ),
                    contentPadding: const EdgeInsets.all(Paddings.extraLarge),
                    labelStyle: AppFonts.x14Regular,
                    hintStyle: AppFonts.x14Regular,
                  ),
                  // initialCountryCode: 'FR',
                  enabled: true,
                  countries: [widget.controller.selectedCountry],
                  onChanged: (phone) {
                  },
                ),
                const SizedBox(height: 16.0),
                Text(
                  'Sélectionnez votre image à l\'aide de la galerie ou de l\'appareil photo',
                  style: AppFonts.x14Regular,
                ),
                const SizedBox(height: 16.0),
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
                          getImage(
                            ImageSource.gallery,
                            widget.controller.pickedFile,
                            selectedImagePath: widget.controller.selectedImagePath,
                            selectedImageSize: widget.controller.selectedImageSize,
                          );
                        },
                        icon: Icons.image,
                      ),
                      CustomButton(
                        radius: 35,
                        height: 90,
                        backgroundColor: Colors.black,
                        titleColor: Colors.white,
                        onPressed: () {
                          getImage(
                            ImageSource.camera,
                            widget.controller.pickedFile,
                            selectedImagePath: widget.controller.selectedImagePath,
                            selectedImageSize: widget.controller.selectedImageSize,
                          );
                        },
                        icon: Icons.camera_alt,
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 16.0),
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Obx(
                            () => widget.controller.selectedImagePath.value == ''
                            ? Text(
                          '',
                          style: AppFonts.x16Regular,
                        )
                            : CustomCircularImageView(
                          imagePath: widget.controller.selectedImagePath.value,
                          height: 100.0,
                          width: 100.0,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(height: 16.0),
                      Obx(
                            () => Text(
                          widget.controller.selectedImageSize.value == ''
                              ? ''
                              : widget.controller.selectedImageSize.value,
                          style: AppFonts.x16Regular,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
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
                    widget.controller.changeTab( index: PersonalInfoTab.indexValue);
                  },
                  icon: Icons.chevron_left_sharp,
                ),
                CustomButton(
                  radius: 35,
                  height: 90,
                  backgroundColor: Colors.black,
                  titleColor: Colors.white,
                  onPressed: () async {
                    widget.controller.changeTab( index: UserType.indexValue);
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
