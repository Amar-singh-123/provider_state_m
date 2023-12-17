
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:state_management_with_provider/models/ContactModel.dart';

class ContactScreenWidgets{
  BuildContext context;
  ContactScreenWidgets({required this.context});
double  get screenWidth => MediaQuery.sizeOf(context).width;
double  get screenHeight => MediaQuery.sizeOf(context).height;

Widget editField({required TextEditingController controller,required String hintText,required TextInputType inputType}){
  return Container(
    width: screenWidth * 0.9,
    height: 50,
    margin: const EdgeInsets.symmetric(horizontal: 10,vertical: 15),
    padding: const EdgeInsets.symmetric(horizontal: 20),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      color: const Color(0xffd3d3d3),
    ),
    child: TextFormField(
        keyboardType: inputType,
        controller: controller,
        decoration: InputDecoration(
          hintText: hintText,
          border: InputBorder.none,
        )),
  );
}

Widget  itemView({required ContactModel item , required Widget endIcon}) {
 return ListTile(
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15)),
    title: Text(item.name.toString()),
    subtitle: Text(
      item.contact.toString(),
    ),
    trailing: endIcon,
    tileColor: Color(0xfff2f2f2),
  );
}

}