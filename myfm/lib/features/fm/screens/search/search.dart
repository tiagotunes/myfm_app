import 'package:flutter/material.dart';
import 'package:myfm/common/widgets/appbar/appbar.dart';
import 'package:myfm/common/widgets/appbar/tabbar.dart';
import 'package:myfm/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:myfm/common/widgets/text/appbar_title_text.dart';
import 'package:myfm/features/fm/screens/search/widget/category_tab.dart';
import 'package:myfm/utils/constants/colors.dart';
import 'package:myfm/utils/constants/sizes.dart';
import 'package:myfm/utils/constants/text_strings.dart';
import 'package:myfm/utils/helpers/helper_functions.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: TTexts.searchTabbar.length,
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
                      TSearchContainer(
                        text: '',
                        showBackground: false,
                        padding: EdgeInsets.zero,
                      ),
                      SizedBox(height: TSizes.spaceBtwSections),

                      // TSectionHeading(
                      //   title: 'Featured Users',
                      //   showActionButton: true,
                      //   onPressed: () {},
                      // ),
                      // const SizedBox(height: TSizes.spaceBtwItems / 1.5),

                      // TGridLayout(
                      //   itemCount: 2,
                      //   mainAxisExtent: 70,
                      //   itemBuilder: (_, index) {
                      //     return const TUserCard();
                      //   },
                      // )
                    ],
                  ),
                ),

                // Tabs
                bottom: TTabBar(
                  tabs: List.generate(TTexts.searchTabbar.length,
                      (index) => Tab(child: Text(TTexts.searchTabbar[index]))),
                ),
              ),
            ];
          },

          // Body
          body: const TabBarView(
            children: [
              TCategoryTab(),
              TTmpTabBarView(),
              TTmpTabBarView(),
              TTmpTabBarView(),
            ],
          ),
        ),
      ),
    );
  }
}

class TTmpTabBarView extends StatelessWidget {
  const TTmpTabBarView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(TSizes.defaultSpace),
      child: Center(
        child: Text('TBD'),
      ),
    );
  }
}
