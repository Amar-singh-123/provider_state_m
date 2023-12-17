import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_test_one/controllers/controllers/auth_controllers/auth_controller.dart';
import 'package:flutter_test_one/views/screens/app_widgets/AppWidgets.dart';
import 'package:flutter_test_one/views/screens/auth/email/login_with_email_screen.dart';
import 'package:flutter_test_one/views/screens/auth/email/sign_up_width_email_screen.dart';
import 'package:flutter_test_one/views/screens/home/home_screen.dart';
import 'package:flutter_test_one/views/screens/intro/intro_screen.dart';
import 'package:get_storage/get_storage.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  var getStorage = GetStorage();

  @override
  void initState() {
    Timer(Duration(seconds: 4), () {
      handleSplash();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff265073),
      body: ListView(

        children: [
          const SizedBox(height: 100,),
          const Center(child: Text("Flutter Test One",style: TextStyle(color: Colors.white,fontSize: 35,),)),
          const SizedBox(height: 100,),
          Center(
            child: ClipRRect(
                borderRadius: BorderRadius.circular(300),
                child: Image.network(
                  'https://images.unsplash.com/photo-1517841905240-472988babdf9?q=80&w=1887&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                  width: 200,
                  height: 200,
                  fit: BoxFit.cover,
                )),
          ),
          SizedBox(height: 10,),
          Center(child: LoadingAnimationWidget.prograssiveDots(color: Colors.white, size: 100)),

        ],
      ),
    );
  }

  void handleSplash() {
    AppAuthController.checkUserIfLogin().then((value)  {
      if(value){
        AppWidgets.navigateScreen(context: context, screen: HomeScreen());
      }
      else{
        var isVisitedToIntroPage =  getStorage.read('isVisitedIntoPage');
        if(isVisitedToIntroPage == true){
          AppWidgets.navigateScreen(context: context, screen: LoginWithEmailScreen());
        }
        else{
          AppWidgets.navigateScreen(context: context, screen: IntroScreen());

        }
      }
    });

  }
}
