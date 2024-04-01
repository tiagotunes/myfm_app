import 'package:flutter/material.dart';
import 'package:myfm/common/widgets/appbar/appbar.dart';
import 'package:myfm/common/widgets/appbar/tabbar.dart';
import 'package:myfm/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:myfm/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:myfm/common/widgets/layouts/grid_layout.dart';
import 'package:myfm/common/widgets/text/appbar_title_text.dart';
import 'package:myfm/common/widgets/images/circular_image.dart';
import 'package:myfm/common/widgets/text/flag_label_text_with_icon.dart';
import 'package:myfm/utils/constants/colors.dart';
import 'package:myfm/utils/constants/enums.dart';
import 'package:myfm/utils/constants/image_strings.dart';
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
                expandedHeight: 300,
                flexibleSpace: Padding(
                  padding: const EdgeInsets.all(TSizes.defaultSpace),
                  child: ListView(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      // Search bar
                      // SizedBox(height: TSizes.spaceBtwItems),
                      const TSearchContainer(
                        text: '',
                        showBackground: false,
                        padding: EdgeInsets.zero,
                      ),
                      const SizedBox(height: TSizes.spaceBtwSections),

                      // TSectionHeading(
                      //   title: 'Featured Brands',
                      //   showActionButton: true,
                      //   onPressed: () {},
                      // ),
                      // const SizedBox(height: TSizes.spaceBtwItems / 1.5),

                      TGridLayout(
                        itemCount: 2,
                        mainAxisExtent: 70,
                        itemBuilder: (_, index) {
                          return GestureDetector(
                            onTap: () {},
                            child: TRoundedContainer(
                              padding: const EdgeInsets.all(TSizes.sm),
                              showBorder: true,
                              backgroundColor: Colors.transparent,
                              child: Row(
                                children: [
                                  // Image
                                  Flexible(
                                    child: TCircularImage(
                                      image: TImages.user,
                                      backgroundColor: Colors.transparent,
                                      overlayColor:
                                          THelperFunctions.isDarkMode(context)
                                              ? TColors.white
                                              : TColors.black,
                                    ),
                                  ),
                                  const SizedBox(
                                      width: TSizes.spaceBtwItems / 2),

                                  // Text
                                  Expanded(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const TFlagLabelWithIconText(
                                          label: 'User',
                                          labelSize: TextSizes.large,
                                        ),
                                        Text(
                                          '123 followers',
                                          overflow: TextOverflow.ellipsis,
                                          style: Theme.of(context)
                                              .textTheme
                                              .labelMedium,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      )
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
              // const Padding(
              //   padding: EdgeInsets.all(TSizes.defaultSpace),
              //   child: Column(
              //     children: [
              //       // Users
              //       TRoundedContainer(
              //         showBorder: true,
              //         borderColor: TColors.darkGrey,
              //         backgroundColor: Colors.transparent,
              //         margin: EdgeInsets.only(bottom: TSizes.spaceBtwItems),
              //         child: Column(
              //           children: [

              //           ],
              //         ),
              //       )
              //     ],
              //   ),
              // ),
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
