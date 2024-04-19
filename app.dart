
import 'package:bh_int/utils/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'featuers/authentication/screens/onboarding/onboarding.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      themeMode:ThemeMode.system,
      theme:TAppTheme.lightTheam ,
      darkTheme: TAppTheme.darkTheme,
      home: const OnBoardingScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}