
import 'dart:developer';

import 'package:final_year_project/auth/api/apis.dart';
import 'package:final_year_project/view/homeScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_sign_in/google_sign_in.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  bool isAnimated = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(seconds: 2), () {
      setState(() {
        isAnimated = true;
      });
    });
  }

  _handleGoogleBTN(){
  _signInWithGoogle().then((user) async {
    log('\nuser : ${user.user}');
    if((await APIs.UserExists())){
      Get.to(()=> HomeScreen());
    }else{
      await APIs.CreateUser().then((value){
        Get.to(()=> HomeScreen());
      });
    }

  }).onError((error, stackTrace){
    Get.snackbar('Error', error.toString());
  });
  }

  Future<UserCredential> _signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }



  late Size mq = MediaQuery
      .of(context)
      .size;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        automaticallyImplyLeading: false,
        title: Text("Travel Discovery"),
      ),
      body: Stack(
        children: [
          AnimatedPositioned(
            duration: Duration(seconds: 1),
            top: mq.height * 0.15,
            width: mq.width * 0.5,
            right: isAnimated ? mq.width * 0.25 : -mq.width * 0.5,
            child: Image.asset('assets/images/appIcon.png'),
          ),
          Positioned(
              bottom: mq.height * 0.15,
              width: mq.width * 0.9,
              left: mq.width * 0.05,
              height: mq.height * 0.06,
              child: ElevatedButton.icon(
                onPressed: () {
                  _handleGoogleBTN();
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.lightGreen,
                    shape: StadiumBorder(),
                    elevation: 1),
                icon: Image.asset(
                  "assets/images/google.png",
                  height: mq.height * 0.04,
                ),
                label: RichText(
                  text: TextSpan(
                      style: TextStyle(color: Colors.black, fontSize: 18),
                      children: [
                        TextSpan(text: "Login with "),
                        TextSpan(
                            text: "Google",
                            style: TextStyle(fontWeight: FontWeight.w500)),
                      ]),
                ),
              )),
        ],
      ),
    );
  }
}