
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test_one/models/users/user_model.dart';
import 'package:flutter_test_one/views/screens/app_widgets/AppWidgets.dart';
import 'package:flutter_test_one/views/screens/auth/email/login_with_email_screen.dart';
import 'package:flutter_test_one/views/screens/auth/email/sign_up_width_email_screen.dart';
import 'package:flutter_test_one/views/screens/home/home_screen.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AppAuthController{


 var auth = FirebaseAuth.instance;


var userDbRef = FirebaseFirestore.instance.collection("users");

  TextEditingController firstNameFieldController = TextEditingController();
  TextEditingController lastNameFieldController = TextEditingController();
  TextEditingController emailSignUpFieldController = TextEditingController();
  TextEditingController passwordSignUpFieldController = TextEditingController();
  TextEditingController emailLoginFieldController = TextEditingController();
  TextEditingController passwordLoginFieldController = TextEditingController();

  signUpWithEmail({required String email,required String password,required String firstname,  required String lastName,required BuildContext context}) async{
   var res = await auth.createUserWithEmailAndPassword(email: email, password: password);
   checkUserAuthStatus( res: res).then((value) {
    if(value){
     var uid = auth.currentUser?.uid.toString();
     UsersModel userData = UsersModel(id: uid,email: email,firstName: firstname,lastName: lastName);
     storeUserDataToFirestore(data:userData, context: context,);
    }
    else{
     Fluttertoast.showToast(msg: "SignUp failed");
    }
   });
  }

  loginWithEmail({required String email,required String password,required BuildContext context}) async{
  var res = await auth.signInWithEmailAndPassword(email: email, password: password);
  checkUserAuthStatus(res: res).then((value) {
  if(value){
   AppWidgets.navigateScreen(screen: const HomeScreen(),context: context);
  }else{
    Fluttertoast.showToast(msg: "Login failed");
  }
 });


  }

 Future<bool> checkUserAuthStatus({required UserCredential res}) async{
   if(res.user != null){
    return true;
   }
   else{
    return false;
   }
  }


  void storeUserDataToFirestore( {required BuildContext context , required UsersModel data}) async{
  await userDbRef.doc(data.id).set(data.toJson()).then((value) {
    AppWidgets.navigateScreen(screen:const HomeScreen(),context: context);
  });
  }

static Future<bool> checkUserIfLogin() async{
  if(FirebaseAuth.instance.currentUser != null){
    return true;
  }
  else{
    return false;
  }
}

}