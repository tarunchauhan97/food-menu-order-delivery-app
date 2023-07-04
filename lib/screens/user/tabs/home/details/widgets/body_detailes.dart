import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodmenuorder/components/custom_header.dart';
import 'package:foodmenuorder/config/location.dart';
import 'package:foodmenuorder/controller/get_product_details.dart';
import 'package:foodmenuorder/models/product_model.dart';
import 'package:foodmenuorder/screens/user/tabs/home/details/widgets/detaile_tab.dart';
import 'package:foodmenuorder/screens/user/tabs/home/details/widgets/icon_badge.dart';
import 'package:get/get.dart';

class BodyDetails extends StatefulWidget {
  final int index;
  final ProductModel? screenArguments;

  const BodyDetails({Key? key, this.screenArguments, required this.index}) : super(key: key);

  @override
  _BodyDetailsState createState() => _BodyDetailsState();
}

class _BodyDetailsState extends State<BodyDetails> with TickerProviderStateMixin {
  int screenTab = 0;
  TabController? _tabController;

  @override
  void initState() {
    _tabController = TabController(
      initialIndex: 0,
      length: 1,
      vsync: this,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    Size size = MediaQuery.of(context).size;

    return Obx(() {
      return SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          CustomHeader(
            title: '',
            quantity: Get.find<ProductDetailsController>().cartProductModel.length,
            internalScreen: true,
          ),
          Container(
            margin: EdgeInsets.only(
              top: size.width * 0.55,
              left: 50.0,
              right: 50.0,
            ),
          ),
          Obx(() => GestureDetector(
                onTap: () {
                  Get.find<ProductDetailsController>().listProduct[widget.index].isLike(
                      !Get.find<ProductDetailsController>().listProduct[widget.index].isLike.value);
                },
                child: Container(
                  alignment: Alignment.centerRight,
                  margin: const EdgeInsets.only(right: 65.0, bottom: 10.0),
                  child: IconBadge(
                    icon: Icons.favorite,
                    iconColor:
                        Get.find<ProductDetailsController>().listProduct[widget.index].isLike.value
                            ? theme.primaryColor
                            : Colors.grey.shade300,
                  ),
                ),
              )),
          Expanded(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 50.0),
              padding: const EdgeInsets.only(
                top: 10.0,
              ),
              width: size.width - 80.w,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Column(
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      Location.openMap(28.474388, 77.503990);
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 13.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          IconBadge(
                            icon: Icons.near_me,
                            iconColor: theme.primaryColor,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Container(
                      margin: EdgeInsets.only(
                        top: 10.h,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            widget.screenArguments!.name.toString(),
                            style: const TextStyle(fontSize: 18.0),
                          ),
                          Text(
                            '₹ ${widget.screenArguments!.price}',
                            style: const TextStyle(fontSize: 18.0),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Row(
                      children: <Widget>[
                        Text(
                          'by',
                          style: TextStyle(
                            color: Colors.grey[500],
                          ),
                        ),
                        const Text(' Restaurant'),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(
                      vertical: 20.0,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        !Get.find<ProductDetailsController>()
                                    .cartProductModel
                                    .contains(widget.screenArguments) ||
                                widget.screenArguments!.quantity.toString() == "0"
                            ? GestureDetector(
                                onTap: () {
                                  if (!Get.find<ProductDetailsController>()
                                      .cartProductModel
                                      .contains(widget.screenArguments)) {
                                    Get.find<ProductDetailsController>()
                                        .cartProductModel
                                        .add(widget.screenArguments!);
                                  }
                                },
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 30.0,
                                    vertical: 8.0,
                                  ),
                                  margin: const EdgeInsets.symmetric(
                                    horizontal: 20.0,
                                  ),
                                  decoration: BoxDecoration(
                                    color: theme.primaryColor,
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
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 30.0,
                                  vertical: 8.0,
                                ),
                                margin: const EdgeInsets.symmetric(
                                  horizontal: 20.0,
                                ),
                                decoration: BoxDecoration(
                                  color: theme.primaryColor,
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    InkWell(
                                        onTap: () {
                                          if (Get.find<ProductDetailsController>()
                                              .cartProductModel
                                              .isNotEmpty) {
                                            if (widget.screenArguments!.quantity.value > 1) {
                                              widget.screenArguments!.quantity.value--;
                                            } else {
                                              Get.find<ProductDetailsController>()
                                                  .cartProductModel
                                                  .remove(widget.screenArguments);
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
                                      margin: const EdgeInsets.symmetric(horizontal: 3),
                                      padding:
                                          const EdgeInsets.symmetric(horizontal: 3, vertical: 2),
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(3),
                                          color: Colors.white),
                                      child: Text(
                                        widget.screenArguments!.quantity.value.toString(),
                                        style: const TextStyle(color: Colors.black, fontSize: 16),
                                      ),
                                    ),
                                    const SizedBox(width: 12),
                                    InkWell(
                                        onTap: () {
                                          for (var product in Get.find<ProductDetailsController>()
                                              .cartProductModel) {
                                            if (product == widget.screenArguments) {
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
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: TabBar(
                      controller: _tabController,
                      labelColor: theme.primaryColor,
                      labelPadding: const EdgeInsets.all(0),
                      indicatorColor: Colors.white,
                      labelStyle: const TextStyle(
                        fontSize: 18.0,
                      ),
                      tabs: [
                        Container(
                          height: 20.0,
                          alignment: Alignment.centerLeft,
                          child: const Text(
                            'Details',
                          ),
                        ),
                        // Container(
                        //   height: 20.0,
                        //   alignment: Alignment.centerRight,
                        //   child: const Text(
                        //     'Review',
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: TabBarView(
                      controller: _tabController,
                      children: [
                        DetaileButtomTab(productDetaile: widget.screenArguments!.about.toString()),
                        // const ReviewTab()
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ));
    });
  }
}
