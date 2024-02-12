

import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

Future<void> getImage(ImageSource imageSource, Rx<XFile?> pickedFile,
    {RxString? selectedImagePath, RxString? selectedImageSize}) async {
  try {
    pickedFile.value = await ImagePicker().pickImage(source: imageSource);

    if (selectedImagePath != null) {
      selectedImagePath.value = pickedFile.value!.path;
    }
    if (selectedImageSize != null) {
      final fileSize =
          File(selectedImagePath!.value).lengthSync() / (1024 * 1024);
      selectedImageSize.value = "${fileSize.toStringAsFixed(2)} MB";
    }
    } catch (e) {
    // Handle the error or log it for debugging purposes
    Get.snackbar(
      'Error',
      'An error occurred while picking the image',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.red,
      colorText: Colors.white,
    );
  }
}


Future<void> getFile(Rx<File?> file) async {
  try {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      File pickedFile = File(result.files.single.path!);

      file.value = pickedFile;
    } else {
      // User canceled the picker
      Get.snackbar(
        'Erreur',
        'File non sélectionnée',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  } catch (e) {
    // Handle the error or log it for debugging purposes
    Get.snackbar(
      'Error',
      'An error occurred while picking the file',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.red,
      colorText: Colors.white,
    );
  }
}