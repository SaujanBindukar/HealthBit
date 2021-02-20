import 'package:auto_route/auto_route.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:healthbit/core/routes/router.gr.dart';

import 'core/utils/screenutil_setup.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilSetup(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        darkTheme: ThemeData.dark(),
        onGenerateRoute: HealthBitRouter(),
        builder: ExtendedNavigator.builder(
          router: HealthBitRouter(),
          initialRoute: "GetStarted",
          builder: (context, child) => Theme(
            data: ThemeData(brightness: Brightness.light),
            child: child,
          ),
        ),
      ),
    );
  }
}
