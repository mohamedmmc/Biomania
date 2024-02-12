import 'package:Biomania2/model/user.dart';
import 'package:Biomania2/repository/user_repository.dart';
import 'package:Biomania2/view/home/home_controller.dart';
import 'package:Biomania2/view/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl_phone_field/countries.dart';

import '../../constant/enums.dart';
import '../../helper/file_image_picker.dart';

class InscriptionController extends GetxController with GetSingleTickerProviderStateMixin {
  static String routeName = '/inscription';
  late final tabController = TabController(length: 5, vsync: this);
  final TextEditingController nameController = TextEditingController();
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  final TextEditingController adresseController = TextEditingController();
  final TextEditingController matriculeFiscalController = TextEditingController();
  final TextEditingController passportController = TextEditingController();
  final TextEditingController numFreelancerController = TextEditingController();
  Rx<XFile?> identityCardFile = Rx<XFile?>(null);
  Rx<XFile?> identityPhotoFile = Rx<XFile?>(null);
  Rx<XFile?> driverLicenseFile = Rx<XFile?>(null);
  Rx<XFile?> ribFile = Rx<XFile?>(null);
  Rx<XFile?> insuranceFile = Rx<XFile?>(null);
  Rx<XFile?> rcProFile = Rx<XFile?>(null);
  Rx<XFile?> policyholderCodeFile = Rx<XFile?>(null);
  Rx<XFile?> bioCleaningCertificateFile = Rx<XFile?>(null);
  final GlobalKey<FormState> formKey1 = GlobalKey<FormState>();
  final GlobalKey<FormState> formKey2 = GlobalKey<FormState>();
  Rx<XFile?> pickedFile = Rx<XFile?>(null);
  var selectedImagePath = ''.obs;
  var selectedImageSize = ''.obs;
  Country selectedCountry = const Country(
    name: "France",
    nameTranslations: {
      "sk": "Francúzsko",
      "se": "Frankriika",
      "pl": "Francja",
      "no": "Frankrike",
      "ja": "フランス",
      "it": "Francia",
      "zh": "法国",
      "nl": "Frankrijk",
      "de": "Frankreich",
      "fr": "France",
      "es": "Francia",
      "en": "France",
      "pt_BR": "França",
      "sr-Cyrl": "Француска",
      "sr-Latn": "Francuska",
      "zh_TW": "法國",
      "tr": "Fransa",
      "ro": "Franța",
      "ar": "فرنسا",
      "fa": "فرانسه",
      "yue": "法國"
    },
    flag: "🇫🇷",
    code: "FR",
    dialCode: "33",
    minLength: 9,
    maxLength: 9,
  );
  String userTypeValue = '';
  String address = "123 Main Street";
  String city = "Cityville";
  int postalCode = 12345;

  InscriptionController();

  void changeTab({required int index, UserTypeEnum? userType}) {
    switch (index) {
      case 0:
        tabController.animateTo(index);
        update();
      case 1:
        if (formKey1.currentState!.validate()) {
          tabController.animateTo(index);
          update();
        }
      case 2:
        if (formKey2.currentState!.validate()) {
          tabController.animateTo(index);
          update();
        }
      case 3:
        userTypeValue = checkUserType(userType);
        if (userTypeValue == UserTypeEnum.client_normal.name) {
          Get.toNamed("home");
        } else {
          tabController.animateTo(index);
          update();
        }
      case 4:
        tabController.animateTo(index);
        update();
    }
  }

  String checkUserType(UserTypeEnum? userType) {
    switch (userType) {
      case UserTypeEnum.Particulier:
        return UserTypeEnum.Particulier.name;
      case UserTypeEnum.Societe:
        return UserTypeEnum.Societe.name;
      case UserTypeEnum.client_normal:
        return UserTypeEnum.client_normal.name;
      case UserTypeEnum.Freelancer:
        return UserTypeEnum.Freelancer.name;
      default:
        return UserTypeEnum.Particulier.name;
    }
  }

  void setImage(Rx<XFile?> file) async {
    await getImage(
      ImageSource.gallery,
      file,
    );
    update();
  }

  Future<void> signUp() async {
    var user = await UserRepository.find.signUp(
      userModel: UserModel(
          id: '',
          name: nameController.text,
          username: userNameController.text,
          password: passwordController.text,
          email: emailController.text,
          address: address,
          city: city,
          postalCode: postalCode,
          country: adresseController.text,
          matriculeFiscale: int.parse(matriculeFiscalController.text),
          numFreelancer: int.parse(matriculeFiscalController.text),
          passport: matriculeFiscalController.text,
          role: userTypeValue),
    );
    if (user != null) {
      Get.toNamed(HomeController.routeName);
    }
  }
}
