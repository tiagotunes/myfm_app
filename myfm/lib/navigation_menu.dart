import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myfm/features/fm/screens/home/home.dart';
import 'package:myfm/features/fm/screens/search/search.dart';
import 'package:myfm/features/fm/screens/teams/teams.dart';
import 'package:myfm/utils/constants/colors.dart';
import 'package:myfm/utils/constants/text_strings.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());

    return Scaffold(
      bottomNavigationBar: Obx(
        () => NavigationBar(
          height: 80,
          elevation: 0,
          indicatorColor: TColors.darkGrey.withOpacity(0.3),
          selectedIndex: controller.selectedIndex.value,
          onDestinationSelected: (index) =>
              controller.selectedIndex.value = index,
          destinations: const [
            NavigationDestination(
              icon: Icon(Icons.home_rounded),
              label: TTexts.home,
            ),
            NavigationDestination(
              icon: Icon(Icons.search_outlined),
              label: TTexts.search,
            ),
            NavigationDestination(
              icon: Icon(Icons.shield_rounded),
              label: TTexts.teams,
            ),
            NavigationDestination(
              icon: Icon(Icons.person_rounded),
              label: TTexts.profile,
            ),
          ],
        ),
      ),
      body: Obx(() => controller.screens[controller.selectedIndex.value]),
    );
  }
}

class NavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;
  final screens = const [
    HomeScreen(),
    SearchScreen(),
    TeamsScreen(),
    Scaffold(),
  ];
}
