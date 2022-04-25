import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webtoonz_mobile/feature/login/view/login_screen.dart';
import 'package:webtoonz_mobile/feature/sign_up/check_email/check_email_screen.dart';
import 'package:webtoonz_mobile/feature/sign_up/signup_controller.dart';
import 'package:webtoonz_mobile/utils/common/config.dart';

import '../../../component/custom_button.dart';
import '../../../component/custom_formfield.dart';
import '../../../component/custom_input_field.dart';

class SignupHandymanScreen extends StatefulWidget {
  const SignupHandymanScreen({Key? key}) : super(key: key);

  @override
  State<SignupHandymanScreen> createState() => _SignupHandymanScreenState();
}

class _SignupHandymanScreenState extends State<SignupHandymanScreen> {
  bool _showPassword = false;
  Icon _iconPassword = Icon(Icons.visibility_off);
  bool _showConfirmPW = false;
  Icon _iconConfirmPW = Icon(Icons.visibility_off);

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
              CustomFormField(
                maxLines: 1,
                headingText: 'Full name',
                textInputType: TextInputType.text,
                controller: signupController.fullName,
                obsecureText: false,
                hintText: 'Nguyen Van A',
                textInputAction: TextInputAction.done,
              ),
              CustomFormField(
                maxLines: 1,
                headingText: 'Username',
                textInputType: TextInputType.text,
                controller: signupController.userName,
                obsecureText: false,
                hintText: 'ABC',
                textInputAction: TextInputAction.done,
              ),
              CustomFormField(
                maxLines: 1,
                headingText: 'Email address',
                textInputType: TextInputType.text,
                controller: signupController.email,
                obsecureText: false,
                hintText: 'example@gmail.com',
                textInputAction: TextInputAction.done,
              ),
              CustomFormField(
                maxLines: 1,
                textInputAction: TextInputAction.done,
                textInputType: TextInputType.text,
                controller: signupController.password,
                headingText: "Password",
                hintText: "Klaj9.0e",
                obsecureText: !_showPassword,
                suffixIcon: IconButton(
                    icon: _iconPassword,
                    onPressed: () {
                      setState(() {
                        _showPassword = !_showPassword;
                        if (_showPassword == true)
                          _iconPassword = Icon(Icons.visibility);
                        else {
                          _iconPassword = Icon(Icons.visibility_off);
                        }
                      });
                    }),
              ),
              CustomFormField(
                maxLines: 1,
                textInputAction: TextInputAction.done,
                textInputType: TextInputType.text,
                controller: signupController.confirmPassword,
                headingText: "Confirm password",
                hintText: "Your password",
                obsecureText: !_showConfirmPW,
                suffixIcon: IconButton(
                    icon: _iconConfirmPW,
                    onPressed: () {
                      setState(() {
                        _showConfirmPW = !_showConfirmPW;
                        if (_showConfirmPW == true)
                          _iconConfirmPW = Icon(Icons.visibility);
                        else {
                          _iconConfirmPW = Icon(Icons.visibility_off);
                        }
                      });
                    }),
              ),
              _checkAgree(signupController),
              _signUpButton(signupController, context),
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
  Padding _signUpButton(
      SignupController signupController, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(18, 0, 18, 0),
      child: CustomButton(
        text: "Sign Up",
        onClick: () async {
           String validate = checkInfor(signupController);

          if (validate != "") {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text(validate),
                duration: const Duration(milliseconds: 800)));
            return;
          }
          var result = await signupController.signup();
          print(result);
          Get.to(() => CheckEmailScreen());
        },
      ),
    );
  }

  Padding _signUpTitle() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(18, 20, 18, 10),
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

String checkInfor(SignupController signupController) {
  if (signupController.fullName.text == "") {
    return 'Full name must not be empty';
  }
  if (signupController.userName.text == "") {
    return 'Username must not be empty';
  }
  if (signupController.email.text == "") {
    return 'Email must not be empty';
  }
  if (signupController.email.text.contains('@') == false) {
    return 'Email must contain @';
  }
  if (signupController.password.text.length < 8) {
    return 'Password must have at least 8 characters';
  }
  if (signupController.password.text.contains(new RegExp(r'[0-9]')) == false) {
    return 'Password must have at least 1 digit';
  }
  if (signupController.password.text.contains(new RegExp(r'[a-z]')) == false) {
    return 'Password must have at least 1 lowercase letter';
  }
  if (signupController.password.text.contains(new RegExp(r'[A-Z]')) == false) {
    return 'Password must have at least 1 uppercase letter';
  }
  if (signupController.password.text != signupController.confirmPassword.text) {
    return 'Confirm password does not match';
  }
  if (signupController.isAgree.value == false) {
    return 'You have not clicked the agree box';
  }
  return "";
}
