import 'package:flutter/material.dart';
import 'package:myfm/utils/constants/colors.dart';

class TAppBarTitleText extends StatelessWidget {
  const TAppBarTitleText({
    super.key,
    required this.title,
    this.subtitle,
  });

  final String title;
  final String? subtitle;

  @override
  Widget build(BuildContext context) {
    if (subtitle != null) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            subtitle!,
            style: Theme.of(context)
                .textTheme
                .labelMedium!
                .apply(color: TColors.grey),
          ),
          Text(
            title,
            style: Theme.of(context)
                .textTheme
                .headlineSmall!
                .apply(color: TColors.white),
          ),
        ],
      );
    } else {
      return Text(
        title,
        style: Theme.of(context).textTheme.headlineMedium,
      );
    }
  }
}
