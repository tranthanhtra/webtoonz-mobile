import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webtoonz_mobile/feature/login/view/login_screen.dart';
import 'package:webtoonz_mobile/feature/sign_up/check_email/check_email_screen.dart';
import 'package:webtoonz_mobile/feature/sign_up/signup_controller.dart';
import 'package:webtoonz_mobile/utils/common/config.dart';

import '../../../component/custom_button.dart';
import '../../../component/custom_input_field.dart';

class SignupHandymanScreen extends StatelessWidget {
  const SignupHandymanScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SignupController signupController = Get.put(SignupController());
    return Scaffold(
      resizeToAvoidBottomInset: true,
      bottomNavigationBar: Padding(
          padding: EdgeInsets.only(top: getHeight(0)),
          child: confirmButtonContainer(context, signupController)),
      body: SafeArea(
        child: Container(
          color: Colors.white,
          child: ListView(
            children: [
              _signUpTitle(),
              _inputRegular("User name", "user", signupController.username),
              _inputRegular(
                  "Email address", "example@gmail.com", signupController.email),
              _inputRegular(
                  "Create password", "pass123456", signupController.password),
              //_listValidate(),
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 0, 17, 0),
                child: Text('Password must have at least'),
              ),
              Padding(
                  padding: const EdgeInsets.fromLTRB(30, 0, 17, 0),
                  child: Text('   8 characters',
                      style: TextStyle(color: Colors.red))),
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 0, 17, 0),
                child: Text('   1 uppercase letter',style: TextStyle(color: Colors.red)),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 0, 17, 0),
                child: Text('   1 lowercase letter',style: TextStyle(color: Colors.red)),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 0, 17, 15),
                child: Text('   1 number',style: TextStyle(color: Colors.red)),
              ),
              _inputRegular("Confirm password", "Your password",
                  signupController.confirmPassword),
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 0, 17, 15),
                child: Text('Confirm password does not match',style: TextStyle(color: Colors.red)),
              ),
              _checkAgree(signupController),
              _signUpButton(),
            ],
          ),
        ),
      ),
    );
  }

  Padding _inputRegular(
      String label, String hintText, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(17, 0, 17, 16),
      child: CustomInputField(
        labelText: label,
        hintText: hintText,
        controller: controller,
      ),
    );
  }

  // Padding _password(
  //     String label, String hintText, TextEditingController controller) {
  //   return Padding(
  //     padding: const EdgeInsets.fromLTRB(17, 0, 17, 0),
  //     child: TextField(
  //       obscureText: true,
  //       decoration: InputDecoration(
  //         border: OutlineInputBorder(),
  //         hintText: hintText,
  //         suffixIcon: Icon(
  //             Icons.visibility_off
  //         ),
  //       ),
  //       controller: controller,
  //     ),
  //   );
  // }

  Padding _signUpButton() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(18, 0, 18, 0),
      child: CustomButton(
        text: "Sign Up",
        onClick: () async {
          // if (signupController.email.text != "" &&
          //     signupController.phoneNumber.text != "" &&
          //     signupController.password.text != "" &&
          //     signupController.isAgree.value == true &&
          //     signupController.confirmPassword.text != "") {
          //   var result = await signupController.signup();
          Get.to(() => CheckEmailScreen());
        },
      ),
    );
  }

  Padding _signUpTitle() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(18, 20, 18, 25),
      child: Center(
          child: Text("Sign Up",
              style: TextStyle(
                  fontSize: 30,
                  color: Colors.blueAccent,
                  fontWeight: FontWeight.bold))),
    );
  }

  Padding _checkAgree(SignupController signupController) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(18, 0, 18, 0),
      child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        direction: Axis.horizontal,
        children: [
          Obx(
                () => Checkbox(
                value: signupController.isAgree.value,
                onChanged: (bool? value) {
                  signupController.isAgree.value = value ?? false;
                }),
          ),
          Text(
            "I agree to the ",
            style:
            TextStyle(fontSize: getHeight(14), fontWeight: FontWeight.w500),
          ),
          Text(
            "Term of Use",
            style: TextStyle(
                fontSize: getHeight(14),
                fontWeight: FontWeight.w500,
                color: Color(0xFF3864FF),
                decoration: TextDecoration.underline),
          ),
          Text(
            " and ",
            style:
            TextStyle(fontSize: getHeight(14), fontWeight: FontWeight.w500),
          ),
          Text(
            "Privacy Policy",
            style: TextStyle(
                fontSize: getHeight(14),
                fontWeight: FontWeight.w500,
                color: Color(0xFF3864FF),
                decoration: TextDecoration.underline),
          ),
        ],
      ),
    );
  }
}

//
Container confirmButtonContainer(
    BuildContext context, SignupController signupController) {
  return Container(
    height: 50,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // Expanded(
        //   child: OutlinedButton(
        //     style: OutlinedButton.styleFrom(
        //       backgroundColor: const Color(0xffff511a),
        //       side: const BorderSide(
        //         color: Color(0xffff511a),
        //       ),
        //     ),
        //     onPressed: () async {
        //       if (signupController.email.text != "" &&
        //           signupController.phoneNumber.text != "" &&
        //           signupController.password.text != "" &&
        //           signupController.isAgree.value == true &&
        //           signupController.confirmPassword.text != "") {
        //         var result = await signupController.signup();
        //         Get.to(() => CheckEmailScreen());
        //       }
        //     },
        //     child: Text("continue".tr, style: const TextStyle(color: Colors.white)),
        //   ),
        // ),
        // SizedBox(
        //   height: getHeight(12),
        // ),
        Expanded(
          child: OutlinedButton(
            style: OutlinedButton.styleFrom(
              side: const BorderSide(
                color: Colors.white,
              ),
            ),
            onPressed: () {
              Get.offAll(() => LoginScreen());
            },
            child: const Text(
              "Already have account? Back to Sign-in",
              style: TextStyle(
                color: Color(0xffff511a),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
