import 'dart:io';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:house_for_rent/variable/house_owner_varible.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:path/path.dart';

class HouseOwnerPage extends StatefulWidget {
  static const String routeName='/house_owner';
  const HouseOwnerPage({Key? key}) : super(key: key);

  @override
  State<HouseOwnerPage> createState() => _HouseOwnerPageState();
}

class _HouseOwnerPageState extends State<HouseOwnerPage> {

  HouseOwnerVariable house= HouseOwnerVariable();

  final formKey=GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: const Text('House Owner Page'),

        actions: [
          IconButton(onPressed: (){
            _saveDoc();

          },
              icon: Icon(Icons.save)),
        ],
      ),
      body: Form(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        key: formKey,
        child: ListView(
          children: [
             house.imagePath ==null?
             Image.asset('images/flat.jpeg',
               width: double.infinity,
               height: 400,
               fit: BoxFit.cover,):
             Padding(
               padding: const EdgeInsets.all(8.0),
               child: CarouselSlider(

                 options: CarouselOptions(
                   autoPlay: true,
                   aspectRatio: 2.0,
                   initialPage: 5,
                   enlargeCenterPage: true,


                 ),

         items: [
                Image.file(File( house.imagePath!),

            width:double.infinity,
            height: 400,
            fit: BoxFit.cover
    ),
           Image.asset('images/flat.jpeg'),],
                 ),
             ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton.icon(
                    onPressed: (){
                      house.source=ImageSource.camera;
                      getImage();

                    },
                    icon: const Icon(Icons.camera_alt),
                    label: const Text ('Capture')),
                TextButton.icon(
                    onPressed: (){
                      house.source=ImageSource.gallery;
                      getImage();

                    },
                    icon: const Icon(Icons.photo),
                    label: const Text ('Gallery')),

              ],
            ),
            Row(
              mainAxisAlignment:  MainAxisAlignment.center,
              children: [

                TextButton(
                    onPressed: _fromDate,
                    child: const Text('From Date'),
                ),Text (house.date==null?'No date Selected' : house.date!),
                TextButton(
                  onPressed: _toDate,
                  child: const Text('To Date'),
                ),
                Text (house.date==null?'No date Selected' : house.date!),

              ],
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text ('অনুগ্রহ পূর্বক নিম্নের সকল তথ্য দিন',
                    style: TextStyle(

                      color: Colors.white,
                      decorationColor: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.normal,
                      backgroundColor: Colors.grey,)),
              ),
            ),
            Center(
              child: Text('ক্যাটাগরি সিলেক্ট করুন',style: TextStyle(
                fontSize: 20,
              ),),
            ),
            Center(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [

                  Row(
                    children: [
                      Text('Bacelor', style: TextStyle(
                        fontSize: 20,
                      ), ),
                         Radio(
                          value: 'bachelor',
                          groupValue: house.groupValue,
                          onChanged: (value){
                            setState((){
                              house.groupValue=value as String;
                              if(house.groupValue=='bachelor'){

                              }else{
                                return null;
                              }

                            });
                          }
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text('Family',  style: TextStyle(
                        fontSize: 20,
                      ),),

                      Radio(
                          value: 'family',
                          groupValue: house.groupValue,
                          onChanged: (value){
                            setState((){
                              house.groupValue=value as String;
                            });}
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text('Office', style: TextStyle(
                        fontSize: 20,
                      ),),

                      Radio(
                          value: 'office',
                          groupValue: house.groupValue,
                          onChanged: (value){
                            setState((){
                              house.groupValue=value as String;
                            });}
                      ),
                    ],
                  ),
                ],
              ),
            ),house.groupValue=='bachelor'?
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                  controller: house.milController,
                  decoration: InputDecoration(
                      hintText: 'মিল সিস্টেম সম্পর্কে বিস্তারিত লিখুন',
                      fillColor: Colors.grey.shade100,
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                      )

                  ),
                  validator: (value){
                    if(value==null || value.isEmpty ){
                      return 'অনুগ্রহ পূর্বক ত্থ্যদিন';

                    }
                  }


              ),
            ): Text(''),


            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: house.descriptionController,
                decoration: InputDecoration(
                    hintText: 'বাসা/ফ্ল্যাটের সম্পর্কে বিস্তারিত লিখুন',
                    fillColor: Colors.grey.shade100,
                    filled: true,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                    )

                ),
                validator: (value){
              if(value==null || value.isEmpty ){
                return 'অনুগ্রহ পূর্বক ত্থ্যদিন';

           }
               }


              ),
            ),
     Padding(
       padding: const EdgeInsets.all(8.0),
       child: TextFormField(
    controller: house.phoneConroller,
         decoration: InputDecoration(
           prefixIcon: Icon(Icons.phone),
           hintText: ' আপনার ফোন নাম্বার দিন',
        filled: true,
       fillColor: Colors.grey.shade100,
       border: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(30)),
)
         ),
         keyboardType: TextInputType.number,
         validator: (value){
      if(value==null ||  value.isEmpty){
        return 'অনুগ্রহ পূর্বক ত্থ্যদিন';
      }else if( value.length >11  || value.length<11){
        return 'সঠিক ফোন নাম্বার দিন';
      }if(value.length==11){
        return null;
      }
         },

    ),
     ),

            DropdownButtonFormField(
              icon: Icon(
                Icons.arrow_drop_down_circle,
                color: Colors.redAccent,
              ),
            dropdownColor: Colors.white,

            decoration: InputDecoration(
              hintText: 'পুলিশ স্টেশন সিলেক্ট করুন',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(30)),
              ),

            ),
            value: house.thanas,
          items:house.thanaList.map((e) =>
         DropdownMenuItem(
                 value: e,
                child: Text(e))).toList(),
             onChanged: (value){
              setState((){
                house.thanas=value as String;
              });
               }),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: house.addressController,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.location_on),
                    hintText: 'বাসা/ফ্ল্যাটের ঠিকানা লিখুন',
                    filled: true,
                    fillColor: Colors.grey.shade100,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                    )
                ),
                  validator: (value){
                    if(value==null || value.isEmpty ){
                      return 'অনুগ্রহ পূর্বক তথ্যদিন';

                    }
                  }
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: house.rentController,
                decoration: InputDecoration(
                    hintText: 'বাড়ী ভাড়া লিখুন',
                    prefixIcon: Icon(Icons.attach_money),
                    filled: true,
                    fillColor: Colors.grey.shade100,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                    )
                ),
                keyboardType: TextInputType.number,
                  validator: (value){
                    if(value==null || value.isEmpty ){
                      return 'অনুগ্রহ পূর্বক ত্থ্যদিন';

                    }
                  }
              ),
            ),

            Column(
              children: [
                Text('বাসা ভাড়া যাবতীয় বিল সহ কিনা সিলেক্ট করুন',
                style: TextStyle(
                  fontSize: 20,
                ),),
                ListTile(
                  leading: Radio(
                      value: 'yes',
                      groupValue: house.groupValue,
                      onChanged: (value){
                        setState((){
                          house.groupValue=value! as String;
                        });
                      }),title: Text('হা'),
                ),
                ListTile(
                  leading: Radio(
                      value: 'no',
                      groupValue: house.groupValue,
                      onChanged: (value){
                        setState((){
                         house.groupValue=value! as String;
                         if(house.groupValue=='no'){
                         }
                         else{
                           return null;
                         }
                      });
                      }),title: Text('না'),
                ),
               house.groupValue=='no'? Padding(
                 padding: const EdgeInsets.all(8.0),
                 child: TextFormField(
                    controller: house.billController,
                    decoration: InputDecoration(
                        hintText: 'বিল সম্পর্কে বিস্তারিত লিখুন',
                        filled: true,
                        fillColor: Colors.grey.shade100,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                        )
                    ),
                     validator: (value){
                       if(value==null || value.isEmpty ){
                         return 'অনুগ্রহ পূর্বক ত্থ্যদিন';

                       }
                     }
                  ),
               ):
                   Text(''),

              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: house.serviceChargeController,
                decoration: InputDecoration(
                    hintText: 'সার্ভিস চার্জ প্রযোজ্য হলে বিস্তারিত লিখুন',
                    filled: true,
                    fillColor: Colors.grey.shade100,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                    )
                ),
                keyboardType: TextInputType.number,

              ),

            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: house.specialInstController,
                decoration: InputDecoration(
                    hintText: 'জরুরি নির্ধেশনা',
                    filled: true,
                    fillColor: Colors.grey.shade100,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                    )
                ),
                  validator: (value){
                    if(value==null || value.isEmpty ){
                      return 'অনুগ্রহ পূর্বক ত্থ্যদিন';

                    }
                  }
              ),
            ),
            Center(
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.redAccent),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),

                    ),

                  )
                ),
                  onPressed: (){

                  },
                  child: Text('Sumit Here', style: TextStyle(
                    fontSize: 20,
                  ),)),
            ),

          ],

        ),
      ),
    );
  }

  void getImage() async {
    final XFile= await ImagePicker().pickImage(source: house.source);
    if(XFile!=null){
      setState((){
        house.imagePath=XFile.path;
      });
    }
  }

   void _fromDate() async {
    final selectDate= await showDatePicker(
      context:  this.context ,
      initialDate: DateTime.now(),
      firstDate: DateTime(2021),
    lastDate: DateTime(2025),
    );
    if(_fromDate!=null){
      setState((){
         house.date =DateFormat('dd/MM/yyyy').format(selectDate!);
      });
    }
  }


  void _saveDoc() {
    if(formKey.currentState!.validate()){
    print('ok');

  }else{
      print('okok');
    }
  }

  void _toDate() async {
      final selectDate= await showDatePicker(
        context:  this.context ,
        initialDate: DateTime.now(),
        firstDate: DateTime(2021),
        lastDate: DateTime(2025),
      );
      if(_toDate!=null){
        setState((){
          house.date =DateFormat('dd/MM/yyyy').format(selectDate!);
        });
      }
    }
  }
