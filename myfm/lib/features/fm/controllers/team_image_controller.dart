import 'package:get/get.dart';

class ImageController extends GetxController {
  static ImageController get instance => Get.find();

  final imageCurrentIndex = 0.obs;
  final nImages = 3;

  void updateImageIndicator(index) {
    if (index == nImages - 1) {
      imageCurrentIndex.value = 0;
    } else {
      imageCurrentIndex.value = index + 1;
    }
  }
}
