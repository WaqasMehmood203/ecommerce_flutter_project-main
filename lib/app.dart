import 'package:flutter/material.dart';
import 'package:flutterproject/bindings/general_bindings.dart';
import 'package:flutterproject/features/authentication/screens/onboarding/onboarding.dart';
import 'package:flutterproject/utils/theme/theme.dart';
import 'package:get/get.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: AAppTheme.lightTheme,
      darkTheme: AAppTheme.darkTheme,
      initialBinding: GeneralBindings(),
      ///show loader or circular progress indicator meanwhile authentication repository is deciding to show relevant screen .
      home: OnBoardingScreen(),
    );
  }
}
