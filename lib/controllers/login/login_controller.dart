import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();

  RxBool isHidePassword = true.obs;

  void changeHidePassword() {
    isHidePassword.value = !isHidePassword.value;
  }}