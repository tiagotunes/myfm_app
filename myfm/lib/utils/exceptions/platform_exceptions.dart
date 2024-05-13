class TPlatformException implements Exception {
  final String code;

  TPlatformException(this.code);

  String get message {
    switch (code) {
      case 'INVALID_LOGIN_CREDENTIALS':
        return 'Invalid login credentials. Please double-check your information.';
      case 'too_many_requests':
        return 'Too many requests. Please try again later.';
      case 'invalid-argument':
        return 'Invalid argument provided to the authentication method.';
      case 'invalid_password':
        return 'Incorrect password. Please try again.';
      case 'invalid-phone-number':
        return 'The provided phone number is invalid.';
      case 'operation-not-allowed':
        return 'The sign.in provider is disable for your FIrebase project.';
      case 'session_cookie_expired':
        return 'The Firebase session cookie has expired. Please sign in again.';
      case 'uid-already-exists':
        return 'The provided user ID is already in use by another user.';
      case 'sign-in-failed':
        return 'Sign-in failed. Please try again.';
      case 'network-request-failed':
        return 'Network request failed. Please check your internet connection.';
      case 'internal error':
        return 'Internal error. Please try again later.';
      case 'invalid-verification-code':
        return 'Invalid verification code. Please enter a valid code.';
      default:
        return 'An unexpected Platform Exception occurred. Please try again.';
    }
  }
}
