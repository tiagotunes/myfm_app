import 'package:flutter/material.dart';
import 'package:myfm/common/widgets/appbar/appbar.dart';
import 'package:myfm/common/widgets/appbar/tabbar.dart';
import 'package:myfm/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:myfm/common/widgets/text/appbar_title_text.dart';
import 'package:myfm/utils/constants/colors.dart';
import 'package:myfm/utils/constants/sizes.dart';
import 'package:myfm/utils/constants/text_strings.dart';
import 'package:myfm/utils/helpers/helper_functions.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        // Appbar
        appBar: const TAppBar(
          centerTitle: false,
          title: TAppBarTitleText(title: TTexts.search),
        ),

        body: NestedScrollView(
          // Header
          headerSliverBuilder: (_, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                automaticallyImplyLeading: false,
                pinned: true,
                floating: true,
                backgroundColor: THelperFunctions.isDarkMode(context)
                    ? TColors.dark
                    : TColors.light,
                expandedHeight: 150,
                flexibleSpace: Padding(
                  padding: const EdgeInsets.all(TSizes.defaultSpace),
                  child: ListView(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    children: const [
                      // Search bar
                      // SizedBox(height: TSizes.spaceBtwItems),
                      TSearchContainer(
                        text: '',
                        showBackground: false,
                        padding: EdgeInsets.zero,
                      ),
                      // const SizedBox(height: TSizes.spaceBtwSections),

                      // TSectionHeading(
                      //   title: 'Featured Brands',
                      //   showActionButton: true,
                      //   onPressed: () {},
                      // ),
                      // const SizedBox(height: TSizes.spaceBtwItems / 1.5),
                    ],
                  ),
                ),

                // Tabs
                bottom: const TTabBar(
                  tabs: [
                    Tab(child: Text(TTexts.all)),
                    Tab(child: Text(TTexts.users)),
                    Tab(child: Text(TTexts.teams)),
                    Tab(child: Text(TTexts.posts)),
                  ],
                ),
              ),
            ];
          },

          // Body
          body: TabBarView(
            children: [
              Padding(
                padding: const EdgeInsets.all(TSizes.defaultSpace),
                child: Center(
                  child: Text(TTexts.all.toUpperCase()),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(TSizes.defaultSpace),
                child: Center(
                  child: Text(TTexts.users.toUpperCase()),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(TSizes.defaultSpace),
                child: Center(
                  child: Text(TTexts.teams.toUpperCase()),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(TSizes.defaultSpace),
                child: Center(
                  child: Text(TTexts.posts.toUpperCase()),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
