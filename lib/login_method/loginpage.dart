import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:house_for_rent/pages/home_page.dart';
import 'package:provider/provider.dart';

import '../auth/firebase_auth.dart';

class LoginPages extends StatefulWidget {
  static const String routeName ='/loginpage';
  const LoginPages({Key? key}) : super(key: key);

  @override
  State<LoginPages> createState() => _LoginPagesState();
}

class _LoginPagesState extends State<LoginPages> {
  bool isObscureText=true;
       bool isLogin=true;
      final  emailController= TextEditingController();
      final passwordController= TextEditingController();

  final formKey=GlobalKey<FormState>();
  String errMsg='';
@override
  void dispose() {
    // TODO: implement dispose
  emailController.dispose();
  passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('images/login.png'),
          fit: BoxFit.cover
        ),

      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [

            Padding(
              padding: const EdgeInsets.only(
            left: 35,top: 130
        ),
              child: Text('Please Login Here',
              style: TextStyle(color: Colors.white,
              fontSize: 35),),
            ),
            Container(
              child: Form(
                key: formKey,
                child: ListView(
                  padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.5,
                  right: 35,
                  left: 35),
                  children: [
                    TextFormField(
                      controller: emailController,
                      decoration: InputDecoration(

                        prefixIcon: Icon(Icons.email),
                        fillColor: Colors.grey.shade100,
                        filled: true,
                        hintText: 'Enter Email',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        )
                      ),
                      validator: (value){
                        if(value==null || value.isEmpty){
                          return 'This Field Must Not be empty';
                        }
                        return null;
                      },

                    ),
                    SizedBox(
                      height: 30,
                    ),
                    TextFormField(
                      controller: passwordController,
                      obscureText: isObscureText,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.lock),
                          suffixIcon: IconButton(
                            icon: Icon(
                              isObscureText? Icons.visibility_off : Icons.visibility
                            ),
                            onPressed: (){
                              setState(()
                              {
                                isObscureText= !isObscureText;
                              });
                            }
                          ),
                          fillColor: Colors.grey.shade100,
                          filled: true,
                          hintText: 'Enter Password',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),

                    ),
                      validator: (value){
                        if( value==null || value.isEmpty){
                          return 'This Field Must Not be empty';
                        }
                        return null;
                      },
                    ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('SignIn',
                      style: TextStyle(fontSize: 35,
                      color: Colors.black),),
                      CircleAvatar(
                        radius: 30,

                       child: IconButton(
                         color: Colors.white,
                        onPressed: (){
                          isLogin=false;
                          authinticate();
                        },
                         icon: Icon(Icons.arrow_forward,),

                       ),
                      ),


                    ],
                  ),  SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(onPressed: (){
                          Navigator.pushReplacementNamed(context, HomePage.routeName);

                        },
                            child: Text(
                              'Sign Up',style: TextStyle(
                                decoration: TextDecoration.underline,
                                fontSize: 28,
                                color: Colors.grey
                            ),
                            )),
                        TextButton(onPressed: (){},
                            child: Text(
                              'ForgetPassword',style: TextStyle(
                                decoration: TextDecoration.underline,
                                fontSize: 28,
                                color: Colors.grey
                            ),
                            )),

                      ],
                    ),
                    Text(errMsg),
                  ],
                ),
            )
            )],
        ),
      ),
    );
  }

  void authinticate() async {
    if(formKey.currentState!.validate()){
      bool status;
      try{
        if (isLogin){
           status= await AuthService.login(emailController.text, passwordController.text);
           
        }
        else{
           status= await AuthService.register(emailController.text, passwordController.text);
          final  userModel = UserModel(uid: AuthService.user!.uid,
              email: AuthService.user!.email!);
          if(mounted){
            await Provider.of<UserProvider>(context, listen: false)
                .addUser(userModel);
            Navigator.pushReplacementNamed(context, DashbordPage.routeName);
          }

        }
        if(status){
          Navigator.pushReplacementNamed(context, DashbordPage.routeName);
        }

      }
      on  FirebaseAuthException catch(e){
        setState((){
          errMsg=e.message!;
        });

      }
    }


  }
}
