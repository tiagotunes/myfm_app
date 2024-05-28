import 'package:get/get.dart';
import 'package:myfm/data/repositories/associations/country_repository.dart';
import 'package:myfm/features/fm/models/country_model.dart';
import 'package:myfm/utils/popups/loaders.dart';

class CountryController extends GetxController {
  static CountryController get instance => Get.find();

  final isLoading = false.obs;
  final _countryRepository = Get.put(CountryRepository());
  final RxList<CountryModel> allCountries = <CountryModel>[].obs;
  final RxList<CountryModel> activeCountries = <CountryModel>[].obs;

  @override
  void onInit() {
    fetchCountries();
    super.onInit();
  }

  // Load Country data
  Future<void> fetchCountries() async {
    try {
      // Show loader while loading countries
      isLoading.value = true;

      // Fetch categories from data source (Firestore, API, etc.)
      final countries = await _countryRepository.getAllCountries();

      // Update the countries list
      allCountries.assignAll(countries);

      // Filter active countries
      activeCountries.assignAll(allCountries.where((c) => c.active).toList());

      // Sort alphabetically countries
      activeCountries.sort((a, b) => a.nationality.compareTo(b.nationality));
    } catch (e) {
      TLoaders.errorSnackbar(title: 'Error', message: e.toString());
    } finally {
      // Remove loader
      isLoading.value = false;
    }
  }

  // Load selected data
}
