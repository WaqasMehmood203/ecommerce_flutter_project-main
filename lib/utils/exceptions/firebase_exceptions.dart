class AFirebaseException implements Exception {
  final String code;

  AFirebaseException(this.code);

  String get message {
    switch (code) {
      case 'unknown':
        return 'An unknown error occurred. Please try again later.';
      case 'invalid-custom-token':
        return 'The custom token provided is invalid.';
      case 'custom-token-mismatch':
        return 'The custom token does not match the expected audience.';
      case 'user-disabled':
        return 'This user account has been disabled. Please contact support.';
      case 'user-not-found':
        return 'No user found with the provided credentials.';
      case 'weak-password':
        return 'The password provided is too weak.';
      case 'email-already-in-use':
        return 'The email is already associated with another account.';
      case 'invalid-email':
        return 'The email address is not valid.';
      case 'wrong-password':
        return 'Incorrect password. Please try again.';
      case 'operation-not-allowed':
        return 'This operation is not allowed. Please contact support.';
      case 'network-request-failed':
        return 'Network error. Please check your connection.';
      case 'quota-exceeded':
        return 'The quota for this operation has been exceeded.';
      case 'requires-recent-login':
        return 'This operation requires a recent login. Please log in again.';
      case 'invalid-verification-code':
        return 'The verification code entered is invalid.';
      case 'invalid-verification-id':
        return 'The verification ID provided is invalid.';
      case 'missing-verification-code':
        return 'Verification code is missing.';
      case 'missing-verification-id':
        return 'Verification ID is missing.';
      case 'too-many-requests':
        return 'Too many requests. Please try again later.';
      case 'invalid-credential':
        return 'The provided credentials are invalid.';
      case 'email-not-verified':
        return 'Your email is not verified.';
      case 'expired-action-code':
        return 'The action code has expired.';
      case 'invalid-action-code':
        return 'The action code provided is invalid.';
      case 'user-token-expired':
        return 'The user token has expired. Please log in again.';
      case 'session-cookie-expired':
        return 'Session cookie has expired. Please log in again.';
      case 'invalid-phone-number':
        return 'The phone number entered is invalid.';
      case 'unverified-email':
        return 'The email address is not verified.';
      case 'captcha-check-failed':
        return 'Captcha verification failed.';
      case 'provider-already-linked':
        return 'This provider is already linked to the account.';
      case 'provider-not-linked':
        return 'This provider is not linked to the account.';
      case 'credential-already-in-use':
        return 'This credential is already in use.';
      case 'admin-restricted-operation':
        return 'This operation is restricted by an administrator.';
      case 'password-login-disabled':
        return 'Password login is disabled for this account.';
      case 'web-context-cancelled':
        return 'The operation was cancelled in the web context.';
      case 'invalid-session-info':
        return 'The session information is invalid.';
      case 'missing-email':
        return 'No email was provided.';
      case 'missing-password':
        return 'No password was provided.';
      case 'email-change-needs-verification':
        return 'Email change requires verification.';
      case 'invalid-oauth-provider':
        return 'The OAuth provider used is invalid.';
      case 'invalid-api-key':
        return 'The API key provided is invalid.';
      case 'app-not-authorized':
        return 'This app is not authorized to use Firebase Authentication.';
      case 'expired-password-reset-link':
        return 'The password reset link has expired.';
      case 'invalid-password-reset-link':
        return 'The password reset link is invalid.';
      case 'expired-email-verification-link':
        return 'The email verification link has expired.';
      case 'invalid-email-verification-link':
        return 'The email verification link is invalid.';
      case 'invalid-user-token':
        return 'The user token is invalid. Please log in again.';
      case 'keychain-error':
        return 'An error occurred accessing the keychain.';
      case 'multi-factor-auth-required':
        return 'Multi-factor authentication is required.';
      case 'second-factor-required':
        return 'Second-factor authentication is required.';
      case 'server-unavailable':
        return 'The server is temporarily unavailable.';
      case 'captcha-verification-failed':
        return 'Captcha verification failed. Please try again.';
      case 'unavailable-service':
        return 'The requested service is temporarily unavailable.';
      case 'invalid-user-info':
        return 'The user information provided is invalid.';
      default:
        return 'An unknown error occurred. Please contact support.';
    }
  }
}
