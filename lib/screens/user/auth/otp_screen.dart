import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodmenuorder/components/buttons.dart';
import 'package:foodmenuorder/components/custom_text_field.dart';
import 'package:foodmenuorder/controller/auth_controller.dart';
import 'package:foodmenuorder/screens/user/auth/user_detail_screen.dart';
import 'package:foodmenuorder/service/auth_service.dart';
import 'package:foodmenuorder/theme/text_style_util.dart';
import 'package:get/get.dart';

class OTPScreen extends StatefulWidget {
  String? verificationId;
  OTPScreen({Key? key, this.verificationId}) : super(key: key);

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  TextEditingController otpTextEditController = TextEditingController();

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
            "We've sent the verification code on your registered Phone Number. Please enter it below to login to the app",
            textAlign: TextAlign.center,
            style: TextStyleUtil.txt15(),
          ),
          SizedBox(height: 26.h),
          customTextField(
              hintText: "Enter OTP",
              textEditingController: otpTextEditController),
          SizedBox(height: 190.h),
          button(
              context: context,
              title: "Submit",
              onClick: () {
                String verificationId =
                    Get.find<AuthController>().verificationID.value.toString();
                AuthServices()
                    .verifyOTP(verificationId, otpTextEditController.text);
                Get.to(() => const UserScreenDetail());
              })
        ]),
      )),
    );
  }
}
