import 'package:myfm/utils/constants/image_strings.dart';

class TTexts {
  // Global Texts
  static const String home = "Home";
  static const String name = "Name";
  static const String teams = "Teams";
  static const String total = 'Total';

  // OnBoarding Texts
  static const List<String> onBoardingSubTitle = [
    "A SUCESSFUL COACH PROFILE",
    "MANAGE IT FROM YOUR POCKET",
    "DISCUSS IDEAS WITH OTHER COACHES",
    "THE BEAUTIFUL GAME IT'S IN YOUR HANDS"
  ];
  static const List<String> onBoardingTitle = [
    "CREATE YOUR PROFILE",
    "BUILD YOUR TEAM",
    "SHARE YOUR SAVES",
    "ROAD TO GLORY"
  ];

  // Authentication Headings Text
  static const String accountCreatedSubTitle =
      "Welcome to MyFM:\nYour account is created, let's get things started!";
  static const String accountCreatedTitle = "Your account successfully created";
  static const String createAccountTitle = "Let's create your account";
  static const String forgetPasswordSubTitle =
      "Don't worry sometimes people can forget too, enter your email and we will send you a password reset link.";
  static const String forgetPasswordTitle = "Forget Password";
  static const String loginSubTitle = "Time to Lead Your Team to Victory";
  static const String loginTitle = "Welcome back,";
  static const String passwordResetSubTitle =
      "Your account secuirty is our priority. We've sent you a secure link to safety change your password and keep your account proteced.";
  static const String passwordResetTitle = "Password reset email sent";
  static const String verifyEmailSubTitle =
      "Congratulations! Your account awaits:\nVerify your email to start manage your teams.";
  static const String verifyEmailTitle = "Verify your email address";

  // Authentication Form Text
  static const String and = "and";
  static const String tContinue = "continue";
  static const String createAccount = "Create Account";
  static const String dob = "Date of Birth";
  static const String done = "done";
  static const String email = "E-mail";
  static const String forgetPassword = "Forget Password?";
  static const String iAgreeTo = "I agree to";
  static const String nationality = "Nationality";
  static const String orSignInWith = "or sign in with";
  static const String orSignUpWith = "or sign up with";
  static const String password = "Password";
  static const String privacyPolicy = "Privacy Policy";
  static const String remeberMe = "Remember Me";
  static const String resendEmail = "Resend Email";
  static const String signIn = "Sign In";
  static const String skip = "skip";
  static const String submit = "Submit";
  static const String termsOfUse = "Terms of use";
  static const String username = "Username";

  // Navigation Menu Text
  static const String profile = "Profile";
  static const String search = "Search";
  static const String settings = "Settings";

  // Search Tabbar Text
  static const List<String> searchTabbar = [
    "All",
    "Users",
    teams,
    "Posts",
  ];

  // Team Tabbar Text
  static const List<String> teamTabbar = [
    home,
    "Squad",
    "Competitions",
    "Transfers",
    "Club",
    "Finances",
  ];

  // Team Transfers Tab Text
  static const String fee = "fee";
  static const String from = "from";
  static const String noTransfers = "No transfers to display";
  static const String to = "to";
  static const String transfersIn = "transfers in";
  static const String transfersOut = "transfers out";

  // Personalization Screens Text
  static const String basic = "basic";
  static const String bankBalance = "bank balance";
  static const String chooseImage = "choose image";
  static const String color = "color";
  static const String country = "Country";
  static const String season = "Season";
  static const String finances = "finances";
  static const String images = "images";
  static const String logo = "logo";
  static const String kit = "kit";
  static const String playerDetails = "player details";
  static const String squadBudget = "squad budget";
  static const String stadium = "stadium";
  static const String teamDetails = "team details";
  static const String wageBudget = "wage budget";

  // Settings Screen Text
  static const String account = "Account";
  static const String app = "App";
  static const String biometricAuth = "Biometric Authentication";
  static const String closeAccount = "Close account";
  static const String currency = "Currency";
  static const String language = "Language";
  static const String logout = "Logout";
  static const String notifications = "Notifications";
  static const String privacy = "Privacy";
  static const String saved = "Saved";
  static const String theme = "Theme";
  static const String wageDisplay = "Wage Display";

  // Card Text
  static const String years = "years";

  // Color Picker Text
  static const String selectColor = "Select color";
  static const String selectColorShade = "Select color shade";

  // Form Colors
  static const List<String> formColors = [
    "White",
    "Yellow",
    "Orange",
    "Pink",
    "Red",
    "Green",
    "Blue",
    "Purple",
    "Black",
    "customColor"
  ];

  // Position and Roles
  static const positionsRoles = {
    "Goalkeeper": {
      "icon": TImages.goalkeeper,
      "pos": {
        "Goalkeeper": [
          "Goalkeeper",
          "Sweeper Keeper",
        ],
      },
    },
    "Defence": {
      "icon": TImages.defence,
      "pos": {
        "DC": [
          "Central Defender",
          "Ball Playing Defender",
          "No-Nonsense Centre Back",
          "Libero",
        ],
        "DL": [
          "Full Back",
          "Inverted Full Back",
          "No-Nonsense Full Back",
          "Wing Back",
          "Inverted Wing Back",
          "Complete Wing Back",
        ],
        "DR": [
          "Full Back",
          "Inverted Full Back",
          "No-Nonsense Full Back",
          "Wing Back",
          "Inverted Wing Back",
          "Complete Wing Back",
        ],
      },
    },
    "Midfield": {
      "icon": TImages.midfield,
      "pos": {
        "DM": [
          "Defensive Midfielder",
          "Ball Winning Midfielder",
          "Deep Lying Playmaker",
          "Roaming Playmaker",
          "Segundo Volante",
          "Anchor Man",
          "Half Back",
          "Regista",
        ],
        "MC": [
          "Central Midfielder",
          "Ball Winning Midfielder",
          "Box To Box Midfielder",
          "Deep Lying Playmaker",
          "Advanced Playmaker",
          "Roaming Playmaker",
          "Carrilero",
          "Mezzala",
        ],
        "ML": [
          "Wide Midfielder",
          "Wide Playmaker",
          "Winger",
          "Defensive Winger",
          "Inverted Winger",
        ],
        "MR": [
          "Wide Midfielder",
          "Wide Playmaker",
          "Winger",
          "Defensive Winger",
          "Inverted Winger",
        ],
      },
    },
    "Attack": {
      "icon": TImages.attack,
      "pos": {
        "AMC": [
          "Attacking Midfielder",
          "Advanced Playmaker",
          "Trequartista",
          "Enganche",
          "Shadow Striker",
        ],
        "AML": [
          "Winger",
          "Inverted Winger",
          "Advanced Playmaker",
          "Inside Forward",
          "Trequartista",
          "Wide Target Man",
          "Raumdeuter",
        ],
        "AMR": [
          "Winger",
          "Inverted Winger",
          "Advanced Playmaker",
          "Inside Forward",
          "Trequartista",
          "Wide Target Man",
          "Raumdeuter",
        ],
        "ST": [
          "Complete Forward",
          "Pressing Forward",
          "Advanced Forward",
          "Deep Lying Forward",
          "Trequartista",
          "Target Man",
          "Poacher",
          "False 9",
        ],
      },
    },
  };
}
