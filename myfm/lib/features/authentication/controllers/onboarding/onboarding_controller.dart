import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:myfm/features/authentication/screens/login/login.dart';

class OnBoardingController extends GetxController {
  static OnBoardingController get instance => Get.find();

  // Variables
  final pageController = PageController();
  Rx<int> currentPageIndex = 0.obs;
  final int nPages = 4;

  // Update Curretn Index when Page Scroll
  void updatePageIndicator(index) {
    currentPageIndex.value = index;
    pageController.jumpToPage(index);
  }

  // Jump to the specific dot selected page
  void dotNavigationClick(index) {
    currentPageIndex.value = index;
    pageController.jumpToPage(index);
  }

  // Update Current Index & jump to next page
  void nextPage() {
    if (currentPageIndex.value == nPages - 1) {
      Get.offAll(() => const LoginScreen());
    } else {
      int page = currentPageIndex.value + 1;
      pageController.jumpToPage(page);
    }
  }

  // Jump to the Login Screen
  void skipPage() {
    // Update Current Index & jump to the last page
    // currentPageIndex.value = nPages - 1;
    // pageController.jumpToPage(nPages - 1);
    Get.offAll(() => const LoginScreen());
  }
}
