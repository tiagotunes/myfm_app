import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myfm/common/widgets/custom_shapes/diagonal_edges/diagonal_rect_widget.dart';
import 'package:myfm/utils/constants/colors.dart';
import 'package:myfm/utils/constants/sizes.dart';
import 'package:myfm/utils/device/device_utility.dart';

class TAppBar extends StatelessWidget implements PreferredSizeWidget {
  const TAppBar({
    super.key,
    this.title,
    this.showBackArrow = false,
    this.centerTitle = true,
    this.leadingIcon,
    this.actions,
    this.leadingOnPressed,
    this.diagonalRectColor = TColors.primary,
    this.wDiagonalRect = false,
  });

  final Widget? title;
  final bool showBackArrow, centerTitle, wDiagonalRect;
  final Color diagonalRectColor;
  final IconData? leadingIcon;
  final List<Widget>? actions;
  final VoidCallback? leadingOnPressed;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        wDiagonalRect
            ? TDiagonalRect(
                height: TDeviceUtils.getAppBarHeight() * 3.5,
                width: TSizes.defaultSpace * 3,
                color: diagonalRectColor,
                first: false,
              )
            : const SizedBox(),
        wDiagonalRect
            ? TDiagonalRect(
                height: TDeviceUtils.getAppBarHeight() * 3.5,
                width: TSizes.defaultSpace * 3,
                color: diagonalRectColor,
                first: true,
              )
            : const SizedBox(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: TSizes.sm),
          child: AppBar(
            centerTitle: centerTitle,
            automaticallyImplyLeading: false,
            leading: showBackArrow
                ? IconButton(
                    onPressed: () => Get.back(),
                    icon: const Icon(Icons.arrow_back_ios),
                  )
                : leadingIcon != null
                    ? IconButton(
                        onPressed: leadingOnPressed,
                        icon: Icon(leadingIcon),
                      )
                    : null,
            title: title,
            actions: actions,
          ),
        ),
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(TDeviceUtils.getAppBarHeight());
}
