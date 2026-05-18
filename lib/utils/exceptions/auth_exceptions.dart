class AFirebaseAuthException implements Exception {
  final String code;

  AFirebaseAuthException(this.code);

  String get message {
    switch (code) {
      case 'email-already-in-use':
        return 'The email address is already registered. Please use a different email.';
      case 'invalid-email':
        return 'The email address provided is invalid. Please enter a valid email.';
      case 'weak-password':
        return 'The password provided is too weak. Please enter a stronger password.';
      case 'user-disabled':
        return 'This user account has been disabled. Please contact support for assistance.';
      case 'user-not-found':
        return 'Invalid login details. User not found.';
      case 'wrong-password':
        return 'Incorrect password. Please check your password and try again.';
      case 'invalid-verification-code':
        return 'Invalid verification code. Please enter a valid code.';
      case 'quota-exceeded':
        return 'Quota exceeded. Please try again later.';
      case 'too-many-requests':
        return 'Too many requests. Please wait a moment and try again.';
      case 'operation-not-allowed':
        return 'This operation is not allowed. Please contact support.';
      case 'network-request-failed':
        return 'Network error. Please check your connection and try again.';
      case 'token-expired':
        return 'Session expired. Please log in again.';
      case 'invalid-api-key':
        return 'Invalid API key. Please contact support.';
      case 'app-not-authorized':
        return 'This app is not authorized to use Firebase Authentication.';
      case 'keychain-error':
        return 'Error accessing the secure keychain. Please check your settings.';
      case 'internal-error':
        return 'An internal error occurred. Please try again later.';
      case 'invalid-user-token':
        return 'The user\'s credential is no longer valid. Please log in again.';
      case 'user-token-expired':
        return 'User token has expired. Please log in again.';
      case 'session-cookie-expired':
        return 'Session cookie has expired. Please log in again.';
      case 'unauthorized-domain':
        return 'This domain is not authorized to perform this operation.';
      case 'captcha-check-failed':
        return 'Captcha verification failed. Please try again.';
      case 'web-context-cancelled':
        return 'Operation cancelled in the web context.';
      case 'invalid-phone-number':
        return 'Invalid phone number. Please enter a valid phone number.';
      case 'invalid-recaptcha-token':
        return 'Invalid reCAPTCHA token. Please refresh and try again.';
      case 'missing-email':
        return 'No email address provided. Please enter an email address.';
      case 'missing-password':
        return 'No password provided. Please enter a password.';
      case 'invalid-custom-token':
        return 'The custom token provided is invalid.';
      case 'custom-token-mismatch':
        return 'The custom token does not match the intended audience.';
      case 'email-change-needs-verification':
        return 'Email change requires verification. Please verify your email.';
      case 'credential-already-in-use':
        return 'This credential is already linked to another account.';
      case 'requires-recent-login':
        return 'This operation requires a recent login. Please log in again.';
      case 'account-exists-with-different-credential':
        return 'An account already exists with a different credential.';
      case 'provider-already-linked':
        return 'This provider is already linked to the user\'s account.';
      case 'provider-not-linked':
        return 'This provider is not linked to the user\'s account.';
      case 'second-factor-required':
        return 'Two-factor authentication is required for this operation.';
      case 'multi-factor-auth-required':
        return 'Multi-factor authentication is required for this operation.';
      case 'invalid-credential':
        return 'The credential provided is invalid. Please try again.';
      case 'missing-credential':
        return 'No credential provided. Please provide a valid credential.';
      case 'email-already-exists':
        return 'The email provided is already associated with another account.';
      case 'admin-restricted-operation':
        return 'This operation is restricted by an administrator.';
      case 'unverified-email':
        return 'Your email address is not verified. Please verify it.';
      case 'expired-action-code':
        return 'The action code has expired. Please request a new one.';
      case 'invalid-action-code':
        return 'The action code provided is invalid.';
      case 'user-disabled-by-admin':
        return 'This account has been disabled by an administrator.';
      case 'password-login-disabled':
        return 'Password-based login is disabled for this account.';
      case 'invalid-email-verification-link':
        return 'The email verification link is invalid.';
      case 'expired-email-verification-link':
        return 'The email verification link has expired.';
      case 'expired-password-reset-link':
        return 'The password reset link has expired.';
      case 'invalid-password-reset-link':
        return 'The password reset link is invalid.';
      case 'invalid-oauth-provider':
        return 'The OAuth provider used is invalid.';
      case 'missing-oauth-token':
        return 'No OAuth token provided. Please try again.';
      case 'missing-verification-code':
        return 'No verification code provided. Please enter the code.';
      case 'missing-verification-id':
        return 'No verification ID provided. Please try again.';
      case 'invalid-verification-id':
        return 'The verification ID is invalid. Please try again.';
      case 'invalid-session-info':
        return 'Session information is invalid or has expired.';
      case 'captcha-verification-failed':
        return 'Captcha verification failed. Please refresh and try again.';
      case 'unavailable-service':
        return 'The requested service is temporarily unavailable.';
      case 'server-unavailable':
        return 'The server is temporarily unavailable. Please try again later.';
      case 'invalid-user-info':
        return 'The user information provided is invalid.';
      default:
        return 'An unknown error occurred. Please try again later.';
    }
  }
}
