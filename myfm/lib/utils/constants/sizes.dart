import 'package:myfm/utils/device/device_utility.dart';
import 'package:myfm/utils/helpers/helper_functions.dart';

class TSizes {
  // Padding and margin sizes
  static const double xs = 4.0;
  static const double sm = 8.0;
  static const double md = 16.0;
  static const double lg = 24.0;
  static const double xl = 32.0;

  // Icon sizes
  static const double iconXs = 12.0;
  static const double iconSm = 16.0;
  static const double iconMd = 24.0;
  static const double iconLg = 32.0;

  // Font sizes
  static const double fontSizeXs = 12.0;
  static const double fontSizeSm = 14.0;
  static const double fontSizeMd = 16.0;
  static const double fontSizeLg = 18.0;

  // Button sizes
  static const double buttonWidth = 120.0;
  static const double buttonHeight = 18.0;
  static const double buttonRadius = 5.0;

  // AppBar sizes
  static const double appBarHeight = 56.0;

  // Image sizes
  static const double imageThumbSize = 80.0;

  // Default Spacing between sections
  static const double defaultSpace = 24.0;
  static const double spaceBtwItems = 16.0;
  static const double spaceBtwSections = 32.0;

  // Border radius sizes
  static const double borderRadiusSm = 4.0;
  static const double borderRadiusMd = 8.0;
  static const double borderRadiusLg = 12.0;

  // Bottom Sheet sizes
  static const double bottomSheetRadius = 16.0;

  // Divider height
  static const double dividerHeight = 1.0;

  // Team Card dimensions
  static const double teamImageSize = 120.0;
  static const double teamImageRadius = 16.0;
  static const double teamImageHeight = 170.0;
  static const double teamCardVerticalWidth = 180.0;

  // Player Card dimensions
  static const double playerImageSize = 120.0;
  static const double playerImageRadius = 16.0;
  static const double playerImageHeight = 125.0;
  static const double playerCardVerticalWidth = 150.0;

  // Input Field
  static const double inputFieldRadius = 12.0;
  static const double spaceBtwInputFields = 25.0;
  static const double spaceBtwLabelInputField = 7.0;

  // Card sizes
  static const double cardRadiusXs = 6.0;
  static const double cardRadiusSm = 10.0;
  static const double cardRadiusMd = 12.0;
  static const double cardRadiusLg = 16.0;
  static const double cardElevation = 2.0;

  // Image carousel height
  static const double imageCarouselHeight = 200.0;

  // Loading Indicator size
  static const double loadingIndicatorSize = 36.0;

  // Grid view spacing
  static const double gridViewSpacing = 16.0;

  // Form Field height
  static double formFieldHeight = THelperFunctions.screenHeight() -
      TDeviceUtils.getAppBarHeight() -
      TDeviceUtils.getStatusBarHeight() -
      TSizes.defaultSpace * 9;
}
