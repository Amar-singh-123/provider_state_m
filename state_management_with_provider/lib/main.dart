import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management_with_provider/controllers/controllers/providers/counter_provider.dart';
import 'package:state_management_with_provider/controllers/controllers/providers/theme_handler_provider.dart';
import 'package:state_management_with_provider/views/screens/contact_screen/contact_screen.dart';
import 'package:state_management_with_provider/views/screens/home/data_screen.dart';
import 'package:state_management_with_provider/views/screens/home/home_screen.dart';
import 'package:state_management_with_provider/views/screens/home/stream_builder_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MultiProvider(
      providers: [
         ChangeNotifierProvider(create: (context) => CountProvider(),),
         ChangeNotifierProvider(create: (context) => ThemeHandlerProvider(),),
      ],
      child: Consumer<ThemeHandlerProvider>(builder: (context, themeHandlerProvider, child) {
        return  MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme: themeHandlerProvider.currentTheme,
          home:  ContactScreen(),
        );
      },),

    );
  }
}
