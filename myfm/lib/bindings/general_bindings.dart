import 'package:get/get.dart';
import 'package:myfm/features/personalization/controllers/country_controller.dart';
import 'package:myfm/utils/helpers/network_manager.dart';

class GeneralBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(NetworkManager());
    Get.put(CountryController());
  }
}
