import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webtoonz_mobile/service/api/custom_dio.dart';
import 'package:webtoonz_mobile/service/auth/certificate_service.dart';

class SignupController extends GetxController {
  TextEditingController fullName = TextEditingController();
  TextEditingController userName = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController zipCode = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  TextEditingController referral = TextEditingController();

  RxBool isHidePassword = true.obs;
  RxBool isHideCfPassword = true.obs;
  RxBool isCustomerMode = true.obs;
  RxBool isAgree = false.obs;

  void resetInput() {
    email.clear();
    phoneNumber.clear();
    zipCode.clear();
    password.clear();
    confirmPassword.clear();
    referral.clear();
    isAgree.value = false;
  }

  void updateTime() {
    update(["validateOTP"]);
  }

  void changeHidePassword() {
    isHidePassword.value = !isHidePassword.value;
  }

  void changeHideCfPassword() {
    isHideCfPassword.value = !isHideCfPassword.value;
  }

  Future<void> resetOTP() async {
    update(["validateOTP"]);
  }

  Future checkAccount() async {
    try {
      CustomDio customDio = CustomDio();
      var response = await customDio
          .get("/auth/check?mail=${email.text}&phone=${phoneNumber.text}");

      var json = jsonDecode(response.toString());
      if (json["success"] == true) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future signup() async {
    try {
      var keyPair = generateKeyPairAndEncrypt(password.text);
      // print("publicKey:"+keyPair["publicKey"]+"\n");
      // print("encryptedPrivateKey:"+keyPair["encryptedPrivateKey"]+"\n");
      CustomDio customDio = CustomDio();

      var data = {
        "fullName": fullName.text,
        "email": email.text,
        "username": userName.text,
        "encryptedPrivateKey": keyPair["encryptedPrivateKey"],
        "publicKey": keyPair["publicKey"],
      };

      var response = await customDio.post("/user", data, sign: false);
      var json = jsonDecode(response.toString());
      var result = json["data"];
      if (json["success"] == true) {
        return true;
      }
      return result;
    } catch (e, s) {
      print("error signUp:" + e.toString());
      return null;
    }
  }
}
