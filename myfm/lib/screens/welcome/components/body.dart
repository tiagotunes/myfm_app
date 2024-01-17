import 'package:flutter/material.dart';
import 'package:myfm/screens/welcome/components/buttons.dart';
import 'package:myfm/screens/welcome/components/header.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Header(),
        Buttons(),
      ],
    );
  }
}
