import 'package:flutter/material.dart';
import 'package:myfm/common/widgets/appbar/appbar.dart';
import 'package:myfm/features/personalization/screens/team/widgets/team_form_page_view.dart';
import 'package:myfm/utils/constants/image_strings.dart';
import 'package:myfm/utils/constants/sizes.dart';

class TTeamPersonalizationScreen extends StatelessWidget {
  const TTeamPersonalizationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
        showBackArrow: true,
        centerTitle: false,
        title: const Text('Team details'),
        actions: [
          ElevatedButton(
            style: ButtonStyle(
              padding: MaterialStateProperty.all(
                const EdgeInsets.symmetric(
                  vertical: 0,
                  horizontal: TSizes.lg,
                ),
              ),
            ),
            onPressed: () {},
            child: const Row(
              children: [
                Text('Save'),
                SizedBox(width: TSizes.sm),
                Icon(Icons.save_outlined),
              ],
            ),
          ),
        ],
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(TImages.clubOffice),
              fit: BoxFit.fitHeight,
              opacity: 0.3),
        ),
        child: const TTeamFormPageView(),
      ),
    );
  }
}
