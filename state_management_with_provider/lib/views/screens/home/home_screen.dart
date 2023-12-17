import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management_with_provider/controllers/controllers/providers/counter_provider.dart';
import 'package:state_management_with_provider/controllers/controllers/providers/theme_handler_provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var countProvider = Provider.of<CountProvider>(context);
    ThemeHandlerProvider themeHandlerProvider = Provider.of<ThemeHandlerProvider>(context);
    return Scaffold(
      appBar: AppBar(
          title: Text("Counter"),
          backgroundColor: Colors.purpleAccent,
          actions: [
            showThemeHandleSwitch(provider:themeHandlerProvider),
          ]),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Center(child: Text("${countProvider.num}"))],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          countProvider.increaseNum();
        },
        child: Icon(Icons.add),
      ),
    );
  }

 Widget showThemeHandleSwitch({required ThemeHandlerProvider provider}) {

    return Switch(value:provider.isDarkModeEnabled , onChanged: (val){

      provider.setDarkMode = val;
    });
 }
}
