import 'dart:convert';
class AddressMockData {
  static List<Map<String, String>> addressMockData = [
    {
      "address_id": "0",
      "first_name": "tarun",
      "last_name": "singh",
      "address": "B-400, Ansal Royal, Sector - 00",
      "flathouse_no": "40",
      "tower_no": "222",
      "building_apartment": "My Building",
      "landmark": "MyLandmark",
      "pincode": "21004",
      "city": "Faridabad",
      "state": "Haryana",
      "phoneno": "9306500110",
      "alt_phone_no": "9010132131"
    },
    {
      "address_id": "1",
      "first_name": "tarun",
      "last_name": "singh",
      "address": "B-411, Ansal Royal, Sector - 11",
      "flathouse_no": "40",
      "tower_no": "222",
      "building_apartment": "My Building",
      "landmark": "MyLandmark",
      "pincode": "21004",
      "city": "Faridabad",
      "state": "Haryana",
      "phoneno": "9306500110",
      "alt_phone_no": "9010132131"
    },
  ];
}

class AddressMockModel {
  AddressMockModel({
    required this.addressId,
    required this.firstName,
    required this.lastName,
    required this.address,
    required this.flathouseNo,
    required this.towerNo,
    required this.buildingApartment,
    required this.landmark,
    required this.pincode,
    required this.city,
    required this.state,
    required this.phoneno,
    required this.altPhoneNo,
  });

  final String addressId;
  final String firstName;
  final String lastName;
  final String address;
  final String flathouseNo;
  final String towerNo;
  final String buildingApartment;
  final String landmark;
  final String pincode;
  final String city;
  final String state;
  final String phoneno;
  final String altPhoneNo;

  AddressMockModel copyWith({
    required String addressId,
    required String firstName,
    required String lastName,
    required String address,
    required String flathouseNo,
    required String towerNo,
    required String buildingApartment,
    required String landmark,
    required String pincode,
    required String city,
    required String state,
    required String phoneno,
    required String altPhoneNo,
  }) =>
      AddressMockModel(
        addressId: addressId,
        firstName: firstName,
        lastName: lastName,
        address: address,
        flathouseNo: flathouseNo,
        towerNo: towerNo,
        buildingApartment: buildingApartment,
        landmark: landmark,
        pincode: pincode,
        city: city,
        state: state,
        phoneno: phoneno,
        altPhoneNo: altPhoneNo,
      );

  factory AddressMockModel.fromJson(Map<String, String> json) => AddressMockModel(
        addressId: json["address_id"]!,
        firstName: json["first_name"]!,
        lastName: json["last_name"]!,
        address: json["address"]!,
        flathouseNo: json["flathouse_no"]!,
        towerNo: json["tower_no"]!,
        buildingApartment: json["building_apartment"]!,
        landmark: json["landmark"]!,
        pincode: json["pincode"]!,
        city: json["city"]!,
        state: json["state"]!,
        phoneno: json["phoneno"]!,
        altPhoneNo: json["alt_phone_no"]!,
      );

   Map<String, dynamic> toJson(AddressMockModel addressData) => {
        "address_id": addressId,
        "first_name": firstName,
        "last_name": lastName,
        "address": address,
        "flathouse_no": flathouseNo,
        "tower_no": towerNo,
        "building_apartment": buildingApartment,
        "landmark": landmark,
        "pincode": pincode,
        "city": city,
        "state": state,
        "phoneno": phoneno,
        "alt_phone_no": altPhoneNo,
      };
}
