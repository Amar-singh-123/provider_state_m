import 'package:flutter/material.dart';
import 'package:flutter_test_one/views/screens/app_widgets/AppWidgets.dart';
import 'package:flutter_test_one/views/screens/auth/email/login_with_email_screen.dart';
import 'package:flutter_test_one/views/screens/auth/email/sign_up_width_email_screen.dart';
import 'package:get_storage/get_storage.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  final getStorage = GetStorage();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.sizeOf(context).width;
    var screenHeight = MediaQuery.sizeOf(context).height;
    AppWidgets appWidgets = AppWidgets(context: context);
    return Scaffold(
      body: ListView(
        children: [
          AppWidgets.titleAndDesTv(title: "Welcome...", desc: "Lets Get Started..."),
          Center(
              child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.network(
              'https://images.unsplash.com/photo-1568399598007-5eead597e2e1?q=80&w=1888&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
              width: screenWidth * 0.8,
              height: screenHeight * 0.6,
              fit: BoxFit.cover,
            ),
          )),
          appWidgets.elevatedButton(
              onPressed: () {
                getStorage.write('isVisitedIntoPage', true);
                AppWidgets.pushNavigateScreen(
                    context: context, screen: SignUpWithEmailScreen());
              },
              text: "Sign Up",
              size: Size(screenWidth * 0.5, 40)),
          appWidgets.elevatedButton(
              onPressed: () {
                AppWidgets.pushNavigateScreen(
                    context: context, screen: LoginWithEmailScreen());
              },
              text: "Login",
              size: Size(screenWidth * 0.5, 40)),
        ],
      ),
    );
  }
}
