import 'package:get/get.dart';
import 'package:myfm/data/repositories/player/player_repository.dart';
import 'package:myfm/features/personalization/controllers/user_controller.dart';
import 'package:myfm/features/personalization/models/player_model.dart';
import 'package:myfm/utils/popups/loaders.dart';

class PlayersController extends GetxController {
  static PlayersController get instance => Get.find();

  final isLoading = false.obs;
  final _playerRepository = Get.put(PlayerRepository());
  final userController = Get.put(UserController());
  RxList<PlayerModel> userPlayers = <PlayerModel>[].obs;
  RxList<PlayerModel> teamPlayers = <PlayerModel>[].obs;

  // @override
  // void onInit() {
  //   // fetchUserPlayers();
  //   // fetchTeams();
  //   super.onInit();
  // }

  // @override
  // void refresh() {
  //   // fetchUserPlayers();
  //   // fetchTeams();
  //   super.refresh();
  // }

  Future<void> fetchUserPlayers() async {
    try {
      // Show loader while loading players
      isLoading.value = true;

      // Fetch players from data source
      var players =
          await _playerRepository.getUserPlayers(userController.user.value.id);

      // Update the players list
      userPlayers.assignAll(players);
    } catch (e) {
      TLoaders.errorSnackbar(title: 'Error', message: e.toString());
    } finally {
      // Remove Loader
      isLoading.value = false;
    }
  }

  // Future<List<PlayerModel>> getTeamPlayers(String teamId) async {
  //   return userPlayers
  //       .where((p) => p.teamId == teamId && p.freeAgent == 0)
  //       .toList();
  // }

  Future<void> getTeamPlayers(String teamId) async {
    try {
      // Show loader while loading players
      isLoading.value = true;

      // Fetch players from data source
      var players = await _playerRepository.getTeamPlayers(teamId);

      // Update the players list
      teamPlayers.assignAll(players);
    } catch (e) {
      TLoaders.errorSnackbar(title: 'Error', message: e.toString());
    } finally {
      // Remove Loader
      isLoading.value = false;
    }
  }
}
