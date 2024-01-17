import 'package:flutter/material.dart';
import 'package:myfm/configs/color.dart';
import 'package:myfm/configs/size.dart';
import 'package:myfm/screens/sign_in/sign_in_screen.dart';
import 'package:myfm/screens/sign_up/sign_up_screen.dart';

class Buttons extends StatefulWidget {
  const Buttons({super.key});

  @override
  State<Buttons> createState() => _ButtonsState();
}

class _ButtonsState extends State<Buttons> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Column(
          children: [
            buildButton(context, () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SignUpScreen()),
              );
            }, 'SIGN UP', secundary: true),
            SizedBox(height: getProportionateScreenHeight(10)),
            buildButton(context, () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SignInScreen()),
              );
            }, 'SIGN IN'),
          ],
        ),
      ],
    );
  }

  Container buildButton(
      BuildContext context, VoidCallback function, String text,
      {bool secundary = false}) {
    return Container(
      height: getProportionateScreenHeight(50),
      width: getProportionateScreenWidth(150),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: secundary
              ? Border.all(color: Colors.white.withOpacity(0.2), width: 3)
              : null,
          gradient: !secundary ? kGradientColor : null),
      child: TextButton(
        onPressed: function,
        child: Text(
          text,
          style: secundary
              ? Theme.of(context)
                  .textTheme
                  .labelLarge
                  ?.copyWith(fontSize: getProportionateScreenWidth(18))
              : Theme.of(context).textTheme.labelLarge,
        ),
      ),
    );
  }
}
