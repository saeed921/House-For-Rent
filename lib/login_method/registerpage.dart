import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class RegistrationPage extends StatefulWidget {
  static const String routeName='/registerpage';
  const RegistrationPage({Key? key}) : super(key: key);

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  bool isObscureText=true;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('images/register.png'),fit: BoxFit.cover,
        )
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Container(
          child: Stack(

            children: [
              Padding(
                padding: const EdgeInsets.only(top: 135,
                left: 50, right: 50),
                child: Text('Registration Please',
                style: TextStyle(color:Colors.white,
                fontSize: 35),),
              ),
              Form(child: ListView(
                padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.38,
                    right: 35,
                    left: 35,
                ),


                children: [
                  TextFormField(

                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.white
                        )

                      ),
hintText: 'Name',
                      hintStyle: TextStyle(
                        color: Colors.white
                      ),
                      prefixIcon: Icon(Icons.drive_file_rename_outline),
                      fillColor: Colors.grey.shade100,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)
                      )
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(

                    decoration: InputDecoration(

hintText: 'Email',hintStyle: TextStyle(
                      color: Colors.white
                    ),
                        prefixIcon: Icon(Icons.email),
                        fillColor: Colors.grey.shade100,
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.white
                          ),
                            borderRadius: BorderRadius.circular(10)
                        )
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
obscureText: isObscureText ,
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: Colors.white
                        )
                      ),enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color:
                      Colors.white)
                    ),

                        hintText: 'Password',
                      hintStyle: TextStyle(
                        color: Colors.white
                      ),
                      prefixIcon: Icon(Icons.lock),
                        suffixIcon: IconButton(
                          onPressed: (){
                            setState((){
                             isObscureText=!isObscureText;
                            });
                          },
                          icon: Icon(
                            isObscureText?Icons.visibility_off :Icons.visibility
                          )
                        ),
                        fillColor: Colors.orange,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('SignUp',
                        style: TextStyle(fontSize: 35,
                            color: Colors.black),),
                      CircleAvatar(
                        radius: 30,

                        child: IconButton(
                          color: Colors.white,
                          onPressed: (){
                            Get.to.(HomePage);
                          },
                          icon: Icon(Icons.arrow_forward,),

                        ),
                      ),


                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 30,
                        child: IconButton(
                          onPressed: (){
Navigator.pushNamed(context, DashbordPage.routeName);
                          },
                          icon: Icon(Icons.arrow_back_ios),
                        ),
                      )
                    ],
                  )

                ],
              ))
            ],
          ),
        ),
      ),
    );
  }
}
