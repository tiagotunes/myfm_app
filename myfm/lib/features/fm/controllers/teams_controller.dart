import 'package:get/get.dart';
import 'package:myfm/data/repositories/team/team_repository.dart';
import 'package:myfm/features/personalization/models/team_model.dart';
import 'package:myfm/utils/popups/loaders.dart';

class TeamsController extends GetxController {
  static TeamsController get instance => Get.find();

  final isLoading = false.obs;
  final _teamRepository = Get.put(TeamRepository());
  RxList<TeamModel> allTeams = <TeamModel>[].obs;

  @override
  void onInit() {
    fetchTeams();
    super.onInit();
  }

  @override
  void refresh() {
    fetchTeams();
    super.refresh();
  }

  Future<void> fetchTeams() async {
    try {
      // Show loader while loading categories
      isLoading.value = true;

      // Fetch teams from data source
      final teams = await _teamRepository.getAllTeams();

      // Update the teams list
      allTeams.assignAll(teams);
    } catch (e) {
      TLoaders.errorSnackbar(title: 'Error', message: e.toString());
    } finally {
      // Remove Loader
      isLoading.value = false;
    }
  }

  // Load User Teams
}
