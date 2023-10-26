import 'package:final_year_project/auth/OnBoarding.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(seconds: 3), (){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => onBoarding()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 50,
                backgroundColor: Colors.transparent,
                child: Image(image: AssetImage("assets/images/appIcon.png"),),
              ),
              SizedBox(height: 20,),
              Text("Travel Discovery",style: TextStyle(color: Colors.blue,fontSize: 20,fontWeight: FontWeight.w600),),
            ],
          ),
        ),
      )

    );
  }
}
