import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodonwheel/components/buttons.dart';
import 'package:foodonwheel/components/custom_text_field.dart';
import 'package:foodonwheel/config/save_image_firebase.dart';
import 'package:foodonwheel/controller/add_product_controller.dart';
import 'package:image_picker/image_picker.dart';

class ProductDetailForm extends StatefulWidget {
  const ProductDetailForm({Key? key}) : super(key: key);

  @override
  State<ProductDetailForm> createState() => _ProductDetailFormState();
}

class _ProductDetailFormState extends State<ProductDetailForm> {
  TextEditingController productNameTextEditController = TextEditingController();
  TextEditingController productPriceTextEditController =
      TextEditingController();
  late File file;
  String? fileURL;
  final imgPicker = ImagePicker();
  String? imageURL;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.all(12.h),
        child: SafeArea(
          child: Column(children: [
            customTextField(
                hintText: "Product Name",
                textEditingController: productNameTextEditController),
            SizedBox(height: 29.h),
            customTextField(
                hintText: "Product Price",
                textEditingController: productPriceTextEditController),
            SizedBox(height: 29.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                FloatingActionButton(
                  onPressed: () {
                    getImagefromGallery().then((path) async {
                      imageURL = await SaveImageFirebase().saveImage(
                          imagePath: path,
                          imageName: productNameTextEditController.text);
                    });
                  },
                  tooltip: "pickImage",
                  child: const Icon(Icons.add_a_photo),
                ),
                FloatingActionButton(
                  onPressed: () {
                    getImagefromcamera().then((path) async {
                      imageURL = await SaveImageFirebase().saveImage(
                          imagePath: path,
                          imageName: productNameTextEditController.text);
                    });
                  },
                  tooltip: "Pick Image",
                  child: const Icon(Icons.camera_alt),
                )
              ],
            ),
            SizedBox(height: 29.h),
            button(
                context: context,
                title: "Submit",
                onClick: () {
                  print(imageURL);
                  AddProductController().addProduct(
                      productName: productNameTextEditController.text,
                      productPrice: productPriceTextEditController.text,
                      image: imageURL.toString());
                })
          ]),
        ),
      ),
    );
  }

  Future<String> getImagefromcamera() async {
    var file = await ImagePicker().pickImage(
      source: ImageSource.camera,
    );
    return file!.path;
  }

  Future<String> getImagefromGallery() async {
    var file = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );
    return file!.path;
  }
}
