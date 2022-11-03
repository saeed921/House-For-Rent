import 'package:flutter/foundation.dart';

class HouseOwnerModel {

  int? hId;
  String? hMealSys;
  String hImage;
  String hFrmdate;
  String hTodate;
  String hCategory;
  String hDetails;
  String hPhoneNumber;
  String hPoliceStation;
  String hAddress;
  String hRent;
  String hBillSelect;
  String hAboutBill;
  String hServiceCharge;
  String hInstruction;

  HouseOwnerModel({
    required this.hId,
    this.hMealSys,
    required this.hImage,
    required this.hFrmdate,
    required this.hTodate,
    required this.hCategory,
    required this.hDetails,
    required this.hPhoneNumber,
    required this.hPoliceStation,
    required this.hAddress,
    required this.hRent,
    required this.hBillSelect,
    required this.hAboutBill,
    required this.hServiceCharge,
    required this.hInstruction
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'hId': hId,
      'hMealSys': hMealSys,
      'hFdate': hFrmdate,
      'hTdate': hTodate,
      'hPhoneNumber': hPhoneNumber,
      'hAddress': hAddress,
      'hRent': hRent,
      'hBillSelect': hBillSelect,
      'hAboutBill': hAboutBill,
      'hServiceCharge': hServiceCharge,
      'hInstruction': hInstruction,

    };
  }

  factory HouseOwnerModel.fromMap(Map<String, dynamic>map)=>
      HouseOwnerModel(
          hId: map['hId'],
          hImage: map['hImage'],
          hFrmdate: map['hFdate'],
          hTodate:map ['hTdate'],
          hCategory: map['hCategory'],
          hDetails: map['hDetails'],
          hPhoneNumber:map ['hPhoneNumber'],
          hPoliceStation:map ['hPoliceStation'],
          hAddress:map ['hAddress'],
          hRent:map ['hRent'],
          hBillSelect:map ['hBillSelect'],
          hAboutBill:map ['hAboutBill'],
          hServiceCharge:map ['hServiceCharge'],
          hInstruction:map ['hInstruction']
      );
}