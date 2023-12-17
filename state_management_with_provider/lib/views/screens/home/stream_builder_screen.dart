
import 'dart:async';

import 'package:flutter/material.dart';

class StreamScreen extends StatefulWidget {
  const StreamScreen({super.key});

  @override
  State<StreamScreen> createState() => _StreamScreenState();
}

class _StreamScreenState extends State<StreamScreen> {
  late StreamController<int> streamController = StreamController<int>();
  var a = 0;
  @override
  Widget build(BuildContext context) {
    setData();
    return Scaffold(
      body: StreamBuilder(
        stream: setData(),
        initialData: 0,
        builder: (context, snapshot) {

          return Center(child: Row(
             mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("data",style: TextStyle(fontSize: 20),),
              SizedBox(width: 30,),
              const Text("->",style: TextStyle(fontSize: 20),),
              SizedBox(width: 30,),
              Text(snapshot.data.toString(),style:TextStyle(fontSize: 20)),
            ],
          ),);
        },

      ),);
  }

Stream<int> setData() {
  Timer.periodic(Duration(seconds: 3), (timer) {
    a+=10;
    streamController.sink.add(a);
  });
  return streamController.stream;
  }


  }

