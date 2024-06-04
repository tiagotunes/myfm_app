import 'package:get/get.dart';
import 'package:myfm/data/repositories/association/country_repository.dart';
import 'package:myfm/features/fm/models/country_model.dart';
import 'package:myfm/utils/popups/loaders.dart';

class CountryController extends GetxController {
  static CountryController get instance => Get.find();

  final isLoading = false.obs;
  final _countryRepository = Get.put(CountryRepository());
  final RxList<CountryModel> allCountries = <CountryModel>[].obs;
  final RxList<CountryModel> activeCountries = <CountryModel>[].obs;
  final RxList<CountryModel> activeCountriesOrderNationality =
      <CountryModel>[].obs;

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
      // Sort alphabetically countries
      allCountries.sort((a, b) {
        if (int.parse(a.id) >= int.parse(b.id)) {
          return 1;
        } else {
          return -1;
        }
      });

      // Filter active countries
      activeCountries.assignAll(allCountries.where((c) => c.active).toList());

      // Order active countries by nationality
      activeCountriesOrderNationality.assignAll(activeCountries);
      activeCountriesOrderNationality.sort((a, b) {
        return a.nationality.compareTo(b.nationality);
      });
    } catch (e) {
      TLoaders.errorSnackbar(title: 'Error', message: e.toString());
    } finally {
      // Remove loader
      isLoading.value = false;
    }
  }

  // Load selected data
}
