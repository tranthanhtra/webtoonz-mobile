import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webtoonz_mobile/feature/login/model/User.dart';
import 'package:webtoonz_mobile/global_controller.dart';
import 'package:webtoonz_mobile/service/api/custom_dio.dart';
import 'package:webtoonz_mobile/feature/login/view/login_screen.dart';
import 'package:webtoonz_mobile/service/auth/certificate_service.dart';
import 'package:webtoonz_mobile/service/auth/signature_service.dart';
import 'package:webtoonz_mobile/utils/common/response_validator.dart';
import 'package:webtoonz_mobile/utils/common/status.dart';

class LoginPageController extends GetxController {
  Rx<LoginOption> loginOption = LoginOption.customer.obs;

  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();

  RxBool isHidePassword = true.obs;
  RxBool isLoading = false.obs;
  var messValidateUsername = "".obs;
  var messValidatePassword = "".obs;

  void changeHidePassword() {
    isHidePassword.value = !isHidePassword.value;
  }

  Future getPing(List<String> certificateList) async {
    try {
      CustomDio customDio = CustomDio();
      customDio.dio.options.headers["Authorization"] = certificateList[0];

      var response = await customDio.post(
        "/auth/ping",
        certificateList[1],
        sign: false,
      );
      return response;
    } catch (e, s) {
      return null;
    }
  }

  Future getCredential(String username) async {
    try {
      CustomDio customDio = CustomDio();
      var response = await customDio.post(
          "/auth/credential",
          {
            "data": {
              "identifier": username.toString(),
            }
          },
          sign: false);
      return response;
    } catch (e, s) {
      return null;
    }
  }

  Future<bool> login() async {
    User userInfo = User();
    messValidateUsername.value = "";
    messValidatePassword.value = "";
    if (username.text == "") {
      messValidateUsername.value = "invalid_username";
    } else if (password.text == "") {
      messValidatePassword.value = "invalid_password";
    } else {
      var responseCredential = await getCredential(username.text);
      Status validateUsername = ResponseValidator.check(responseCredential);
      if (validateUsername.status == "OK") {
        var data = responseCredential.data["data"];
        var userId = data["id"];
        var publicKey = data['publicKey'];
        var encryptedPrivateKey = data['encryptedPrivateKey'];
        var userName = username.text;
        String? privateKey = decryptAESCryptoJS(encryptedPrivateKey, password.text);

        Status validatePassword = Status();

        if (privateKey == null) {
          validatePassword = Status(status: "ERROR", message: "WRONG.PASSWORD");
        } else {
          validatePassword = Status(status: "SUCCESS", message: "SUCCESS");
        }

        if (validatePassword.status == "SUCCESS") {
          var certificateInfo = SignatureService.getCertificateInfo(userId);
          String signature = SignatureService.getSignature(certificateInfo, privateKey as String);
          int times = DateTime.now().toUtc().millisecondsSinceEpoch;
          List<String> certificateList = SignatureService.getCertificateLogin(certificateInfo, userId, privateKey, encryptedPrivateKey, signature, publicKey, times);

          var responsePing = await getPing(certificateList);
          Status validateServer2 = ResponseValidator.check(responsePing);
          var jsonResponse = jsonDecode(responsePing.toString());
          if (validateServer2.status == "OK") {
            userInfo.id = userId;
            userInfo.name = userName;
            userInfo.phone = data["phone"];
            userInfo.publicKey = publicKey;
            userInfo.privateKey = privateKey;
            userInfo.encryptedPrivateKey = encryptedPrivateKey;
            userInfo.username = username.text;
            userInfo.certificate = certificateList[0];
            userInfo.role = jsonResponse["data"]["role"];
            userInfo.process = jsonResponse["data"]["process"] ?? 0;

            CustomDio customDio = CustomDio();

            if (userInfo.role == null || userInfo.role == 0) {
              var contactResponse = await customDio.get("/contacts/$userId");
              var contactInfo = jsonDecode(contactResponse.toString());
              var userResponse = await customDio.get("/users/$userId");
              var userInformation = jsonDecode(userResponse.toString());
              userInfo.zipcode = int.parse(contactInfo["data"]["contact"]["zipcode"] ?? "100");
              var firstName = userInformation["data"]["user"]["firstName"] ?? "";
              var lastName = userInformation["data"]["user"]["lastName"] ?? "";
              userInfo.fullName = firstName + " " + lastName;
            }

            Get.put(GlobalController()).user.value = userInfo;
            return true;
          } else {
            messValidatePassword.value = "invalid_password";
          }
        } else {
          messValidatePassword.value = "invalid_password";
        }
      } else if (validateUsername.status == "ERROR.SERVER") {
        messValidateUsername.value = "invalid_username";
      } else {
        messValidateUsername.value = "invalid_username";
      }
    }
    return false;
  }
}
