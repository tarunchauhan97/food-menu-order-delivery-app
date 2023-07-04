import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodmenuorder/components/custom_text_button.dart';
import 'package:foodmenuorder/controller/address_controller.dart';
import 'package:foodmenuorder/models/address_mock_model.dart';
import 'package:foodmenuorder/screens/user/tabs/account/address_screen/add_edit_address.dart';
import 'package:foodmenuorder/theme/text_style_util.dart';
import 'package:get/get.dart';

class CustomAddressCard extends StatelessWidget {
  CustomAddressCard({Key? key}) : super(key: key);

  final addressController = Get.find<AddressController>();

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: const BorderSide(
          color: Colors.black12,
          width: 1,
        ),
      ),
      child: Obx(
        () => Column(
          children: [
            Column(
              children: [
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 25.w, top: 20.h, bottom: 10.h),
                      child: Text(
                        "Saved Address",
                        style:
                            TextStyleUtil.txt24(color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                if (addressController.listOfAddress.isEmpty)
                  Container(
                    // padding: const EdgeInsets.all(10),
                    margin: const EdgeInsets.all(10),
                    child: Text(
                      "No Address",
                      style: TextStyleUtil.txt18(),
                    ),
                  ),
                for (int i = 0; i < addressController.listOfAddress.length; i++)
                  addressTile(context, addressController.listOfAddress[i], i),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget addressTile(BuildContext context, AddressMockModel addressData, int listIndex) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.only(left: 10.w),
              child: const Icon(Icons.home, size: 30),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.only(left: 20.w),
                child: Text(
                  addressData.address + ' ' + addressData.city + ' ' + addressData.pincode,
                  style: TextStyleUtil.txt18(),
                ),
              ),
            ),
          ],
        ),
        Container(
          padding: EdgeInsets.only(left: 42.w),
          child: Row(
            children: [
              customTextButton(
                textButtonClick: () {
                  Get.to(() => AddEditAddress(
                        addressMockModel: addressData,
                        addressIndex: listIndex,
                      ));
                },
                textButtonColor: Theme.of(context).primaryColor,
                textButtonTitle: "Edit",
              ),
              customTextButton(
                textButtonClick: () {
                  Get.find<AddressController>().listOfAddress.removeAt(listIndex);
                },
                textButtonColor: Theme.of(context).primaryColor,
                textButtonTitle: "Delete",
              ),
            ],
          ),
        ),
        const Divider(height: 2, indent: 20, endIndent: 20, color: Colors.black26),
        const SizedBox(height: 10),
      ],
    );
  }
}
