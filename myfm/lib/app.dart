import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myfm/bindings/general_bindings.dart';
import 'package:myfm/routes/app_routes.dart';
import 'package:myfm/utils/constants/colors.dart';
import 'package:myfm/utils/theme/theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      themeMode: ThemeMode.dark,
      theme: TAppTheme.darkTheme,
      darkTheme: TAppTheme.darkTheme,
      initialBinding: GeneralBindings(),
      getPages: AppRoutes.pages,
      home: const Scaffold(
        backgroundColor: TColors.dark,
        body: Center(
          child: CircularProgressIndicator(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
