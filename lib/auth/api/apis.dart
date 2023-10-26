

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_year_project/model/Model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class APIs{
  static FirebaseAuth auth = FirebaseAuth.instance;


  static FirebaseFirestore Firestore = FirebaseFirestore.instance;

// checking user available or not
  static Future<bool> UserExists()async{
    return (await Firestore.collection('users').doc(auth.currentUser!.uid).get()).exists;
  }

// for storing self information
  static late ChatUser me;

//getting current user info
  static Future<void> getSelfInfo()async{
    await Firestore.collection('users').doc(Users.uid).get().then((user) async {
      if(user.exists){
        me = ChatUser.fromJson(user.data()!);
      }else{
        await CreateUser().then((value) => getSelfInfo());
      }
    });
  }


// for creating new user
  static User get Users => auth.currentUser!;

  static Future<void> CreateUser()async{
    final time = DateTime.now().millisecondsSinceEpoch.toString();

    final chatUser =ChatUser(
        name: Users.displayName.toString(),
        email: Users.email.toString(),
        id: auth.currentUser!.uid,
        image: Users.photoURL.toString()
    );
    return await Firestore.collection('users').doc(Users.uid).set(chatUser.toJson());
  }

}