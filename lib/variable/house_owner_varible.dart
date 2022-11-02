import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class HouseOwnerVariable{
   //Variable
  String? date;
  String? imagePath;
  ImageSource source=ImageSource.camera;
  String? groupValue;
  String valu='no';
  String numberPatttern = '(?:\+88|88)?(01[3-9]\d{8})';

  //Radio_Button
  //Controller
final descriptionController= TextEditingController();
final phoneConroller= TextEditingController();
final addressController= TextEditingController();
final rentController= TextEditingController();
final specialInstController= TextEditingController();
final serviceChargeController= TextEditingController();
final billController= TextEditingController();
final instructionController= TextEditingController();
final milController= TextEditingController();

String? thanas;
  final thanaList = <String>[
    'sabujbag',
    'mugda',
    'khilgaon',
    'Rampura',
    'Hatirjheel',
    'Badda',
    'Dhanmondi'
  ];
  String dummyText = """বাংলাদেশ (এই শব্দ সম্পর্কেশুনুন (সাহায্য·তথ্য)) দক্ষিণ এশিয়ার একটি
   সার্বভৌম রাষ্ট্র। বাংলাদেশের সাংবিধানিক নাম গণপ্রজাতন্ত্রী বাংলাদেশ। ভৌগোলিকভাবে
    বাংলাদেশের পশ্চিমে ভারতের পশ্চিমবঙ্গ, উত্তরে পশ্চিমবঙ্গ, আসাম ও মেঘালয়, পূর্ব সীমান্তে আসাম,
     ত্রিপুরা ও মিজোরাম, দক্ষিণ-পূর্ব সীমান্তে মিয়ানমারের চিন ও রাখাইন রাজ্য এবং দক্ষিণ উপকূলের 
     দিকে বঙ্গোপসাগর অবস্থিত।[১৪] ভৌগোলিকভাবে পৃথিবীর বৃহত্তম ব-দ্বীপের সিংহভাগ অঞ্চল জুড়ে বাংলাদেশ
      ভূখণ্ড অবস্থিত। জনসংখ্যার বিবেচনায় ১৬ কোটির অধ""";
}