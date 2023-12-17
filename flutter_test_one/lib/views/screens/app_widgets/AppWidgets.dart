import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppWidgets {
  BuildContext context;

  AppWidgets({required this.context});

  screenWidth() =>
      MediaQuery
          .sizeOf(context)
          .width;

  screenHeight() =>
      MediaQuery
          .sizeOf(context)
          .height;

  Widget editField({required TextEditingController controller, required String level, required String hint}) {
    return SizedBox(
      width: screenWidth() * 0.9,
      height: 100,
      child: Column(

        children: [
          SizedBox(
            width: screenWidth() * 0.8,
              child: Text(level)
          ),
          SizedBox(height: 20,),
          Container(
            width: screenWidth() * 0.9,
            height: 50,
            padding: EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Color(0xfff2f2f2)
            ),
            child: TextFormField(
                controller: controller,
                decoration: InputDecoration(
                  hintText: hint,
                  border: InputBorder.none,
                )),
          ),
        ],
      ),
    );
  }

 static Widget titleAndDesTv({required String title , required String desc}){
    return Column(
      children: [
        const SizedBox(height: 20,),
        Center(child: Text(title,style: TextStyle(fontSize: 22),)),
        Center(child: Text(desc,style: TextStyle(fontSize: 22),)),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
  Widget elevatedButton({required void Function()? onPressed, required String text , Size? size,Color? color} ) {
    return Center(
      child: Container(
        margin: EdgeInsets.all(16),
        child: ElevatedButton(onPressed: onPressed,
          child: Text(text),
          style: ElevatedButton.styleFrom(backgroundColor: color ?? Colors.blueAccent,fixedSize: size ?? Size(screenWidth() * 0.8, 45),textStyle: TextStyle(color: Colors.white)),
            ),
      ));
  }

  Widget fieldDataView({required String fieldName , required String value}){
    return Container(
      margin: EdgeInsets.all(16),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(10)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(child: Text(fieldName)),
          Expanded(child: Text(value)),
        ],
      ),
    );
  }

  Widget profileImageView({String? image}){
    return Container(
      margin: EdgeInsets.all(20),
        child: ClipRRect(borderRadius: BorderRadius.circular(100),child: image != null ? Image.network(image,width: 160,height: 160,fit: BoxFit.cover,) : Icon(Icons.account_circle_rounded,size: 130,)));
  }

 static void navigateScreen({required BuildContext context, required Widget screen}) {
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => screen,));
  }

 static void pushNavigateScreen({required BuildContext context, required Widget screen}) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => screen,));
  }

}