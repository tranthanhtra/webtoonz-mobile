import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webtoonz_mobile/feature/login/view/login_screen.dart';
import 'package:webtoonz_mobile/utils/common/config.dart';

class ForgotPasswordVerifiedPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      bottomNavigationBar: Padding(
          padding: EdgeInsets.only(top: getHeight(12)),
          child: confirmButtonContainer(context)),
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: Color(0xFF454B52),
            ),
            onPressed: () {
              Get.back();
            }),
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: Container(
        padding: EdgeInsets.only(
          left: getWidth(24),
          right: getWidth(24),
          top: getHeight(24),
        ),
        child: Column(
          children: [
            // getAppName(),
            SizedBox(
              height: getHeight(111),
            ),
            Container(
              height: getHeight(120),
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/icons/success-icon.png'),
                ),
              ),
            ),
            SizedBox(
              height: getHeight(36),
            ),
            Text(
              "Your password has been reset !",
              style: TextStyle(
                  fontSize: getHeight(24),
                  fontWeight: FontWeight.w500,
                  color: const Color(0xFFFF511A)),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: getHeight(16),
            ),
          ],
        ),
      ),
    );
  }
}

Container layout({required Widget child}) {
  return Container(
    margin: EdgeInsets.only(
      bottom: getHeight(46),
      left: getWidth(16),
      right: getWidth(16),
    ),
    height: getHeight(48),
    width: double.infinity,
    child: child,
  );
}

Container confirmButtonContainer(BuildContext context) {
  return layout(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          child: OutlinedButton(
            style: OutlinedButton.styleFrom(
              backgroundColor: const Color(0xffff511a),
              side: const BorderSide(
                color: Color(0xffff511a),
              ),
            ),
            onPressed: () async {
              Get.to(() => LoginScreen());
            },
            child: Text("signin".tr,
                style: const TextStyle(color: Colors.white)),
          ),
        ),
      ],
    ),
  );
}
