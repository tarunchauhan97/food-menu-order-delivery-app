import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodmenuorder/components/custom_header.dart';
import 'package:foodmenuorder/components/new_button_address.dart';
import 'package:foodmenuorder/constants/image_constants.dart';
import 'package:foodmenuorder/controller/get_product_details.dart';
import 'package:foodmenuorder/screens/user/tabs/app.dart';
import 'package:foodmenuorder/screens/user/tabs/home/details/food_list.dart';
import 'package:foodmenuorder/theme/color_util.dart';
import 'package:foodmenuorder/theme/text_style_util.dart';
import 'package:get/get.dart';

class DashBoard extends StatelessWidget {
  const DashBoard({Key? key}) : super(key: key);
  static final List<Map<String, String>> foodOptions = [
    {
      'name': 'Proteins',
      'image': ImageConstants.PROTEINS_IMAGE,
    },
    {
      'name': 'Burger',
      'image': ImageConstants.BURGER_IMAGE,
    },
    {
      'name': 'Fastfood',
      'image': ImageConstants.FAST_FOOD_IMAGE,
    },
    {
      'name': 'Salads',
      'image': ImageConstants.SALADS_IMAGE,
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(20.h),
            child: Column(
              children: [
                Obx(
                  () => CustomHeader(
                    internalScreen: true,
                    title: '',
                    quantity: Get.find<ProductDetailsController>().cartProductModel.length,
                    showCart: true,
                    iconData: Icons.menu,
                  ),
                ),
                SizedBox(height: 20.h),
                Container(
                  width: double.infinity,
                  height: 150.h,
                  padding: const EdgeInsets.only(bottom: 10.0),
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(20.0),
                    ),
                    border: Border.all(color: ColorsUtils.themeColor, width: 1.2),
                    image: DecorationImage(
                      image: const AssetImage(
                        ImageConstants.PROTEINS_IMAGE,
                      ),
                      alignment: Alignment.center,
                      fit: BoxFit.fill,
                      colorFilter: ColorFilter.mode(
                        Colors.black.withOpacity(0.01),
                        BlendMode.hardLight,
                      ),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Be The Fastest in Delivering Your Food",
                      style: TextStyleUtil.txt20(),
                    ),
                  ),
                ),
                SizedBox(height: 20.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Select your order type to start",
                      style: TextStyleUtil.txt24(),
                    ),
                  ],
                ),
                SizedBox(height: 20.h),
                newButtonAddress(
                  context: context,
                  title: "Delivery",
                  onClick: () {
                    Get.find<ProductDetailsController>().orderType.value = 'Delivery';
                    Get.to(() => const App());
                  },
                  buttonHeight: 45,
                  buttonWidth: 300,
                  buttonContainerColor: ColorsUtils.themeColor,
                  buttonRadius: 50,
                ),
                SizedBox(height: 10.h),
                newButtonAddress(
                  context: context,
                  title: "Dine-In",
                  onClick: () {
                    Get.find<ProductDetailsController>().orderType.value = 'Dine-In';
                    Get.to(() => const App());
                  },
                  buttonHeight: 45,
                  buttonWidth: 300,
                  buttonContainerColor: ColorsUtils.themeColor,
                  buttonRadius: 50,
                ),
                SizedBox(height: 10.h),
                newButtonAddress(
                  context: context,
                  title: "Pick-Up",
                  onClick: () {
                    Get.find<ProductDetailsController>().orderType.value = 'Pick-Up';
                    Get.to(() => const App());
                  },
                  buttonHeight: 45,
                  buttonWidth: 300,
                  buttonContainerColor: ColorsUtils.themeColor,
                  buttonRadius: 50,
                ),
                SizedBox(height: 20.h),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Browse Categories", style: TextStyleUtil.txt24()),
                    SizedBox(height: 10.h),
                    GridView.builder(
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                        ),
                        padding: const EdgeInsets.all(8.0),
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: foodOptions.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          Map<String, String> option = foodOptions[index];
                          return GestureDetector(
                            onTap: () {
                              Get.to(() => FoodList.create(context, foodOptions[index])); //
                            },
                            child: Container(
                              // width: 80.w,
                              // height: 80.h,
                              // //
                              padding: const EdgeInsets.all(10.0),
                              margin: const EdgeInsets.all(8.0),
                              child: Text(
                                option['name']!,
                                style: const TextStyle(fontSize: 17.0),
                              ),
                              // margin: const EdgeInsets.only(bottom: 10.0),
                              decoration: BoxDecoration(
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(20.0),
                                ),
                                image: DecorationImage(
                                  image: AssetImage(
                                    option['image']!,
                                  ),
                                  alignment: Alignment.center,
                                  fit: BoxFit.fill,
                                  colorFilter: ColorFilter.mode(
                                    Colors.black.withOpacity(0.08),
                                    BlendMode.hardLight,
                                  ),
                                ),
                              ),
                            ),
                          );
                        }),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
