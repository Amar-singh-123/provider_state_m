
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DataScreen extends StatefulWidget {
  const DataScreen({super.key});

  @override
  State<DataScreen> createState() => _DataScreenState();
}

class _DataScreenState extends State<DataScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamProvider<int>(
          create: (context) => getAndUpdateNum(),
          initialData: 0,
        updateShouldNotify: (previous, current) => true,
        child: Center(child: Consumer<int>(builder: (context, value, child) => Text(value.toString()),)),
      ),
    );
  }


 Stream<int> getAndUpdateNum() async* {
   var a = 0;

Stream.periodic(Duration(seconds: 5),(computationCount) {
   a+=10;
   return a;

 },);

 }
}
