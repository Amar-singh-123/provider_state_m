
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test_one/controllers/controllers/users/user_controller.dart';
import 'package:flutter_test_one/models/users/user_model.dart';
import 'package:flutter_test_one/views/screens/app_widgets/AppWidgets.dart';
import 'package:flutter_test_one/views/screens/auth/email/login_with_email_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
var userController = UserController();
  @override
  Widget build(BuildContext context) {
 AppWidgets appWidgets = AppWidgets(context: context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text('Flutter Test one',style: TextStyle(color: Colors.white),),
        actions: [
          TextButton(onPressed: (){
            FirebaseAuth.instance.signOut().then((value) => AppWidgets.navigateScreen(context: context, screen: const LoginWithEmailScreen()));
          }, child: Text("Logout",style: TextStyle(color: Colors.white),))
        ],
      ),
      body: StreamBuilder<UsersModel>(
        stream: userController.getCurrentUserData(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text("error ");
          }
          else if(snapshot.hasData){
            if (snapshot.data != null) {
              var userData = snapshot.data!;
              return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: Container(
                        width: appWidgets.screenWidth() * 0.9,
                        height: appWidgets.screenHeight() * 0.7,
                        child: Card(
                          color: Color(0xff90c8f4),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 8.0),
                                child: Align(alignment: Alignment.topRight,
                                  child: IconButton(icon: Icon(Icons.edit),
                                      onPressed: () {}),),
                              ),
                              appWidgets.profileImageView(),
                              appWidgets.fieldDataView(fieldName: "First Name ",
                                  value: userData.firstName.toString()),
                              appWidgets.fieldDataView(fieldName: "Last Name ",
                                  value: userData.lastName.toString()),
                              appWidgets.fieldDataView(fieldName: "Email ",
                                  value: userData.email.toString()),
                            ],
                          ),
                        ),
                      ),
                    )
                  ]
              );
            }
            else {
              return Center(child: Text("No data Found"));
            }
          }
          else{
          return Center(child: Text("No data Found"));

          }
        }
      ),
    );
  }

}
