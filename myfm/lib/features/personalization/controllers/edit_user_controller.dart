import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditUserController extends GetxController {
  static EditUserController get instance => Get.find();

  // Variables
  final name = TextEditingController();
  final username = TextEditingController();
  final nationality = TextEditingController();
  final dateOfBirth = TextEditingController();
  GlobalKey<FormState> editUserFormKey = GlobalKey<FormState>();
}
