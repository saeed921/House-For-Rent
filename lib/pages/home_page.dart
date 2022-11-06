import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:house_for_rent/pages/category_page.dart';

import 'house_owner.dart';


class HomePage extends StatefulWidget {
  static const String routeName = '/home_page';
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Center(
            child: Container(
              child: Padding(
                padding: const EdgeInsets.all(70),
                child: Column(
                  children: [
                    CircleAvatar(
                        backgroundColor: Colors.redAccent,
                        radius: 60,
                        child: CircleAvatar(
                          backgroundImage: AssetImage('images/logo.jpg'),
                          radius: 50,
                        )
                    ),
                    SizedBox(height: 10,),
                    const Text('HOUSE RANT',style: TextStyle(fontSize: 25),),
                    SizedBox(height: 10,),
                    const Text('Welcome to this app',style: TextStyle(fontSize: 15),),
                  ],
                ),

              ),
            ),
          ),
          SizedBox(height: 30,),
          InkWell(
            onTap: () =>Get.to(HouseOwnerPage()),

            child: Container(
              height: 50,
              width: 150,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.redAccent
              ),
              child:  Center(child: Text('House Owner')),
            ),
          ),
          SizedBox(height: 20,),
          InkWell(
            onTap: (){
              //Get.to(HouseRentDetailsPage());
            },
            child: Container(
              height: 50,
              width: 150,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.redAccent
              ),
              child:  Center(child: Text('User')),
            ),
          ),
          SizedBox(height: 45.5,),
          Image.asset('images/downpic.png')
        ],
      ),
    );
  }
}
