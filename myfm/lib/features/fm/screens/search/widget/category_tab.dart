import 'package:flutter/material.dart';
import 'package:myfm/common/widgets/cards/user/user_show_case.dart';
import 'package:myfm/utils/constants/image_strings.dart';
import 'package:myfm/utils/constants/sizes.dart';

class TCategoryTab extends StatelessWidget {
  const TCategoryTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: const [
        Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              // Users
              TUserShowCase(
                images: [
                  TImages.scp,
                  TImages.scp,
                  TImages.scp,
                ],
              ),

              // User Teams
            ],
          ),
        ),
      ],
    );
  }
}
