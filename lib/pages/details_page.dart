import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:house_for_rent/variable/house_owner_varible.dart';
import 'package:proste_bezier_curve/proste_bezier_curve.dart';

class HouseRentDetailsPage extends StatefulWidget {
  const HouseRentDetailsPage({Key? key}) : super(key: key);

  @override
  State<HouseRentDetailsPage> createState() => _HouseRentDetailsPageState();
}

class _HouseRentDetailsPageState extends State<HouseRentDetailsPage> {

  @override
  Widget build(BuildContext context) {
    HouseOwnerVariable house=HouseOwnerVariable();
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          title: Text("Details"),
        ),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            FloatingActionButton.extended(
              onPressed: () {
                // Add your onPressed code here!
              },
              label: const Text('Call Korun'),
              icon: const Icon(Icons.call),
              backgroundColor: Colors.green[900],
            ),
            FloatingActionButton.extended(
              onPressed: () {
                // Add your onPressed code here!
              },
              label: const Text('Chat Korun'),
              icon: const Icon(Icons.chat),
              backgroundColor: Colors.green[900],
            )
          ],
        ),
        body: ListView(
          children: [
            Image.asset(
              "images/detailspic.jpg",
              height: 450,
              fit: BoxFit.contain,
            ),
            Stack(
              children: [
                Container(),
                ClipPath(
                  clipper: ProsteBezierCurve(
                    position: ClipPosition.top,
                    list: [
                      BezierCurveSection(
                        start: Offset(screenWidth, 0),
                        top: Offset(screenWidth / 2, 30),
                        end: Offset(0, 0),
                      ),
                    ],
                  ),
                  child: Container(
                    color: Colors.black12,
                    width: screenWidth,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 50,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                children: [
                                  Text(
                                    "Very good House Ltd",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                        fontSize: 15),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Text("This house is located "),
                                  Text("This house is located"),
                                ],
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Owners Details",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                        fontSize: 15),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Text("Talk to Owner"),
                                  Text("This house is located"),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Divider(
                            height: 8,
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Text(
                            "Rent Price",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                fontSize: 25),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text("Taka : 10,000"),
                          SizedBox(
                            height: 8,
                          ),
                          Divider(
                            height: 8,
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Text(
                            "Full Details",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                fontSize: 25),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(house.dummyText),
                          SizedBox(
                            height: 8,
                          ),
                          Divider(
                            height: 8,
                          ),
                          SizedBox(
                            height: 8,
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ],
        ));
  }
}
