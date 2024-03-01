import 'package:flutter/material.dart';
import 'package:myfm/utils/constants/colors.dart';

class TMessageCounterIcon extends StatelessWidget {
  const TMessageCounterIcon({
    super.key,
    required this.onPressed,
    required this.iconColor,
  });

  final VoidCallback onPressed;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.inbox_outlined,
            color: iconColor,
          ),
        ),
        Positioned(
          right: 0,
          child: Container(
            width: 18,
            height: 18,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(100),
            ),
            child: Center(
                child: Text(
              '2',
              style: Theme.of(context).textTheme.labelLarge!.apply(
                    color: TColors.white,
                    fontSizeFactor: 0.8,
                  ),
            )),
          ),
        )
      ],
    );
  }
}
