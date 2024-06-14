import 'package:get/get.dart';
import 'package:myfm/data/repositories/team/team_repository.dart';
import 'package:myfm/features/personalization/controllers/user_controller.dart';
import 'package:myfm/features/personalization/models/team_model.dart';
import 'package:myfm/utils/popups/loaders.dart';

class TeamController extends GetxController {
  static TeamController get instance => Get.find();

  final isLoading = false.obs;
  final _teamRepository = Get.put(TeamRepository());
  final userController = Get.put(UserController());
  RxList<TeamModel> allTeams = <TeamModel>[].obs;
  RxList<TeamModel> userTeams = <TeamModel>[].obs;

  @override
  void onInit() {
    fetchUserTeams();
    // fetchTeams();
    super.onInit();
  }

  @override
  void refresh() {
    fetchUserTeams();
    // fetchTeams();
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
  Future<void> fetchUserTeams() async {
    try {
      // Show loader while loading categories
      isLoading.value = true;

      // Fetch teams from data source
      var teams =
          await _teamRepository.getUserTeams(userController.user.value.id);
      teams.sort((a, b) {
        if (a.dtAct.isEmpty || b.dtAct.isEmpty) {
          if (int.parse(a.season) < int.parse(b.season)) {
            return 1;
          } else {
            return -1;
          }
        } else {
          if (DateTime.parse(a.dtAct).isBefore(DateTime.parse(b.dtAct))) {
            return 1;
          } else {
            return -1;
          }
        }
      });

      // Update the teams list
      userTeams.assignAll(teams);
    } catch (e) {
      TLoaders.errorSnackbar(title: 'Error', message: e.toString());
    } finally {
      // Remove Loader
      isLoading.value = false;
    }
  }
}
