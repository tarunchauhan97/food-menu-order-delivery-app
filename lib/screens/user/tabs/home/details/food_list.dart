import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodonwheel/constants/api_path_constant.dart';
import 'package:foodonwheel/constants/image_constants.dart';
import 'package:foodonwheel/controller/get_product_details.dart';
import 'package:foodonwheel/controller/protein_controller.dart';
import 'package:foodonwheel/models/product_model.dart';
import 'package:foodonwheel/screens/user/tabs/home/details/details.dart';
import 'package:get/get.dart';

class FoodList extends StatelessWidget {
  FoodList({Key? key, required this.foodMapDb, required this.proteinListingController})
      : super(key: key);
  final Map<String, String> foodMapDb;
  final List<ProductModel> proteinListingController;
  final ScrollController scrollController = ScrollController();

  static Widget create(BuildContext context, Map<String, String> foodMapDb) {
    final listController = Get.find<ProteinListingController>();
    listController.fetchProductDetails(APIPath.DISH + '-' + foodMapDb['name']!);
    final listOfFoods = listController.getProteinListings;
    return FoodList(foodMapDb: foodMapDb, proteinListingController: listOfFoods);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            backgroundColor: Theme.of(context).primaryColor,
            pinned: false,
            snap: false,
            floating: false,
            expandedHeight: 160.0,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(foodMapDb['name']!),
              background: Image.asset(
                foodMapDb['image']!,
                fit: BoxFit.fill,
                color: Colors.black.withOpacity(0.7),
                colorBlendMode: BlendMode.hardLight,
              ),
            ),
          ),
          Obx(
            () => SliverPadding(
              padding: EdgeInsets.all(18.h),
              sliver: SliverList(
                delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        Get.to(() => Details(
                              product: proteinListingController[index],
                              index: index,
                            ));
                      },
                      child: Container(
                        margin: EdgeInsets.all(5.h),
                        padding: EdgeInsets.all(10.h),
                        decoration: BoxDecoration(
                          border: Border.all(width: 1.0, color: Colors.grey.shade300),
                          borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                        ),
                        child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                                Image.network(
                                  proteinListingController[index].image!,
                                  fit: BoxFit.fill,
                                  width: 126.w,
                                  height: 131.h,
                                ),
                                SizedBox(
                                  width: 10.w,
                                ),
                                Obx(() {
                                  return Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          width: 180.w,
                                          child: Text(
                                            proteinListingController[index]
                                                .name
                                                .toString()
                                                .capitalizeFirst!,
                                            overflow: TextOverflow.fade,
                                            maxLines: 1,
                                            softWrap: false,
                                            style: TextStyle(
                                                fontSize: 22.sp, fontWeight: FontWeight.w400),
                                          ),
                                        ),
                                        SizedBox(height: 12.h),
                                        Text(
                                          "₹ " + proteinListingController[index].price.toString(),
                                          style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 18.sp,
                                          ),
                                        ),
                                        SizedBox(height: 12.h),
                                        Container(
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(5),
                                              color: Theme.of(context).primaryColor),
                                          child: !Get.find<ProductDetailsController>()
                                                      .cartProductModel
                                                      .contains(proteinListingController[index]) ||
                                                  proteinListingController[index]
                                                          .quantity
                                                          .toString() ==
                                                      "0"
                                              ? GestureDetector(
                                                  onTap: () {
                                                    if (!Get.find<ProductDetailsController>()
                                                        .cartProductModel
                                                        .contains(
                                                            proteinListingController[index])) {
                                                      Get.find<ProductDetailsController>()
                                                          .cartProductModel
                                                          .add(proteinListingController[index]);
                                                    }
                                                  },
                                                  child: Container(
                                                    padding: EdgeInsets.symmetric(
                                                      horizontal: 20.0.w,
                                                      vertical: 8.0.h,
                                                    ),
                                                    margin: EdgeInsets.symmetric(
                                                      horizontal: 15.0.w,
                                                    ),
                                                    decoration: BoxDecoration(
                                                      color: Theme.of(context).primaryColor,
                                                      borderRadius: BorderRadius.circular(5.0),
                                                    ),
                                                    child: const Text(
                                                      'Add To Cart',
                                                      style: TextStyle(
                                                        fontSize: 18.0,
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                  ),
                                                )
                                              : Container(
                                            padding: EdgeInsets.symmetric(
                                              horizontal: 20.0.w,
                                              vertical: 8.0.h,
                                            ),
                                            margin: EdgeInsets.symmetric(
                                              horizontal: 15.0.w,
                                            ),
                                            decoration: BoxDecoration(
                                              color: Theme.of(context).primaryColor,
                                              borderRadius: BorderRadius.circular(5.0),
                                            ),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.spaceEvenly,
                                                    children: [
                                                      InkWell(
                                                          onTap: () {
                                                            for (var product in Get.find<
                                                                    ProductDetailsController>()
                                                                .cartProductModel) {
                                                              if (product ==
                                                                  proteinListingController[index]) {
                                                                if (proteinListingController[index]
                                                                        .quantity
                                                                        .value >
                                                                    1) {
                                                                  product.quantity--;
                                                                } else {
                                                                  Get.find<
                                                                          ProductDetailsController>()
                                                                      .cartProductModel
                                                                      .remove(
                                                                          proteinListingController[
                                                                              index]);
                                                                }
                                                              }
                                                            }
                                                          },
                                                          child: const Icon(
                                                            Icons.remove,
                                                            color: Colors.white,
                                                            size: 16,
                                                          )),
                                                      const SizedBox(width: 12),
                                                      Container(
                                                        margin: const EdgeInsets.symmetric(
                                                            horizontal: 3),
                                                        padding: const EdgeInsets.symmetric(
                                                            horizontal: 3, vertical: 2),
                                                        decoration: BoxDecoration(
                                                            borderRadius: BorderRadius.circular(3),
                                                            color: Colors.white),
                                                        child: Text(
                                                          proteinListingController[index]
                                                              .quantity
                                                              .value
                                                              .toString(),
                                                          style: const TextStyle(
                                                              color: Colors.black, fontSize: 16),
                                                        ),
                                                      ),
                                                      const SizedBox(width: 12),
                                                      InkWell(
                                                          onTap: () {
                                                            for (var product in Get.find<
                                                                    ProductDetailsController>()
                                                                .cartProductModel) {
                                                              if (product ==
                                                                  proteinListingController[index]) {
                                                                product.quantity++;
                                                              }
                                                            }
                                                          },
                                                          child: const Icon(
                                                            Icons.add,
                                                            color: Colors.white,
                                                            size: 16,
                                                          )),
                                                    ],
                                                  ),
                                                ),
                                        )
                                      ]);
                                })
                              ]),
                              proteinListingController[index].veg!
                                  ? Image(
                                      height: 25.h,
                                      width: 25.w,
                                      image: const AssetImage(ImageConstants.VEG_ICON))
                                  : Image(
                                      height: 25.h,
                                      width: 25.w,
                                      image: const AssetImage(ImageConstants.NON_VEG_ICON)),
                            ]),
                      ),
                    );
                  },
                  childCount: proteinListingController.length,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
