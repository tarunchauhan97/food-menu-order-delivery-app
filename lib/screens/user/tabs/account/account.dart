import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodmenuorder/components/food_card.dart';
import 'package:foodmenuorder/controller/get_product_details.dart';
import 'package:foodmenuorder/models/product_model.dart';
import 'package:foodmenuorder/screens/user/tabs/account/address_screen/view_address.dart';
import 'package:foodmenuorder/screens/user/tabs/account/widgets/account_setting_list.dart';
import 'package:get/get.dart';

class Account extends StatefulWidget {
  const Account({Key? key}) : super(key: key);

  @override
  _AccountState createState() => _AccountState();
}

class _AccountState extends State<Account> with TickerProviderStateMixin {
  TabController? _tabController;
  bool switchValue = true;
  List<ProductModel> favoriteProductModel = [];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, initialIndex: 0, vsync: this);
    if (Get.find<ProductDetailsController>().listProduct.isNotEmpty) {
      for (var product in Get.find<ProductDetailsController>().listProduct) {
        if (product.isLike.value) {
          favoriteProductModel.add(product);
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    Size size = MediaQuery.of(context).size;

    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(
              top: 30.0,
              bottom: 15.0,
            ),
            child: const CircleAvatar(
              backgroundColor: Colors.blueGrey,
              radius: 35.0,
              child: Icon(
                Icons.person,
                size: 30.0,
                color: Colors.white,
              ),
            ),
          ),
          const Text(
            'Full Name',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 22.0,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const <Widget>[
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5.0),
                  child: Icon(
                    Icons.location_on,
                    size: 16.0,
                    color: Colors.black54,
                  ),
                ),
                Text(
                  'Location',
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Colors.black54,
                  ),
                ),
              ],
            ),
          ),
          Container(
            color: Colors.white,
            child: TabBar(
              controller: _tabController,
              indicatorColor: theme.primaryColor,
              indicatorSize: TabBarIndicatorSize.label,
              labelColor: theme.primaryColor,
              labelStyle: const TextStyle(fontSize: 20.0),
              unselectedLabelColor: Colors.black,
              tabs: const <Widget>[
                Tab(text: 'Your Favorite'),
                Tab(text: 'Account Setting'),
              ],
            ),
          ),
          Expanded(
              child: TabBarView(
            controller: _tabController,
            children: <Widget>[
              Get.find<ProductDetailsController>().listProduct.isEmpty
                  ? Container()
                  : GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 15.h,
                      ),
                      shrinkWrap: true,
                      itemCount: favoriteProductModel.length,
                      itemBuilder: (BuildContext context, int index) {
                        return FoodCard(
                            width: size.width,
                            primaryColor: theme.primaryColor,
                            productModel: favoriteProductModel[index]);
                      }),
              Container(
                margin: const EdgeInsets.only(top: 5.0),
                padding: const EdgeInsets.symmetric(
                  vertical: 5.0,
                  horizontal: 20.0,
                ),
                child: Column(
                  children: <Widget>[
                    const AccountSettingList(icon: Icons.account_circle, iconText: "Profile"),
                    const SizedBox(height: 10),
                    GestureDetector(
                        onTap: () {
                          Get.to(() => const ViewAddress());
                        },
                        child:
                            const AccountSettingList(icon: Icons.location_on, iconText: "Address")),
                    const SizedBox(height: 10),
                    const AccountSettingList(
                        icon: Icons.text_snippet_rounded, iconText: "Order History"),
                    const SizedBox(height: 10),
                    const AccountSettingList(icon: Icons.headset_mic_rounded, iconText: "Support"),
                    const SizedBox(height: 30),
                    const AccountSettingList(icon: Icons.power_settings_new, iconText: "Logout")
                  ],
                ),
              ),
            ],
          ))
        ],
      ),
    );
  }
}
