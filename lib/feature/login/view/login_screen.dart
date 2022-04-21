import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:webtoonz_mobile/component/custom_button.dart';
import 'package:webtoonz_mobile/component/custom_input_field.dart';
import 'package:webtoonz_mobile/component/text_style.dart';
import 'package:webtoonz_mobile/feature/forgot_password/forgot_password/view/forgot_password_screen.dart';
import 'package:webtoonz_mobile/feature/login/controller/login_controller.dart';
import 'package:webtoonz_mobile/feature/sign_up/sign_up/signup_handyman_screen.dart';
import 'package:webtoonz_mobile/feature/user/user_screen.dart';
import 'package:webtoonz_mobile/utils/constants/color_resources.dart';
import 'package:webtoonz_mobile/utils/constants/string_resources.dart';

enum LoginOption { customer, professional }

class LoginScreen extends GetWidget {
  LoginScreen({Key? key}) : super(key: key);

  final LoginPageController loginPageController =
      Get.put(LoginPageController());
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        // bottomNavigationBar: Padding(padding: EdgeInsets.only(top: getHeight(0)), child: confirmButtonContainer(context, loginPageController)),
        body: SafeArea(
          child: Container(
            width: size.width,
            decoration: const BoxDecoration(
              color: ColorResources.white,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _appTitleText(),
                _loginWithYourAccountText(),
                _phoneNumberTextField(),
                _passwordTextField(),
                _forgotPasswordText(),
                _loginButton(),
                _registerText(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  GestureDetector _registerText() {
    return GestureDetector(
      onTap: () {
        Get.to(() => SignupHandymanScreen());
      },
      child: RichText(
        text: TextSpan(
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
          children: [
            TextSpan(
              text: StringResources.doNotHaveAnAccount.tr + " ",
              style: const TextStyle(
                color: ColorResources.black,
              ),
            ),
            TextSpan(
              text: StringResources.register.tr,
              style: const TextStyle(
                color: ColorResources.lightGreen,
                decoration: TextDecoration.underline,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Padding _loginButton() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(18, 82, 18, 18),
      child: CustomButton(
        text: StringResources.login.tr,
        onClick: () {
          Get.to(() => UserScreen());
        },
      ),
    );
  }

  GestureDetector _forgotPasswordText() {
    return GestureDetector(
      onTap: () {
        // do sth
        Get.to(() => ForgotPasswordScreen());
      },
      child: Text(
        StringResources.forgotPasswordQuestion.tr,
        style: const TextStyle(
            fontSize: 14,
            color: ColorResources.black,
            fontWeight: FontWeight.w500),
      ),
    );
  }

  Padding _passwordTextField() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(17, 0, 17, 20),
      child: CustomInputField(
        labelText: StringResources.password.tr,
        hintText: StringResources.enterYourPassword.tr,
        controller: passwordController,
        suffixIcon: Padding(
          padding: const EdgeInsets.all(12),
          child: GestureDetector(
              onTap: _toggleShowPasswordButton(),
              child: SvgPicture.asset('assets/icons/eye.svg')),
        ),
      ),
    );
  }

  Padding _loginWithYourAccountText() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 45),
      child: Text(
        StringResources.loginByAccount.tr,
        style: const TextStyle(
          fontSize: 16,
          color: ColorResources.grey,
        ),
      ),
    );
  }

  Padding _appTitleText() {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Text(
        StringResources.wormPrediction.tr,
        textAlign: TextAlign.center,
        style: headerTextStyle(),
      ),
    );
  }

  Padding _phoneNumberTextField() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(17, 0, 17, 20),
      child: CustomInputField(
        labelText: StringResources.phoneNumber.tr,
        hintText: StringResources.enterYourPhoneNumber.tr,
        controller: phoneNumberController,
      ),
    );
  }

  _toggleShowPasswordButton() {
    //do sth
  }
}

//
// Container confirmButtonContainer(BuildContext context, LoginPageController controller) {
//   GlobalController globalController = Get.put(GlobalController());
//   return bottomContainerLayout(
//     height: 120,
//     child: Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       crossAxisAlignment: CrossAxisAlignment.stretch,
//       children: [
//         Obx(
//           () => Expanded(
//             child: controller.isLoading.value == true
//                 ? Container(
//                     color: Colors.white,
//                     child: const Center(
//                       child: CircularProgressIndicator(),
//                     ),
//                   )
//                 : OutlinedButton(
//                     style: OutlinedButton.styleFrom(
//                       backgroundColor: const Color(0xffff511a),
//                       side: const BorderSide(
//                         color: Color(0xffff511a),
//                       ),
//                     ),
//                     onPressed: () async {
//                     },
//                     child: const Text("Sign in", style: TextStyle(color: Colors.white)),
//                   ),
//           ),
//         ),
//         SizedBox(
//           height: getHeight(12),
//         ),
//         Expanded(
//           child: OutlinedButton(
//             style: OutlinedButton.styleFrom(
//               side: const BorderSide(
//                 color: Colors.white,
//               ),
//             ),
//             onPressed: () {
//               Get.to(SignupWelcomeScreen());
//             },
//             child: const Text(
//               "Don't have account? Create new",
//               style: TextStyle(
//                 color: Color(0xffff511a),
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//           ),
//         ),
//       ],
//     ),
//   );
// }
