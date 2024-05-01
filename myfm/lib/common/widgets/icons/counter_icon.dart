import 'package:flutter/material.dart';
import 'package:myfm/utils/constants/colors.dart';

class TCounterIcon extends StatelessWidget {
  const TCounterIcon({
    super.key,
    required this.onPressed,
    required this.iconColor,
    required this.icon,
    this.count,
  });

  final VoidCallback onPressed;
  final Color iconColor;
  final IconData icon;
  final String? count;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        IconButton(
          onPressed: onPressed,
          icon: Icon(
            icon,
            color: iconColor,
          ),
        ),
        count != null
            ? Positioned(
                right: 0,
                child: Container(
                  width: 21,
                  height: 21,
                  decoration: BoxDecoration(
                    color: TColors.primary,
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: Center(
                    child: Text(
                      count!,
                      style: Theme.of(context).textTheme.labelLarge!.apply(
                            color: TColors.white,
                            fontWeightDelta: 1,
                            fontSizeFactor: 0.8,
                          ),
                    ),
                  ),
                ),
              )
            : const SizedBox(),
      ],
    );
  }
}
