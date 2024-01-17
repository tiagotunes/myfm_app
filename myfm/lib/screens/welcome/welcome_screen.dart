import 'package:flutter/material.dart';
import 'package:myfm/configs/size.dart';
import 'package:myfm/screens/welcome/components/body.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(getProportionateScreenWidth(12)),
          child: const Body(),
        ),
      ),
    );
  }
}
