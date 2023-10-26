import 'package:final_year_project/auth/api/apis.dart';
import 'package:final_year_project/auth/loginScreen.dart';
import 'package:final_year_project/components/emailField.dart';
import 'package:final_year_project/components/imageField.dart';
import 'package:final_year_project/components/txtfield.dart';
import 'package:final_year_project/mapScreens/locationScreen.dart';
import 'package:final_year_project/model/Model.dart';
import 'package:final_year_project/view/discScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({
    super.key,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List images = [
    "assets/images/river.jpg",
    "assets/images/DHQ hospital.jpg",
    "assets/images/civalhospital.jpg",
    "assets/images/shalimar hotel.jpg",
    "assets/images/national club.jpg",
    "assets/images/mufti mehmood hospital.jpg",
  ];
  var categories = [
    'Sindh River',
    'DHQ Hospital',
    'Civil Hospital',
    'Shalimar Hotel',
    'National Club',
    'Mufti Mehmood Hospital',
  ];

  var descrip = [
    'Dera Ismail Khan is situated on the west bank of the Indus River, at its junction with the Gomal River.',
    'DHQ Teaching Hospital Dera Ismail Khan.One of the leading Trauma center of Khyber Pakhtukhuwa, Pakistan.',
    'Civil Hospital Police line Dera Ismail Khan Contact Details ; Address: RW93+7JH, Dera Ismail Khan, Khyber Pakhtunkhwa ; Section: Hospitals and Local Clinics.',
    'Shalimar Hotel Dera Ismail Khan ; Address, Dera Ismail Khan, Khyber Pakhtunkhwa, Pakistan.The phone number for Shalimar Hotel Dera Ismail Khan is 0344 9399700',
    'View deals for National Club, including fully refundable rates with free cancellation. Breakfast, WiFi, and parking are free at this hotel.',
    'Mufti Mehmood Memorial Teaching Hospital MTI Dera Ismail Khan, Dera Ismail Khan.',
  ];

  List<ChatUser> list = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    APIs.getSelfInfo();
  }

  late Size mq = MediaQuery.of(context).size;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        elevation: 0.5,
        backgroundColor: Colors.white,
        actions: [
          GestureDetector(
            onTap: () async {
              await FirebaseAuth.instance.signOut();
              await GoogleSignIn().signOut().then((value) {
                Get.to(() => LoginScreen());
              }).onError((error, stackTrace) {
                Get.snackbar('Error', error.toString());
              });
            },
            child: Icon(
              Icons.logout,
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.05,
          ),
        ],
      ),
      drawer: Drawer(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: StreamBuilder(
              stream: APIs.Firestore.collection('users').snapshots(),
              builder: (context, snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.waiting:
                  case ConnectionState.none:
                    return Center(child: CircularProgressIndicator());

                  case ConnectionState.active:
                  case ConnectionState.done:
                    final data = snapshot.data?.docs;
                    list = data
                            ?.map((e) => ChatUser.fromJson(e.data()))
                            .toList() ??
                        [];
                    if (list.isNotEmpty) {
                      return Column(
                        children: [
                          SizedBox(
                            height: mq.height * 0.02,
                          ),
                          Container(
                            alignment: Alignment.centerRight,
                            child: IconButton(
                                color: Colors.black,
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                icon: Icon(
                                  Icons.close,
                                )),
                          ),
                          imageField(user: APIs.me),
                          SizedBox(
                            height: mq.height * 0.06,
                          ),
                          nameField(user: APIs.me),
                          SizedBox(
                            height: mq.height * 0.04,
                          ),
                          emailField(user: APIs.me),
                          SizedBox(
                            height: mq.height * 0.03,
                          ),
                          Text("This data is taken from your Email account."),
                          SizedBox(
                            height: mq.height * 0.04,
                          ),
                          Container(
                            alignment: Alignment.centerRight,
                            child: ElevatedButton(
                                onPressed: () async {
                                  await FirebaseAuth.instance.signOut();
                                  await GoogleSignIn().signOut().then((value) {
                                    Get.to(() => LoginScreen());
                                  }).onError((error, stackTrace) {
                                    Get.snackbar('Error', error.toString());
                                  });
                                },
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.white),
                                child: Text(
                                  'LogOut',
                                  style: TextStyle(color: Colors.black),
                                )),
                          ),
                        ],
                      );
                    } else {
                      return Center(child: Text('Some thing went wrong'));
                    }
                }
              }),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: 8.0,
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                        child: Container(
                            height: 200,
                          child: ListView.builder(
                            itemCount: 6,
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            itemBuilder: (BuildContext context, int index) {
                             return InkWell(
                              onTap: () {},
                              child: Container(
                                padding: EdgeInsets.all(20),
                                margin: EdgeInsets.symmetric(horizontal: 7.5),
                                width: 160,
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(15),
                                  image: DecorationImage(
                                    image: AssetImage(
                                        "assets/images/city${index + 1}.jpg"),
                                    fit: BoxFit.cover,
                                    opacity: 0.7,
                                  ),
                                ),
                                child: Column(
                                  children: [
                                    Container(
                                      alignment: Alignment.topRight,
                                      child: Icon(
                                        Icons.bookmark_border,
                                        color: Colors.white,
                                      ),
                                    ),
                                    Spacer(),
                                    Container(
                                      alignment: Alignment.bottomLeft,
                                      child: Text(
                                        categories[index],
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }),
                    )),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,

                        ),
                        onPressed: () {
                          Get.to(() => LocationScreen());
                        },
                        child: Text(
                          "Get started",
                          style: TextStyle(color: Colors.black),
                        )),
                    SizedBox(
                      width: 10,
                    ),
                  ],
                ),
                Column(
                  children: [
                    Container(
                      height: 450,
                      child: ListView.builder(
                          physics: BouncingScrollPhysics(),
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemCount: images.length,
                          itemBuilder: (BuildContext context, index) {
                            return Padding(
                              padding: EdgeInsets.all(15),
                              child: GestureDetector(
                                onTap: () {
                                  Get.to(() => DescScreen({
                                        'background': images[index],
                                        'title': categories[index],
                                        'desc': descrip[index],
                                      }));
                                },
                                child: Hero(
                                  tag: images[index],
                                  child: Container(
                                    height: 200,
                                    child: Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Column(
                                        children: [
                                          Spacer(),
                                          Container(
                                              alignment: Alignment.bottomLeft,
                                              child: Text(
                                                categories[index],
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              )),
                                        ],
                                      ),
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.black,
                                      borderRadius: BorderRadius.circular(15),
                                      image: DecorationImage(
                                          image: AssetImage(images[index]),
                                          fit: BoxFit.cover,
                                          opacity: 0.8),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          }),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
