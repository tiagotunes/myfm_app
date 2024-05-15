import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myfm/features/authentication/controllers/login/login_controller.dart';
import 'package:myfm/utils/constants/colors.dart';
import 'package:myfm/utils/constants/image_strings.dart';
import 'package:myfm/utils/constants/sizes.dart';

class TSocialButtons extends StatelessWidget {
  const TSocialButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        TImages.socialLogos.length * 2 - 1,
        (index) {
          if (index % 2 == 0) {
            return Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: TColors.grey,
                ),
                borderRadius: BorderRadius.circular(100),
              ),
              child: IconButton(
                onPressed: () {
                  if (index == 0) controller.googleSignIn();
                },
                icon: Opacity(
                  opacity: 0.8,
                  child: Image(
                    image: AssetImage(
                      TImages.socialLogos[index ~/ 2],
                    ),
                    width: TSizes.iconMd,
                    height: TSizes.iconMd,
                  ),
                ),
              ),
            );
          } else {
            return const SizedBox(width: TSizes.spaceBtwItems);
          }
        },
      ),
    );
  }
}
