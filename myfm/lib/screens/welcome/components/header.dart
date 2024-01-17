import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  const Header({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      'WELCOME\nCOACH',
      style: Theme.of(context).textTheme.titleLarge,
    );
  }
}
