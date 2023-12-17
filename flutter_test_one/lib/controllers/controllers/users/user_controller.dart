
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_test_one/models/users/user_model.dart';

class UserController {

 Stream<UsersModel> getCurrentUserData(){
   var uid = FirebaseAuth.instance.currentUser?.uid.toString();
   var userSnap =  FirebaseFirestore.instance.collection("users").doc(uid).snapshots();
   return userSnap.map((event) => UsersModel.fromJson(event.data()!));

  }
}