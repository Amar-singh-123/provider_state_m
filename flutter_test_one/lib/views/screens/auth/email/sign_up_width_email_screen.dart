import 'package:flutter/material.dart';
import 'package:flutter_test_one/controllers/controllers/auth_controllers/auth_controller.dart';
import 'package:flutter_test_one/views/screens/app_widgets/AppWidgets.dart';
import 'package:flutter_test_one/views/screens/auth/email/login_with_email_screen.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SignUpWithEmailScreen extends StatefulWidget {
  const SignUpWithEmailScreen({super.key});

  @override
  State<SignUpWithEmailScreen> createState() => _SignUpWithEmailScreenState();
}

class _SignUpWithEmailScreenState extends State<SignUpWithEmailScreen> {
  var isAgreed = false;
  AppAuthController appAuthController = AppAuthController();
  @override
  Widget build(BuildContext context) {
    AppWidgets appWidgets = AppWidgets(context: context);
    void handleSignUpClick() {
      if (isAgreed) {
        appAuthController.signUpWithEmail(
            email: appAuthController.emailSignUpFieldController.text,
            password: appAuthController.passwordSignUpFieldController.text,
            firstname: appAuthController.firstNameFieldController.text,
            lastName: appAuthController.lastNameFieldController.text,
        context: context);
      } else {
        Fluttertoast.showToast(msg: "Please Agree the Terms....");
      }
    }

    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            AppWidgets.titleAndDesTv(
                title: "Sign Up Here", desc: "Lets Get Started..."),
            appWidgets.editField(
                controller: appAuthController.firstNameFieldController,
                level: "First Name",
                hint: "Enter Your First Name"),
            appWidgets.editField(
                controller: appAuthController.lastNameFieldController,
                level: "Last Name",
                hint: "Enter Your Last Name"),
            appWidgets.editField(
                controller: appAuthController.emailSignUpFieldController,
                level: "Email",
                hint: "Enter Your Email"),
            appWidgets.editField(
                controller: appAuthController.passwordSignUpFieldController,
                level: "Password",
                hint: "Enter Your Password"),
            Center(
              child: SizedBox(
                width:appWidgets.screenWidth() * 0.8,
                child: CheckboxListTile(
                    value: isAgreed,
                    title: Text("Agree Terms and Conditions...."),
                    onChanged: (val) {
                        isAgreed = val!;
                        setState(() {

                        });
                    }),
              ),
            ),
            appWidgets.elevatedButton(
                onPressed: () {
                  handleSignUpClick();
                },
                text: "SIGNUP"),
            appWidgets.elevatedButton(
                onPressed: () {
                  AppWidgets.navigateScreen(
                      screen: LoginWithEmailScreen(), context: context);
                },
                text: "or Login"),
          ],
        ),
      ),
    );
  }
}
