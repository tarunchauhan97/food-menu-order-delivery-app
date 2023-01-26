import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodonwheel/components/buttons.dart';
import 'package:foodonwheel/components/cart_card.dart';
import 'package:foodonwheel/components/custom_header.dart';
import 'package:foodonwheel/constants/image_constants.dart';
import 'package:foodonwheel/controller/address_controller.dart';
import 'package:foodonwheel/controller/get_product_details.dart';
import 'package:foodonwheel/models/product_model.dart';
import 'package:foodonwheel/screens/user/tabs/account/address_screen/add_edit_address.dart';
import 'package:foodonwheel/screens/user/tabs/app.dart';
import 'package:foodonwheel/screens/user/tabs/cart/schedule_order.dart';
import 'package:foodonwheel/screens/user/tabs/cart/widgets/row_text.dart';
import 'package:foodonwheel/theme/color_util.dart';
import 'package:foodonwheel/theme/text_style_util.dart';
import 'package:get/get.dart';

class OrderSummary extends StatelessWidget {
  const OrderSummary({Key? key}) : super(key: key);

  Widget orderSummaryTile({required String title, required List<Widget> widgets}) {
    return InputDecorator(
      decoration: InputDecoration(
        labelText: title,
        labelStyle: TextStyleUtil.txt20(color: Colors.black), //
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(color: ColorsUtils.themeColor, width: 2),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: widgets,
      ),
    );
  }

  Widget contactInfoTile({required String addressData, required IconData myIcon}) {
    return Row(
      children: [
        Icon(myIcon, color: ColorsUtils.themeColor, size: 26),
        SizedBox(width: 5.w),
        Text(addressData.capitalizeFirst!, style: TextStyleUtil.txt18()),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(23.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomHeader(
                  internalScreen: true,
                  title: 'Order Summary',
                  quantity: Get.find<ProductDetailsController>().cartProductModel.length,
                  showCart: false,
                ),
                SizedBox(height: 20.h),
                GestureDetector(
                  onTap: () => Get.to(
                    () => AddEditAddress(
                        addressMockModel: Get.find<AddressController>().listOfAddress[0],
                        addressIndex: 0),
                  ),
                  child: Obx(
                    () => orderSummaryTile(
                        title: "Saved Address",
                        widgets: [Text(Get.find<AddressController>().listOfAddress[0].address)]),
                  ),
                ),
                SizedBox(height: 20.h),
                orderSummaryTile(title: "Order Type", widgets: [
                  Obx(
                    () => SizedBox(
                      height: 20.h,
                      child: DropdownButton(
                          isExpanded: true,
                          underline: const SizedBox(),
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
                  ),

                  // Obx(
                  //   () => Row(
                  //     children: [
                  //       contactInfoTile(
                  //         addressData: Get.find<ProductDetailsController>().orderType.value,
                  //         myIcon: Icons.lunch_dining,
                  //       ),
                  //     ],
                  //   ),
                  // ),
                ]), //
                SizedBox(height: 20.h),
                orderSummaryTile(title: "Contact Info", widgets: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      contactInfoTile(addressData: "Mohit", myIcon: Icons.person),
                      SizedBox(width: 50.w),
                      contactInfoTile(addressData: "9306500117", myIcon: Icons.phone),
                    ],
                  ),
                  Row(
                    children: [
                      contactInfoTile(addressData: "122503", myIcon: Icons.home),
                    ],
                  ),
                ]),
                SizedBox(height: 10.h),
                SizedBox(
                  width: MediaQuery.of(context).size.width, //
                  height: 180.h,
                  child: Obx(
                    () => ListView.builder(
                        itemCount: Get.find<ProductDetailsController>().cartProductModel.length,
                        itemBuilder: (BuildContext context, int index) {
                          ProductModel food =
                              Get.find<ProductDetailsController>().cartProductModel[index];
                          return cartCard(food: food);
                        }),
                  ),
                ),
                SizedBox(height: 20.h),
                Container(
                  padding: const EdgeInsets.all(7.5),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.grey.shade400)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 15),
                      Text("Amount Details", style: TextStyleUtil.txt20(color: Colors.black)),
                      const SizedBox(height: 10),
                      Obx(
                        () => RowText(
                          rowTitle: "Amount",
                          price: Get.find<ProductDetailsController>().cartAmount.toString(),
                        ),
                      ),
                      const SizedBox(height: 8),
                      const RowText(rowTitle: "GST", price: "18 %"),
                      const SizedBox(height: 8),
                      const RowText(rowTitle: "Delivery Charges", price: "₹ 40"),
                      const SizedBox(height: 13),
                      Obx(
                        () => RowText(
                          rowTitle: "Total Amount",
                          price: Get.find<ProductDetailsController>().cartTotalAmount.toString(),
                        ),
                      ),
                      const SizedBox(height: 10),
                    ],
                  ),
                ),
                SizedBox(height: 20.h),
                Obx(
                  () => button(
                    context: context,
                    title: Get.find<ProductDetailsController>().orderType.value == 'Dine-In'
                        ? "Schedule Order"
                        : "Go to Payments",
                    // title: "Schedule Order",
                    onClick: () {
                      Get.find<ProductDetailsController>().orderType.value == 'Dine-In'
                          ? Get.to(() => const ScheduleOrder())
                          : Get.defaultDialog(
                              title: "",
                              backgroundColor: Colors.white,
                              contentPadding: EdgeInsets.zero,
                              content: const Image(
                                  image: AssetImage(ImageConstants.SUCCESSFULLY_IMAGE)));
                      if (Get.find<ProductDetailsController>().orderType.value != 'Dine-In') {
                        Future.delayed(const Duration(seconds: 2), () {
                          Get.back();
                          Get.find<ProductDetailsController>()
                              .orderProductModel
                              .addAll(Get.find<ProductDetailsController>().cartProductModel);
                          Get.find<ProductDetailsController>().cartProductModel.clear();
                          Get.offAll(() => const App());
                        });
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
