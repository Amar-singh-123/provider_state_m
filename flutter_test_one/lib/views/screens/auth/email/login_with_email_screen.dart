import 'package:flutter/material.dart';
import 'package:flutter_test_one/controllers/controllers/auth_controllers/auth_controller.dart';
import 'package:flutter_test_one/views/screens/app_widgets/AppWidgets.dart';
import 'package:flutter_test_one/views/screens/auth/email/sign_up_width_email_screen.dart';
import 'package:get_storage/get_storage.dart';

class LoginWithEmailScreen extends StatefulWidget {
  const LoginWithEmailScreen({super.key});

  @override
  State<LoginWithEmailScreen> createState() => _LoginWithEmailScreenState();
}

class _LoginWithEmailScreenState extends State<LoginWithEmailScreen> {
  @override
  Widget build(BuildContext context) {
    AppWidgets appWidgets = AppWidgets(context: context);
    AppAuthController appAuthController = AppAuthController();
    void handleLoginClick() {
      appAuthController.loginWithEmail(
          email: appAuthController.emailLoginFieldController.text,
          password: appAuthController.passwordLoginFieldController.text, context: context);
    }

    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            AppWidgets.titleAndDesTv(title: "Login Here", desc: "Lets Get Started..."),
            appWidgets.editField(
                controller: appAuthController.emailLoginFieldController,
                level: "Email",
                hint: "Enter Your Email"),
            appWidgets.editField(
                controller: appAuthController.passwordLoginFieldController,
                level: "Password",
                hint: "Enter Your Password"),
            appWidgets.elevatedButton(
                onPressed: () {
                  handleLoginClick();
                },
                text: "LOGIN"),
            appWidgets.elevatedButton(
                onPressed: () {
                  AppWidgets.navigateScreen(
                      screen: SignUpWithEmailScreen(), context: context
                  );
                },
                text: "or Sign Up"),
          ],
        ),
      ),
    );
  }
}
