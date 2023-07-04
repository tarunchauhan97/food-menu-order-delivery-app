import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodmenuorder/components/buttons.dart';

import 'package:foodmenuorder/components/custom_text_field.dart';
import 'package:foodmenuorder/screens/user/auth/otp_screen.dart';
import 'package:foodmenuorder/service/auth_service.dart';
import 'package:foodmenuorder/theme/text_style_util.dart';

import 'package:get/get.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController phoneNumberTextEditController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        padding: EdgeInsets.all(17.h),
        child: Column(children: [
          SizedBox(height: 341.h),
          Center(
            child: Text(
              " Login/ Sign Up",
              style: TextStyleUtil.txt24(),
            ),
          ),
          SizedBox(height: 32.h),
          Text(
            "Sign In or Create Account with your Phone Number!",
            textAlign: TextAlign.center,
            style: TextStyleUtil.txt15(),
          ),
          SizedBox(height: 19.h),
          customTextField(
              hintText: "Enter the Phone Number*",
              textEditingController: phoneNumberTextEditController),
          SizedBox(height: 38.h),
          Text(
              "By logging in to app, you agree to our Privacy Policy and Terms & Conditions.",
              textAlign: TextAlign.center,
              style: TextStyleUtil.txt15()),
          SizedBox(height: 152.h),
          button(
              context: context,
              title: "Continue",
              onClick: () async {
                await AuthServices()
                    .sendOTP(phoneNumberTextEditController.text)
                    .then((verificationId) {
                  Get.to(() => OTPScreen(
                        verificationId: verificationId,
                      ));
                });
              })
        ]),
      )),
    );
  }
}
