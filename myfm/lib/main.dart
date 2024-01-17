import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:myfm/configs/size.dart';
import 'package:myfm/configs/theme.dart';
import 'package:myfm/screens/welcome/welcome_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
    SizeConfig().init(context);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My FM',
      theme: theme(),
      home: const WelcomeScreen(),
    );
  }
}
