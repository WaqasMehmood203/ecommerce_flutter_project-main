import 'package:flutter/material.dart';

class ACircularLoader extends StatelessWidget {
  const ACircularLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color:
          // ignore: deprecated_member_use
          Colors.black.withOpacity(0.3), // Subtle black transparent background
      child: const Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(
              Colors.blue), // Blue color for the loader
        ),
      ),
    );
  }
}
