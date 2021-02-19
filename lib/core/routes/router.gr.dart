// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../features/Category/category.dart';
import '../../features/GetStarted/getStarted.dart';

class Routes {
  static const String GetStarted = 'GetStarted';
  static const String category = '/Category';
  static const all = <String>{
    GetStarted,
    category,
  };
}

class HealthBitRouter extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.GetStarted, page: GetStarted),
    RouteDef(Routes.category, page: Category),
  ];
  @override
  Map<Type, AutoRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, AutoRouteFactory>{
    GetStarted: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const GetStarted(),
        settings: data,
      );
    },
    Category: (data) {
      final args = data.getArgs<CategoryArguments>(
        orElse: () => CategoryArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => Category(key: args.key),
        settings: data,
      );
    },
  };
}

/// ************************************************************************
/// Navigation helper methods extension
/// *************************************************************************

extension HealthBitRouterExtendedNavigatorStateX on ExtendedNavigatorState {
  Future<dynamic> pushGetStarted() => push<dynamic>(Routes.GetStarted);

  Future<dynamic> pushCategory({
    Key key,
  }) =>
      push<dynamic>(
        Routes.category,
        arguments: CategoryArguments(key: key),
      );
}

/// ************************************************************************
/// Arguments holder classes
/// *************************************************************************

/// Category arguments holder class
class CategoryArguments {
  final Key key;
  CategoryArguments({this.key});
}
