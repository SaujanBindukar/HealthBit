import 'package:auto_route/auto_route_annotations.dart';
import 'package:healthbit/features/Category/category.dart';
import 'package:healthbit/features/GetStarted/getStarted.dart';
import 'package:healthbit/features/Login/login.dart';
import 'package:healthbit/features/SignUp/signup.dart';

@MaterialRouter(generateNavigationHelperExtension: true, routes: <AutoRoute>[
  MaterialRoute(
    initial: true,
    page: GetStarted,
    path: "GetStarted",
    name: "GetStarted",
  ),
  MaterialRoute(
    page: Category,
  ),
  MaterialRoute(
    page: Login,
  ),
  MaterialRoute(
    page: SignUp,
  )
])
class $HealthBitRouter {}
