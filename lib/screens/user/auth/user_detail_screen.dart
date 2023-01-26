import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodonwheel/components/buttons.dart';
import 'package:foodonwheel/components/custom_text_field.dart';
import 'package:foodonwheel/screens/user/tabs/app.dart';
import 'package:foodonwheel/theme/color_util.dart';
import 'package:foodonwheel/theme/text_style_util.dart';
import 'package:get/get.dart';

class UserScreenDetail extends StatefulWidget {
  const UserScreenDetail({Key? key}) : super(key: key);

  @override
  State<UserScreenDetail> createState() => _UserScreenDetailState();
}

class _UserScreenDetailState extends State<UserScreenDetail> {
  TextEditingController fullNameEditController = TextEditingController();
  TextEditingController emailAddressEditController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        padding: EdgeInsets.all(17.h),
        child: Column(children: [
          SizedBox(height: 341.h),
          Center(
            child: Text(" Login/ Sign Up", style: TextStyleUtil.txt24()),
          ),
          SizedBox(height: 32.h),
          Text(
            "Welcome,\nThank You for being with us!",
            textAlign: TextAlign.center,
            style: TextStyleUtil.txt15(color: Colors.black),
          ),
          SizedBox(height: 12.h),
          Text(
            "Please let us know you more.",
            textAlign: TextAlign.center,
            style: TextStyleUtil.txt15(),
          ),
          SizedBox(height: 23.h),
          customTextField(
              hintText: "Full Name",
              textEditingController: fullNameEditController),
          SizedBox(height: 12.h),
          customTextField(
              hintText: "Email Address",
              textEditingController: emailAddressEditController),
          SizedBox(height: 32.h),
          button(
              context: context,
              title: "Submit",
              onClick: () {
                Get.offAll(() => const App());
              }),
          SizedBox(height: 25.h),
          Text("Or",
              style: TextStyleUtil.txt15(color: ColorsUtils.primaryblack)),
          SizedBox(height: 20.h),
          GestureDetector(
            onTap: () {
              Get.offAll(() => const App());
            },
            child: Text(
              "Skip, Ask me Later",
              style: TextStyleUtil.txt15(color: ColorsUtils.primaryblack),
            ),
          ),
        ]),
      )),
    );
  }
}
