import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:house_for_rent/pages/details_page.dart';

class CategoryPage extends StatefulWidget {
  static const String routeName = '/category';
  const CategoryPage({Key? key}) : super(key: key);

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.redAccent,
          title: const Text('Rant A House'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Select Your Category',style: TextStyle(fontSize: 25),),
              SizedBox(height: 20,),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Card(
                    elevation: 20,
                    color: Colors.redAccent,
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Column(
                        children: [
                          CircleAvatar(
                            backgroundImage: AssetImage('images/category_family.jpg'),
                            radius: 40,
                          ),
                          SizedBox(height: 10,),
                          const Text('Family House')
                        ],
                      ),
                    ),
                  ),

                  Card(
                    elevation: 20,
                    color: Colors.redAccent,
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Column(
                        children: [
                          CircleAvatar(
                            backgroundImage: AssetImage('images/bachelor.png'),
                            radius: 40,
                          ),
                          SizedBox(height: 10,),
                          const Text('Bachelor House')
                        ],
                      ),
                    ),
                  ),

                  Card(
                    elevation: 20,
                    color: Colors.redAccent,
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Column(
                        children: [
                          CircleAvatar(
                            backgroundImage: AssetImage('images/house.jpg'),
                            radius: 40,
                          ),
                          SizedBox(height: 10,),
                          const Text('Family House')
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20,),
              ElevatedButton(
                  onPressed: (){
                    Get.to(HouseRentDetailsPage());
                  },
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(Colors.redAccent),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),

                          )
                      )
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(5),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text('Continue'),
                        SizedBox(width: 20,),
                        Icon(Icons.arrow_forward)
                      ],
                    ),
                  ))
            ],
          ),
        )
    );
  }
}
