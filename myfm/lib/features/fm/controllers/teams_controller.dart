import 'package:get/get.dart';
import 'package:myfm/data/repositories/team/team_repository.dart';
import 'package:myfm/features/personalization/controllers/user_controller.dart';
import 'package:myfm/features/personalization/models/team_model.dart';
import 'package:myfm/utils/popups/loaders.dart';

class TeamsController extends GetxController {
  static TeamsController get instance => Get.find();

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
        if (a.dtAct == null && b.dtAct == null) {
          return DateTime.parse(b.dtCri).compareTo(DateTime.parse(a.dtCri));
        } else if (a.dtAct == null) {
          return 1;
        } else if (b.dtAct == null) {
          return -1;
        } else {
          return DateTime.parse(b.dtAct!).compareTo(DateTime.parse(a.dtAct!));
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
