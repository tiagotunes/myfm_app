class TFirebaseException implements Exception {
  final String code;

  TFirebaseException(this.code);

  String get message {
    switch (code) {
      // Credentials
      case 'invalid-email':
        return 'The email address provided is invalid. Please enter a valid email.';
      case 'email-already-in-use':
        return 'The email address is already registered. Please use a different email.';
      case 'weak-password':
        return 'The password is too weak. Please choose a stronger password.';
      case 'wrong-password':
        return 'Incorrect password. Please check your password and try again';
      case 'invalid-credential':
        return 'The supplied credential is malformed or has expired.';
      // User
      case 'user-disabled':
        return 'This user account has been disable. Please contact support for assistance.';
      case 'user-not-found':
        return 'No user found for the given email or UID.';
      // Codes
      case 'invalid-custom-token':
        return 'The custom token format is incorrect. Please check your custom token.';
      case 'custom-token-mismatch':
        return 'The custom token corresponds to a different audience.';
      case 'invalid-verification-code':
        return 'Invalid verification code. Please enter a valid code.';
      case 'invalid-verification-id':
        return 'Invalid verfication ID. Please request a valid code.';
      // Others
      case 'unkown':
        return 'An unexpected Firebase Exception occurred. Please try again.';
      case 'provider-already-linked':
        return 'The account is already linked with another provider.';
      case 'oeration-not-allowed':
        return 'This operation is not allowed. Contact support for assistance.';
      case 'keychain-error':
        return 'A keychain error ocurred. Please check the keychain and try again.';
      case 'app-not-authorized':
        return 'The app is not authorized to use Firebase Authentication with the provided API key.';
      case 'captcha-check-failed':
        return 'The reCAPTCHA response is invalid. Please try again.';
      case 'internal-error':
        return 'An internal authentication error occurred. Please try again.';
      // ---
      default:
        return 'An unexpected Firebase Exception occurred. Please try again.';
    }
  }
}
