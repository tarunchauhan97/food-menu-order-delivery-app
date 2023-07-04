import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodmenuorder/components/buttons.dart';
import 'package:foodmenuorder/components/custom_header.dart';
import 'package:foodmenuorder/constants/image_constants.dart';
import 'package:foodmenuorder/controller/address_controller.dart';
import 'package:foodmenuorder/controller/get_product_details.dart';
import 'package:foodmenuorder/screens/user/tabs/app.dart';
import 'package:foodmenuorder/theme/text_style_util.dart';
import 'package:get/get.dart';

class ScheduleOrder extends StatefulWidget {
  const ScheduleOrder({Key? key}) : super(key: key);

  @override
  State<ScheduleOrder> createState() => _ScheduleOrderState();
}

class _ScheduleOrderState extends State<ScheduleOrder> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(23.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CustomHeader(
                  internalScreen: true,
                  title: 'Schedule Order',
                  quantity: Get.find<ProductDetailsController>().cartProductModel.length,
                  showCart: false,
                ),
                Column(
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 20.h, bottom: 20.h),
                      child: SizedBox(
                        width: double.infinity,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Order Type",
                              style: TextStyleUtil.txt24(),
                            ),
                            SizedBox(height: 10.h),
                            Obx(
                              () => DropdownButton(
                                  isExpanded: true,
                                  value: Get.find<ProductDetailsController>().orderType.value,
                                  icon: const Icon(Icons.keyboard_arrow_down),
                                  items: const [
                                    DropdownMenuItem(
                                      value: 'Delivery',
                                      child: Text("Delivery"),
                                    ),
                                    DropdownMenuItem(
                                      value: 'Dine-In',
                                      child: Text("Dine-In"),
                                    ),
                                    DropdownMenuItem(
                                      value: 'Pick-Up',
                                      child: Text("Pick-Up"),
                                    ),
                                  ],
                                  onChanged: (String? value) {
                                    Get.find<ProductDetailsController>().orderType.value = value!;
                                  }),
                            ),
                            SizedBox(height: 10.h),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 20.h, bottom: 20.h),
                      child: Container(
                        width: double.infinity,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Location",
                              style: TextStyleUtil.txt24(),
                            ),
                            SizedBox(height: 10.h),
                            Text(
                              Get.find<AddressController>().listOfAddress[0].address +
                                  ', ' +
                                  Get.find<AddressController>().listOfAddress[0].city +
                                  ', ' +
                                  Get.find<AddressController>().listOfAddress[0].pincode,
                              style: TextStyleUtil.txt18().copyWith(color: Colors.black),
                            ),
                            SizedBox(height: 10.h),
                          ],
                        ),
                        decoration: BoxDecoration(
                            color: Colors.grey.shade50,
                            border: Border(
                              bottom: BorderSide(color: Colors.grey.shade300, width: 1),
                            )),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 20.h),
                      child: SizedBox(
                        width: double.infinity,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Schedule",
                              style: TextStyleUtil.txt24(),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 20.h, bottom: 20.h),
                      child: Container(
                        width: double.infinity,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 10.h),
                            Text(
                              "Date",
                              style: TextStyleUtil.txt18().copyWith(color: Colors.black),
                            ),
                            SizedBox(height: 10.h),
                            Text(
                              "Today",
                              style: TextStyleUtil.txt18().copyWith(color: Colors.black),
                            ),
                            SizedBox(height: 10.h),
                          ],
                        ),
                        decoration: BoxDecoration(
                            color: Colors.grey.shade50,
                            border: Border(
                              bottom: BorderSide(color: Colors.grey.shade300, width: 1),
                            )),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 20.h, bottom: 20.h),
                      child: SizedBox(
                        width: double.infinity,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Time",
                              style: TextStyleUtil.txt18().copyWith(color: Colors.black),
                            ),
                            SizedBox(height: 10.h),
                            Obx(
                              () => DropdownButton(
                                  isExpanded: true,
                                  value: Get.find<ProductDetailsController>().orderTime.value,
                                  icon: const Icon(Icons.keyboard_arrow_down),
                                  items: const [
                                    DropdownMenuItem(
                                      value: 'ASAP',
                                      child: Text("ASAP"),
                                    ),
                                    DropdownMenuItem(
                                      value: 'Normal',
                                      child: Text("Normal"),
                                    ),
                                  ],
                                  onChanged: (String? value) {
                                    Get.find<ProductDetailsController>().orderTime.value = value!;
                                    // setState(() {
                                    //   timeSelect = value!;
                                    // });
                                  }),
                            ),
                            SizedBox(height: 10.h),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 130.h),
                button(
                  context: context,
                  title: "Payments",
                  onClick: () {
                    Get.defaultDialog(
                      title: "",
                      backgroundColor: Colors.white,
                      contentPadding: EdgeInsets.zero,
                      content: const Image(
                        image: AssetImage(ImageConstants.SUCCESSFULLY_IMAGE),
                      ),
                    );
                    Future.delayed(const Duration(seconds: 2), () {
                      Get.back();
                      Get.find<ProductDetailsController>()
                          .orderProductModel
                          .addAll(Get.find<ProductDetailsController>().cartProductModel);
                      Get.find<ProductDetailsController>().cartProductModel.clear();

                      Get.offAll(() => const App());
                    });
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
