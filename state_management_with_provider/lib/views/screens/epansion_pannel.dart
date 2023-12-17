

import 'package:flutter/material.dart';

class ExpansionPannelScreen extends StatefulWidget {
  const ExpansionPannelScreen({super.key});

  @override
  State<ExpansionPannelScreen> createState() => _ExpansionPannelScreenState();
}

class _ExpansionPannelScreenState extends State<ExpansionPannelScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        shrinkWrap: true,
        children: [
          ExpansionPanelList(
            children: [
              
            ],
          )
        ],
      ),
    );
  }
}
