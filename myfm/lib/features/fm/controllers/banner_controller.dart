import 'package:get/get.dart';
import 'package:myfm/data/repositories/banner/banner_repository.dart';
import 'package:myfm/features/fm/models/banner_model.dart';
import 'package:myfm/utils/popups/loaders.dart';

class BannerController extends GetxController {
  static BannerController get instance => Get.find();

  // Variables
  final carouselCurrentIndex = 0.obs;
  final isLoading = false.obs;
  final RxList<BannerModel> banners = <BannerModel>[].obs;

  @override
  void onInit() {
    fetchBanners();
    super.onInit();
  }

  // Update Page Navigational Dots
  void updateBannerIndicator(index) {
    carouselCurrentIndex.value = index;
  }

  // Fetch Banners
  Future<void> fetchBanners() async {
    try {
      // Show loader while loading categories
      isLoading.value = true;

      // Fetch banners
      final bannerRepo = Get.put(BannerRepository());
      final auxBanners = await bannerRepo.fetchBanners();
      auxBanners.sort((a, b) {
        if (a.order >= b.order) {
          return 1;
        } else {
          return -1;
        }
      });

      // Assign banners
      banners.assignAll(auxBanners);
    } catch (e) {
      TLoaders.errorSnackbar(title: 'Error', message: e.toString());
    } finally {
      // Remove Loader
      isLoading.value = false;
    }
  }
}
