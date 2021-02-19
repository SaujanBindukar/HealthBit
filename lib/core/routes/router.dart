import 'package:auto_route/auto_route_annotations.dart';
import 'package:healthbit/features/Category/category.dart';
import 'package:healthbit/features/GetStarted/getStarted.dart';

@MaterialRouter(generateNavigationHelperExtension: true, routes: <AutoRoute>[
  MaterialRoute(
    initial: true,
    page: GetStarted,
    path: "GetStarted",
    name: "GetStarted",
  ),
  MaterialRoute(
    page: Category,
  )
])
class $HealthBitRouter {}
