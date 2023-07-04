import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodmenuorder/components/custom_header.dart';
import 'package:foodmenuorder/controller/get_product_details.dart';
import 'package:foodmenuorder/models/product_model.dart';
import 'package:foodmenuorder/screens/user/tabs/cart/order_summary.dart';
import 'package:get/get.dart';

class Cart extends StatefulWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> with TickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    _tabController = TabController(
      initialIndex: 0,
      length: 3,
      vsync: this,
    );
    super.initState();
  }

  Widget renderAddList() {
    return Obx(() {
      return Get.find<ProductDetailsController>().cartProductModel.isEmpty
          ? Container()
          : ListView.builder(
              itemCount: Get.find<ProductDetailsController>().cartProductModel.length,
              itemBuilder: (BuildContext context, int index) {
                ProductModel food = Get.find<ProductDetailsController>().cartProductModel[index];
                Color primaryColor = Theme.of(context).primaryColor;
                return Container(
                  margin: const EdgeInsets.only(bottom: 10.0),
                  child: GestureDetector(
                    onTap: () {
                      // Navigator.pushNamed(
                      //   context,
                      //   'details',
                      //   arguments: {
                      //     'product': food,
                      //     'index': index,
                      //   },
                      // );
                    },
                    child: Hero(
                      tag: 'detail_food$index',
                      child: Card(
                        child: Row(
                          children: <Widget>[
                            Container(
                              height: 100,
                              width: 100,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image: NetworkImage(food.image!),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.stretch,
                                  children: <Widget>[
                                    GestureDetector(
                                      onTap: () {
                                        Get.find<ProductDetailsController>()
                                            .cartProductModel
                                            .remove(food);
                                      },
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Text(food.name!),
                                          const Icon(Icons.delete_outline)
                                        ],
                                      ),
                                    ),
                                    Text('₹ ${food.price}'),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Container(
                                          padding: const EdgeInsets.all(3),
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(5),
                                              color: primaryColor),
                                          child: Row(
                                            children: [
                                              InkWell(
                                                  onTap: () {
                                                    if (food.quantity > 1) {
                                                      food.quantity--;
                                                    }
                                                  },
                                                  child: const Icon(
                                                    Icons.remove,
                                                    color: Colors.white,
                                                    size: 16,
                                                  )),
                                              const SizedBox(width: 6),
                                              Container(
                                                margin: const EdgeInsets.symmetric(horizontal: 3),
                                                padding: const EdgeInsets.symmetric(
                                                    horizontal: 3, vertical: 2),
                                                decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(3),
                                                    color: Colors.white),
                                                child: Obx(() => Text(
                                                      food.quantity.toString(),
                                                    )),
                                              ),
                                              const SizedBox(width: 6),
                                              InkWell(
                                                  onTap: () {
                                                    food.quantity++;
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
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
    });
  }

  Widget renderTracking() {
    final ScrollController trackController = ScrollController();
    return Obx(() {
      return Get.find<ProductDetailsController>().orderProductModel.isEmpty
          ? Container()
          : ListView.builder(
              shrinkWrap: true,
              controller: trackController,
              physics: NeverScrollableScrollPhysics(),
              itemCount: Get.find<ProductDetailsController>().orderProductModel.length,
              itemBuilder: (BuildContext context, int index) {
                ProductModel food = Get.find<ProductDetailsController>().orderProductModel[index];
                Color primaryColor = Theme.of(context).primaryColor;
                return Container(
                  margin: const EdgeInsets.only(bottom: 10.0),
                  child: GestureDetector(
                    onTap: () {
                      // Navigator.pushNamed(
                      //   context,
                      //   'details',
                      //   arguments: {
                      //     'product': food,
                      //     'index': index,
                      //   },
                      // );
                    },
                    child: Card(
                      child: Row(
                        children: <Widget>[
                          Container(
                            height: 100,
                            width: 100,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                fit: BoxFit.fill,
                                image: NetworkImage(food.image!),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: <Widget>[
                                  GestureDetector(
                                    onTap: () {
                                      // Get.find<ProductDetailsController>()
                                      //     .cardProductModel
                                      //     .remove(food);
                                    },
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Text(food.name!),
                                        // const Icon(Icons.delete_outline)
                                      ],
                                    ),
                                  ),
                                  Text('₹ ${food.price}'),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.all(3),
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(5),
                                            color: primaryColor),
                                        child: Row(
                                          children: [
                                            InkWell(
                                                onTap: () {
                                                  if (food.quantity > 1) {
                                                    food.quantity--;
                                                  }
                                                },
                                                child: const Icon(
                                                  Icons.remove,
                                                  color: Colors.white,
                                                  size: 16,
                                                )),
                                            const SizedBox(width: 6),
                                            Container(
                                              margin: const EdgeInsets.symmetric(horizontal: 3),
                                              padding: const EdgeInsets.symmetric(
                                                  horizontal: 3, vertical: 2),
                                              decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(3),
                                                  color: Colors.white),
                                              child: Obx(() => Text(
                                                    food.quantity.toString(),
                                                  )),
                                            ),
                                            const SizedBox(width: 6),
                                            InkWell(
                                                onTap: () {
                                                  food.quantity++;
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
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
    });
  }

  Widget renderDoneOrder() {
    return Container();
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    Size size = MediaQuery.of(context).size;
    // final ScrollController trackController = ScrollController();

    return SafeArea(
      child: Column(
        children: <Widget>[
          Obx(() => CustomHeader(
                title: '',
                quantity: Get.find<ProductDetailsController>().cartProductModel.length,
                internalScreen: false,
              )),
          Container(
            margin: const EdgeInsets.only(
              top: 10.0,
            ),
            child: TabBar(
              controller: _tabController,
              indicatorColor: theme.primaryColor,
              indicatorSize: TabBarIndicatorSize.label,
              labelColor: Colors.black87,
              unselectedLabelColor: Colors.black87,
              tabs: const <Widget>[
                Tab(text: 'Order Details'),
                Tab(text: 'Track Order'),
                Tab(text: 'Delivered'),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: TabBarView(
                controller: _tabController,
                children: <Widget>[
                  Obx(() => Column(
                        children: <Widget>[
                          Expanded(
                            child: renderAddList(),
                          ),
                          Get.find<ProductDetailsController>().cartProductModel.isEmpty
                              ? Container()
                              : GestureDetector(
                                  onTap: () {
                                    Get.to(() => const OrderSummary());
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 15.0,
                                      horizontal: 35.0,
                                    ),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10.0),
                                      color: theme.primaryColor,
                                    ),
                                    child: const Text(
                                      'CHECKOUT',
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                        ],
                      )),
                  ListView(
                    shrinkWrap: true,
                    padding: EdgeInsets.only(bottom: 10.h),
                    children: <Widget>[
                      SizedBox(
                        // height: size.height * 0.20 * foods.length,
                        width: size.width,
                        child: renderTracking(),
                      ),
                      Get.find<ProductDetailsController>().orderProductModel.isEmpty
                          ? Container()
                          : Container(
                              margin: const EdgeInsets.symmetric(horizontal: 50.0),
                              padding: const EdgeInsets.symmetric(
                                vertical: 15.0,
                                horizontal: 35.0,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5.0),
                                color: theme.primaryColor,
                              ),
                              child: Row(
                                children: const <Widget>[
                                  Padding(
                                    padding: EdgeInsets.only(right: 8.0),
                                    child: Icon(
                                      Icons.location_searching,
                                      size: 20.0,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Text(
                                    'View Tracking Order',
                                    style: TextStyle(color: Colors.white, fontSize: 16.0),
                                  ),
                                ],
                              ),
                            ),
                    ],
                  ),
                  renderDoneOrder(),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
