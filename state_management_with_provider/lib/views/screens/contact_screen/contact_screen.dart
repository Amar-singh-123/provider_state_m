import 'dart:async';

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:state_management_with_provider/models/ContactModel.dart';
import 'package:state_management_with_provider/views/screens/contact_screen/contact_screen_widgets.dart';

class ContactScreen extends StatefulWidget {
  const ContactScreen({super.key});

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  StreamController<List<ContactModel>> contactStreamController =
      StreamController<List<ContactModel>>();
  TextEditingController nameInpController = TextEditingController();
  TextEditingController contactInpController = TextEditingController();
  var count = 1;
  List<ContactModel> itemList = [];

  @override
  Widget build(BuildContext context) {
    ContactScreenWidgets view = ContactScreenWidgets(context: context);
    return Scaffold(
      body: StreamBuilder<List<ContactModel>>(
          stream: fetchContact(),
          builder: (context, snapshot) {
            var cList = snapshot.data!;

            return ListView.separated(
              separatorBuilder: (context, index) => SizedBox(height: 1),
              itemCount: cList.length,
              itemBuilder: (context, index) {
                var item = cList[index];
                return Padding(
                  padding: const EdgeInsets.all(16.0),
                  child:
                      view.itemView(item: item, endIcon: showDeleteIcon(index)),
                );
              },
            );
          },
          initialData: []),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            // updateList();
            showBottomDialog(context);
          },
          child: Icon(Icons.add)),
    );
  }

  Stream<List<ContactModel>> fetchContact() {
    return contactStreamController.stream;
  }

  
  Widget showDeleteIcon(int index) {
    return IconButton(
        onPressed: () {
          itemList.removeAt(index);
          contactStreamController.sink.add(itemList);
        },
        icon: Icon(
          Icons.delete,
          color: Colors.red,
        ));
  }

  void showBottomDialog(BuildContext context) {
    ContactScreenWidgets view = ContactScreenWidgets(context: context);
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Column(
          children: [
            Text("Add New Contact"),
            view.editField(
                controller: nameInpController,
                hintText: "Enter Your Name",
                inputType: TextInputType.name),
            view.editField(
                controller: contactInpController,
                hintText: "Enter Your phone no.",
                inputType: TextInputType.phone),
            ElevatedButton(
              onPressed: () {
                addNewItem(
                    name: nameInpController.text,
                    contact: contactInpController.text,
                    context: context);
              },
              child: Text("add"),
            ),
          ],
        );
      },
    );
  }

  void addNewItem(
      {required String name,
      required String contact,
      required BuildContext context}) {
    var item = ContactModel(name: name, contact: contact);
    itemList.add(item);
    nameInpController.clear();
    contactInpController.clear();
    contactStreamController.sink.add(itemList);
    Navigator.pop(context);
  }
}
