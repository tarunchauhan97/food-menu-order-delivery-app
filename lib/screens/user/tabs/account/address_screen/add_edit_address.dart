import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodmenuorder/components/custom_header.dart';
import 'package:foodmenuorder/constants/app_constants.dart';
import 'package:foodmenuorder/controller/address_controller.dart';
import 'package:foodmenuorder/controller/get_product_details.dart';
import 'package:foodmenuorder/models/address_mock_model.dart';
import 'package:foodmenuorder/components/new_button_address.dart';
import 'package:foodmenuorder/components/new_text_form_field.dart';
import 'package:foodmenuorder/components/radio_button.dart';
import 'package:get/get.dart';

enum HomeOfficeEnum { Home, Office }

class AddEditAddress extends StatefulWidget {
  const AddEditAddress({Key? key, this.addressMockModel, this.addressIndex}) : super(key: key);
  final AddressMockModel? addressMockModel;
  final int? addressIndex;

  @override
  State<AddEditAddress> createState() => _AddEditAddressState();
}

class _AddEditAddressState extends State<AddEditAddress> {
  final _formKey = GlobalKey<FormState>();
  String? _selectHomeOffice = "Home";

  TextEditingController firstNameController = TextEditingController();

  TextEditingController lastNameController = TextEditingController();

  TextEditingController addressController = TextEditingController();

  TextEditingController flatHouseController = TextEditingController();

  TextEditingController towerNumberController = TextEditingController();

  TextEditingController buildingController = TextEditingController();

  TextEditingController landmarkController = TextEditingController();

  TextEditingController pinCodeController = TextEditingController();

  TextEditingController cityController = TextEditingController();

  TextEditingController stateNameController = TextEditingController();

  TextEditingController phoneNumberController = TextEditingController();

  TextEditingController altPhoneNumberController = TextEditingController();
  final addressControllerGetx = Get.find<AddressController>();

  @override
  void initState() {
    super.initState();
    if (widget.addressMockModel != null) {
      firstNameController.text = widget.addressMockModel!.firstName;
      lastNameController.text = widget.addressMockModel!.lastName;
      addressController.text = widget.addressMockModel!.address;
      flatHouseController.text = widget.addressMockModel!.flathouseNo;
      towerNumberController.text = widget.addressMockModel!.towerNo;
      buildingController.text = widget.addressMockModel!.buildingApartment;
      landmarkController.text = widget.addressMockModel!.landmark;
      pinCodeController.text = widget.addressMockModel!.pincode;
      cityController.text = widget.addressMockModel!.city;
      stateNameController.text = widget.addressMockModel!.state;
      phoneNumberController.text = widget.addressMockModel!.phoneno;
    }
  }

  addEditAddress({required bool newAddress}) {
    if (newAddress) {
      addressControllerGetx.listOfAddress.add(AddressMockModel.fromJson(newAddressMap()));
    } else {
      addressControllerGetx.listOfAddress[widget.addressIndex!] =
          AddressMockModel.fromJson(newAddressMap());
    }
  }

  Map<String, String> newAddressMap() {
    final Map<String, String> newAddressMap = {
      "address_id": "0",
      "first_name": firstNameController.text,
      "last_name": lastNameController.text,
      "address": addressController.text,
      "flathouse_no": flatHouseController.text,
      "tower_no": towerNumberController.text,
      "building_apartment": buildingController.text,
      "landmark": landmarkController.text,
      "pincode": pinCodeController.text,
      "city": cityController.text,
      "state": stateNameController.text,
      "phoneno": phoneNumberController.text,
      "alt_phone_no": phoneNumberController.text,
    };
    return newAddressMap;
  }

  bool errorText = false;

  bool addressValidator() {
    setState(() {});
    if (addressController.text == '' &&
        cityController.text == '' &&
        pinCodeController.text == '' &&
        stateNameController.text == '') {
      setState(() {
        errorText = true;
      });
      return false;
    } else {
      return true;
    }
  }

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
                title: "My New Address",
                quantity: Get.find<ProductDetailsController>().cartProductModel.length,
              ),
              Expanded(
                child: Form(
                  key: _formKey,
                  autovalidateMode: AutovalidateMode.always,
                  child: ListView(
                    padding: EdgeInsets.only(top: 10.h, left: 20.w, right: 20.w, bottom: 10.h),
                    children: [
                      SizedBox(height: 20.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: newTextFormField(
                              hintText: "First Name",
                              textEditingController: firstNameController,
                            ),
                          ),
                          SizedBox(width: 15.h),
                          Expanded(
                            child: newTextFormField(
                              hintText: "Last Name",
                              textEditingController: lastNameController,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10.h),
                      newTextFormField(
                        hintText: "Address ",
                        textEditingController: addressController,
                        showErrorText: errorText,
                      ),
                      SizedBox(height: 10.h),
                      newTextFormField(
                        hintText: "Flat/ House No. ",
                        textEditingController: flatHouseController,
                      ),
                      SizedBox(height: 10.h),
                      newTextFormField(
                        hintText: "Tower No. ",
                        textEditingController: towerNumberController,
                      ),
                      SizedBox(height: 10.h),
                      newTextFormField(
                        hintText: "Building/ Apartment ",
                        textEditingController: buildingController,
                      ),
                      SizedBox(height: 10.h),
                      newTextFormField(
                        hintText: "Landmark ",
                        textEditingController: landmarkController,
                      ),
                      SizedBox(height: 10.h),
                      newTextFormField(
                        hintText: "Pincode ",
                        textEditingController: pinCodeController,
                        showErrorText: errorText,
                      ),
                      SizedBox(height: 10.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: newTextFormField(
                              hintText: "City",
                              textEditingController: cityController,
                              showErrorText: errorText,
                            ),
                          ),
                          SizedBox(width: 15.h),
                          Expanded(
                            child: newTextFormField(
                              hintText: "State",
                              textEditingController: stateNameController,
                              showErrorText: errorText,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(
                            child: newTextFormField(
                              hintText: "Phone Number",
                              textEditingController: phoneNumberController,
                            ),
                          ),
                          SizedBox(width: 15.h),
                          Expanded(
                            child: newTextFormField(
                              hintText: "Alternate Phone Number",
                              textEditingController: altPhoneNumberController,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          MyRadioOption<String>(
                            value: "Home",
                            text: "Home",
                            groupValue: _selectHomeOffice,
                            onChanged: (value) {
                              setState(() {
                                _selectHomeOffice = value;
                              });
                            },
                          ),
                          MyRadioOption<String>(
                            value: "Office",
                            text: "Office",
                            groupValue: _selectHomeOffice,
                            onChanged: (value) {
                              setState(() {
                                _selectHomeOffice = value;
                              });
                            },
                          ),
                        ],
                      ),
                      SizedBox(height: 20.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: newButtonAddress(
                              context: context,
                              title: "Save",
                              onClick: () async {
                                if (addressValidator()) {
                                  if (widget.addressMockModel == null) {
                                    await addEditAddress(newAddress: true);
                                    Get.back();
                                  } else {
                                    await addEditAddress(newAddress: false);
                                    Get.back();
                                  }
                                }
                              },
                              buttonWidth: 50,
                              buttonHeight: 40,
                              buttonContainerColor: Theme.of(context).primaryColor,
                            ),
                          ),
                          SizedBox(width: 15.w),
                          Expanded(
                              child: newButtonAddress(
                            context: context,
                            title: "Cancel",
                            onClick: () {
                              Get.back();
                            },
                            buttonWidth: 50,
                            buttonHeight: 40,
                            buttonContainerColor: Colors.grey,
                          )),
                        ],
                      ),
                      SizedBox(height: 15.h),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
