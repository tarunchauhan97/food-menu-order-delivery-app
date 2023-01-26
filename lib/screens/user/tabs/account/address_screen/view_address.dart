import 'package:flutter/material.dart';
import 'package:foodonwheel/components/custom_header.dart';
import 'package:foodonwheel/constants/app_constants.dart';
import 'package:foodonwheel/components/address_card.dart';
import 'package:foodonwheel/components/new_button_address.dart';
import 'package:foodonwheel/controller/get_product_details.dart';
import 'package:foodonwheel/screens/user/tabs/account/address_screen/add_edit_address.dart';
import 'package:foodonwheel/theme/color_util.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ViewAddress extends StatelessWidget {
  const ViewAddress({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SizedBox(
          height: mediaHeight(context, 1),
          width: mediaWidth(context, 1),
          child: Column(
            children: [
              CustomHeader(
                internalScreen: true,
                quantity: Get.find<ProductDetailsController>()
                    .cartProductModel
                    .length,
                title: "My Address",
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: 25.w, right: 25.w, top: 20.h, bottom: 10.h),
                child: newButtonAddress(
                  context: context,
                  title: "Add New Address",
                  onClick: () {
                    Get.to(() => const AddEditAddress());
                  },
                  buttonHeight: 50,
                  buttonWidth: double.infinity,
                  buttonContainerColor: ColorsUtils.themeColor,
                ),
              ),
              Expanded(
                child: ListView(
                  padding: EdgeInsets.only(
                      top: 10.h, left: 20.w, right: 20.w, bottom: 10.h),
                  children: [
                    Divider(thickness: 1.5.h, color: ColorsUtils.themeColor),
                    SizedBox(height: 10.h),
                    CustomAddressCard(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
