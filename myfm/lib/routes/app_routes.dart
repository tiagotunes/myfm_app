import 'package:get/get.dart';
import 'package:myfm/features/authentication/screens/login/login.dart';
import 'package:myfm/features/authentication/screens/onboarding/onboarding.dart';
import 'package:myfm/features/authentication/screens/password_configuration/forget_password.dart';
import 'package:myfm/features/authentication/screens/signup/signup.dart';
import 'package:myfm/features/authentication/screens/signup/verify_email.dart';
import 'package:myfm/features/fm/screens/home/home.dart';
import 'package:myfm/features/fm/screens/teams/teams.dart';
import 'package:myfm/features/personalization/screens/profile/profile.dart';
import 'package:myfm/features/personalization/screens/settings/settings.dart';
import 'package:myfm/routes/routes.dart';

class AppRoutes {
  static final pages = [
    GetPage(name: TRoutes.home, page: () => const HomeScreen()),
    GetPage(
        name: TRoutes.forgetPassword, page: () => const ForgetPasswordScreen()),
    GetPage(name: TRoutes.onBoarding, page: () => const OnBoardingScreen()),
    GetPage(name: TRoutes.settings, page: () => const SettingsScreen()),
    GetPage(name: TRoutes.signIn, page: () => const LoginScreen()),
    GetPage(name: TRoutes.signup, page: () => const SignupScreen()),
    GetPage(name: TRoutes.teams, page: () => const TeamsScreen()),
    GetPage(name: TRoutes.userProfile, page: () => const ProfileScreen()),
    GetPage(name: TRoutes.verigyEmail, page: () => const VerifyEmailScreen()),
  ];
}
