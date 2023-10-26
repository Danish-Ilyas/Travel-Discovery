import 'package:final_year_project/auth/api/apis.dart';
import 'package:final_year_project/view/homeScreen.dart';
import 'package:final_year_project/auth/loginScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class onBoarding extends StatefulWidget {
  const onBoarding({super.key,});

  @override
  State<onBoarding> createState() => _onBoardingState();
}

class _onBoardingState extends State<onBoarding> {

  late Size mq = MediaQuery.of(context).size;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
         image: AssetImage("assets/images/bg.jpg"),
          fit: BoxFit.cover,
          opacity: 0.7,
        ),
      ),
      child: Material(
        color: Colors.transparent,
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: mq.height * 0.05,horizontal: mq.width * 0.07),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Enjoy", style: TextStyle(
                  color: Colors.white,
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.5,
                ),),
                SizedBox(height: mq.height * 0.005,),
                Text("the world!", style: TextStyle(
                  color: Colors.white.withOpacity(0.9),
                  fontSize: 35,
                  fontWeight: FontWeight.w400,
                  letterSpacing: 1.5,
                ),),
                SizedBox(height: mq.height * 0.02,),
                Text("We provides best services to search new and attractive places in our city. And also provide routes to reach the destiny. It's totally about Travelling and Discoveries",
                  style: TextStyle(
                  color: Colors.white.withOpacity(0.7),
                  fontSize: 16,
                  letterSpacing: 1.2,
                ),),
                SizedBox(height: mq.height * 0.04,),
                InkWell(
                  onTap: (){
                    if(APIs.auth.currentUser != null){
                      Get.to(()=> HomeScreen());
                    }
                    else{
                      Get.to(()=> LoginScreen());
                    }
                  },
                  child: Ink(
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.black54,
                      size: 20,
                    ),

                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
