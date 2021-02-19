// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../features/Category/category.dart';
import '../../features/GetStarted/getStarted.dart';
import '../../features/Login/login.dart';
import '../../features/SignUp/signup.dart';

class Routes {
  static const String GetStarted = 'GetStarted';
  static const String category = '/Category';
  static const String login = '/Login';
  static const String signUp = '/sign-up';
  static const all = <String>{
    GetStarted,
    category,
    login,
    signUp,
  };
}

class HealthBitRouter extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.GetStarted, page: GetStarted),
    RouteDef(Routes.category, page: Category),
    RouteDef(Routes.login, page: Login),
    RouteDef(Routes.signUp, page: SignUp),
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
    Login: (data) {
      final args = data.getArgs<LoginArguments>(
        orElse: () => LoginArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => Login(
          key: args.key,
          patient: args.patient,
        ),
        settings: data,
      );
    },
    SignUp: (data) {
      final args = data.getArgs<SignUpArguments>(
        orElse: () => SignUpArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => SignUp(
          key: args.key,
          patient: args.patient,
        ),
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

  Future<dynamic> pushLogin({
    Key key,
    bool patient,
  }) =>
      push<dynamic>(
        Routes.login,
        arguments: LoginArguments(key: key, patient: patient),
      );

  Future<dynamic> pushSignUp({
    Key key,
    bool patient,
  }) =>
      push<dynamic>(
        Routes.signUp,
        arguments: SignUpArguments(key: key, patient: patient),
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

/// Login arguments holder class
class LoginArguments {
  final Key key;
  final bool patient;
  LoginArguments({this.key, this.patient});
}

/// SignUp arguments holder class
class SignUpArguments {
  final Key key;
  final bool patient;
  SignUpArguments({this.key, this.patient});
}