import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webtoonz_mobile/controllers/login/login_controller.dart';
import 'package:webtoonz_mobile/utils/config.dart';
import 'package:webtoonz_mobile/widgets/bounce_button.dart';
import 'package:webtoonz_mobile/widgets/input.dart';
import 'package:webtoonz_mobile/widgets/text.dart';

class LoginScreen extends StatelessWidget {
  LoginController loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(
            top: getHeight(60),
            left: getWidth(16),
            right: getWidth(16),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              accessHeader("Log in"),
              SizedBox(
                height: getHeight(63),
              ),
              inputRegular(
                context,
                label: "Email address",
                textEditingController: loginController.username,
                hintText: '',
              ),
              SizedBox(
                height: getHeight(20),
              ),
              Obx(() {
                return inputPassword(
                  context,
                  label: "Password",
                  controller: loginController.password,
                  hintText: "",
                  isHide: loginController.isHidePassword.value,
                  changeHide: loginController.changeHidePassword,
                );
              }),
              SizedBox(
                height: getHeight(10),
              ),
              Container(
                alignment: Alignment.centerRight,
                width: double.infinity,
                child: Bouncing(
                  onPress: () {},
                  child: const Text(
                    "Forgot password",
                    style: TextStyle(
                      color: Color(0xFF5770FF),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: getHeight(37),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Bouncing(
                    onPress: () {},
                    child: const Text(
                      "Create user account",
                      style: TextStyle(
                        color: Color(0xFF5770FF),
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  Bouncing(
                    child: Container(
                      height: getHeight(40),
                      width: getWidth(117),
                      alignment: Alignment.center,
                      color: Color(0xFF54ACEC),
                      child: Text(
                        "Next",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    onPress: () {},
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
