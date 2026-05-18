class APlatformException implements Exception {
  final String message;

  const APlatformException(
      [this.message = 'An unexpected platform error occurred. Please try again.']);

  factory APlatformException.fromCode(String code) {
    switch (code) {
      case 'platform-unavailable':
        return const APlatformException(
            'The platform is currently unavailable. Please try again later.');
      case 'unsupported-platform':
        return const APlatformException(
            'The operation is not supported on this platform.');
      case 'missing-permissions':
        return const APlatformException(
            'Required permissions are missing. Please grant the necessary permissions.');
      case 'file-not-found':
        return const APlatformException(
            'The requested file was not found on the platform.');
      case 'storage-full':
        return const APlatformException(
            'The platform storage is full. Please free up some space and try again.');
      case 'network-unavailable':
        return const APlatformException(
            'Network connectivity is unavailable. Please check your connection.');
      case 'invalid-platform-operation':
        return const APlatformException(
            'The operation attempted is invalid on this platform.');
      case 'service-unavailable':
        return const APlatformException(
            'The requested service is unavailable on this platform.');
      case 'platform-initialization-failed':
        return const APlatformException(
            'Failed to initialize the platform. Please restart the application.');
      case 'invalid-platform-version':
        return const APlatformException(
            'The platform version is not supported for this operation.');
      case 'authentication-failed':
        return const APlatformException(
            'Authentication with the platform failed. Please check your credentials.');
      case 'api-deprecated':
        return const APlatformException(
            'The API used is deprecated on this platform. Please update your application.');
      case 'hardware-not-supported':
        return const APlatformException(
            'The required hardware is not supported on this platform.');
      case 'timeout':
        return const APlatformException(
            'The operation timed out on the platform. Please try again.');
      case 'operation-aborted':
        return const APlatformException(
            'The operation was aborted on the platform.');
      case 'file-read-failed':
        return const APlatformException(
            'Failed to read the file from the platform.');
      case 'file-write-failed':
        return const APlatformException(
            'Failed to write the file to the platform.');
      case 'insufficient-storage':
        return const APlatformException(
            'The platform does not have enough storage for this operation.');
      case 'hardware-failure':
        return const APlatformException(
            'A hardware failure occurred on the platform.');
      case 'unsupported-media-format':
        return const APlatformException(
            'The media format is not supported on this platform.');
      case 'invalid-configuration':
        return const APlatformException(
            'The platform configuration is invalid. Please review your settings.');
      case 'dependency-missing':
        return const APlatformException(
            'A required dependency is missing on the platform.');
      case 'user-denied':
        return const APlatformException(
            'The user denied the requested operation on the platform.');
      case 'service-timeout':
        return const APlatformException(
            'The requested service timed out on the platform.');
      case 'operation-not-allowed':
        return const APlatformException(
            'This operation is not allowed on the platform.');
      case 'license-expired':
        return const APlatformException(
            'The platform license has expired. Please renew your license.');
      case 'hardware-disconnected':
        return const APlatformException(
            'The required hardware has been disconnected.');
      case 'driver-missing':
        return const APlatformException(
            'A required driver is missing on the platform.');
      case 'platform-restricted':
        return const APlatformException(
            'Access to the platform is restricted. Please contact the administrator.');
      case 'app-blocked':
        return const APlatformException(
            'The application has been blocked on this platform.');
      default:
        return const APlatformException();
    }
  }

  @override
  String toString() => 'APlatformException: $message';
}
